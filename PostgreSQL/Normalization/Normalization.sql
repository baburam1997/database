-- Create Schema
CREATE SCHEMA Normalization;

-- Create Unnormalized Student Courses Table
CREATE TABLE Normalization.student_courses_unnormalized (
    student_id INTEGER,
    student_name VARCHAR(50),
    courses TEXT, -- This will store multiple courses in a single cell
    semester VARCHAR(20),
    grades TEXT -- This will store multiple grades in a single cell
);

-- Insert Sample Data into Unnormalized Table
INSERT INTO Normalization.student_courses_unnormalized 
	(student_id, student_name, courses, semester, grades) 
VALUES
	(1, 'Alice Smith', 'Mathematics,Physics', 'Fall 2024', 'A,B'),
	(2, 'Bob Johnson', 'Mathematics,Chemistry', 'Fall 2024', 'C,B'),
	(3, 'Charlie Williams', 'Physics,Biology', 'Fall 2024', 'A,B'),
	(4, 'Diana Scott', 'Chemistry,Computer Science', 'Fall 2024', 'A,C'),
	(5, 'Evan Clark', 'Mathematics,Biology', 'Spring 2024', 'B,A');


-- Noramal Forms
    -- First Normal Form (1NF)
    -- To achieve 1NF, we need to ensure that:
        -- Each column contains only atomic (indivisible) values.
        -- Each record is unique.
    -- In the unnormalized table above, the courses and grades columns contain multiple values in a single cell, which violates 1NF.
    -- Steps to Normalize to 1NF
        -- 1. Decompose the Table: Separate the repeating groups (courses and grades) into individual rows.
        -- 2. Create a New Normalized Table
            -- Create Normalized Table in 1NF
            CREATE TABLE Normalization.student_courses_1nf (
                student_id INTEGER,
                student_name VARCHAR(50),
                course_name VARCHAR(100),
                semester VARCHAR(20),
                grade CHAR(1),
                PRIMARY KEY (student_id, course_name, semester)  -- Composite Key to ensure uniqueness
            );
        -- 3. Insert Normalized Data
            -- To convert the unnormalized data to 1NF, insert each course and grade into its own row:
            -- Insert Normalized Data into 1NF Table
            INSERT INTO Normalization.student_courses_1nf 
                (student_id, student_name, course_name, semester, grade) 
            VALUES
                (1, 'Alice Smith', 'Mathematics', 'Fall 2024', 'A'),
                (1, 'Alice Smith', 'Physics', 'Fall 2024', 'B'),
                (2, 'Bob Johnson', 'Mathematics', 'Fall 2024', 'C'),
                (2, 'Bob Johnson', 'Chemistry', 'Fall 2024', 'B'),
                (3, 'Charlie Williams', 'Physics', 'Fall 2024', 'A'),
                (3, 'Charlie Williams', 'Biology', 'Fall 2024', 'B'),
                (4, 'Diana Scott', 'Chemistry', 'Fall 2024', 'A'),
                (4, 'Diana Scott', 'Computer Science', 'Fall 2024', 'C'),
                (5, 'Evan Clark', 'Mathematics', 'Spring 2024', 'B'),
                (5, 'Evan Clark', 'Biology', 'Spring 2024', 'A');

    -- Second Normal Form (2NF)
    -- To achieve 2NF, we need to ensure that:
        -- Must be in Normal Form (1NF):
        -- Eliminates Partial Dependencies:
                -- In a table with a composite primary key, all non-key attributes must be fully functionally dependent on the entire primary key, not just part of it.
        
        -- To apply Second Normal Form (2NF) on the Normalization.student_courses_1nf table, we need to identify and eliminate partial dependencies.
        -- Steps to Normalize to 2NF
            -- 1. Identify Partial Dependencies:
                -- student_name depends on only student_id, not the full composite key.
            -- 2. Create Separate Tables:
                -- Students Table: Store student_id and student_name in a separate table.
                CREATE TABLE Normalization.students_2nf (
                    student_id INTEGER PRIMARY KEY,
                    student_name VARCHAR(50)
                );
                INSERT INTO Normalization.students_2nf 
                    (student_id, student_name) 
                VALUES
                    (1, 'Alice Smith'),
                    (2, 'Bob Johnson'),
                    (3, 'Charlie Williams'),
                    (4, 'Diana Scott'),
                    (5, 'Evan Clark');
            -- 3. Update the Original Table:
                -- The main table (now enrollments) should include only the fields that fully depend on the composite key.
                CREATE TABLE Normalization.enrollments_2nf (
                    student_id INTEGER,
                    course_name VARCHAR(100),
                    semester VARCHAR(20),
                    grade CHAR(1),
                    PRIMARY KEY (student_id, course_name, semester),
                    FOREIGN KEY (student_id) REFERENCES Normalization.students_2nf(student_id)
                );
                INSERT INTO Normalization.enrollments_2nf 
                    (student_id, course_name, semester, grade)
                VALUES
                    (1, 'Mathematics', 'Fall 2024', 'A'),
                    (1, 'Physics', 'Fall 2024', 'B'),
                    (2, 'Mathematics', 'Fall 2024', 'C'),
                    (2, 'Chemistry', 'Fall 2024', 'B'),
                    (3, 'Physics', 'Fall 2024', 'A'),
                    (3, 'Biology', 'Fall 2024', 'B'),
                    (4, 'Chemistry', 'Fall 2024', 'A'),
                    (4, 'Computer Science', 'Fall 2024', 'C'),
                    (5, 'Mathematics', 'Spring 2024', 'B'),
                    (5, 'Biology', 'Spring 2024', 'A');

    -- Third Normal Form (3NF)
        -- To achieve Third Normal Form (3NF), we need to ensure that
            -- The table is in Second Normal Form (2NF)
            -- Eliminate transitive dependencies. 
                -- A transitive dependency occurs when a non-key attribute depends on another non-key attribute rather than directly on the primary key.
        -- Steps to Normalize to 3NF
            -- used students_2nf to students_3nf
            CREATE TABLE Normalization.students_3nf (
                    student_id INTEGER PRIMARY KEY,
                    student_name VARCHAR(50)
                );
                INSERT INTO Normalization.students_3nf 
                    (student_id, student_name) 
                VALUES
                    (1, 'Alice Smith'),
                    (2, 'Bob Johnson'),
                    (3, 'Charlie Williams'),
                    (4, 'Diana Scott'),
                    (5, 'Evan Clark');
            -- 1. Create a Departments Table
                -- Create a Departments Table
                CREATE TABLE Normalization.departments_3nf (
                    department_id SERIAL PRIMARY KEY,
                    department_name VARCHAR(50) UNIQUE
                );
                INSERT INTO Normalization.departments_3nf (department_name) VALUES
                ('Science'),
                ('Engineering'),
                ('Arts');

            -- 2. Modify the Courses Table
                -- Modify Courses Table to Include Department ID
                CREATE TABLE Normalization.courses_3nf (
                    course_name VARCHAR(100) PRIMARY KEY,
                    department_id INTEGER,
                    FOREIGN KEY (department_id) REFERENCES Normalization.departments(department_id)
                );

                -- Insert Data into Courses Table with Department ID
                INSERT INTO Normalization.courses_3nf
                    (course_name, department_id) 
                VALUES
                    ('Mathematics', 1),  -- Science Department
                    ('Physics', 1),      -- Science Department
                    ('Chemistry', 1),    -- Science Department
                    ('Biology', 1),      -- Science Department
                    ('Computer Science', 2); -- Engineering Department

            -- 3. Modify the Enrollments Table
            -- The enrollments table doesn't need modification since it directly references the courses table by course_name.
                -- Enrollments Table remains the same as in 2NF
                CREATE TABLE Normalization.enrollments_3nf (
                    student_id INTEGER,
                    course_name VARCHAR(100),
                    semester VARCHAR(20),
                    grade CHAR(1),
                    PRIMARY KEY (student_id, course_name, semester),
                    FOREIGN KEY (student_id) REFERENCES Normalization.students_3nf(student_id),
                    FOREIGN KEY (course_name) REFERENCES Normalization.courses_3nf(course_name)
                );

                -- Insert Data into Enrollments Table (Data remains the same)
                INSERT INTO Normalization.enrollments_3nf 
                    (student_id, course_name, semester, grade) 
                VALUES
                    (1, 'Mathematics', 'Fall 2024', 'A'),
                    (1, 'Physics', 'Fall 2024', 'B'),
                    (2, 'Mathematics', 'Fall 2024', 'C'),
                    (2, 'Chemistry', 'Fall 2024', 'B'),
                    (3, 'Physics', 'Fall 2024', 'A'),
                    (3, 'Biology', 'Fall 2024', 'B'),
                    (4, 'Chemistry', 'Fall 2024', 'A'),
                    (4, 'Computer Science', 'Fall 2024', 'C'),
                    (5, 'Mathematics', 'Spring 2024', 'B'),
                    (5, 'Biology', 'Spring 2024', 'A');

    -- Boyce-Codd Normal Form (BCNF)
        -- To achieve Boyce-Codd Normal Form (BCNF), we need to ensure that
            -- The table is already in Third Normal Form (3NF):
            -- For every non-trivial functional dependency (X -> Y), X must be a superkey:
                -- A non-trivial functional dependency means that the left-hand side (X) of the dependency does not completely determine the right-hand side (Y).
                -- A superkey is any combination of attributes that can uniquely identify a row in the table.
        -- Steps to Normalize to 3NF
            -- Step 1: Create the Instructors Table
                -- This table will store the relationship between instructor_name and course_name, which was causing the BCNF violation.
                -- Create Instructors_BCNF Table with composite primary key
					CREATE TABLE Normalization.Instructors_BCNF (
					    instructor_name VARCHAR(100),
					    course_name VARCHAR(100),
					    semester VARCHAR(20),
					    PRIMARY KEY (course_name, semester)
					);
					
					-- Insert Data into Instructors_BCNF Table
					INSERT INTO Normalization.Instructors_BCNF (instructor_name, course_name, semester) VALUES
					('Dr. Smith', 'Mathematics', 'Fall 2024'),
					('Dr. Johnson', 'Physics', 'Fall 2024'),
					('Dr. Williams', 'Chemistry', 'Fall 2024'),
					('Dr. Scott', 'Biology', 'Fall 2024'),
					('Dr. Clark', 'Computer Science', 'Fall 2024'),
					('Dr. Smith', 'Mathematics', 'Spring 2024');

            -- Step 2: Create the Enrollments_BCNF Table
                -- This table represents the enrollment information and now references the Instructors table to ensure BCNF compliance.
                -- Create Enrollments_BCNF Table with composite foreign key
					CREATE TABLE Normalization.Enrollments_BCNF (
					    student_id INTEGER,
					    course_name VARCHAR(100),
					    semester VARCHAR(20),
					    PRIMARY KEY (student_id, course_name, semester),
					    FOREIGN KEY (course_name, semester) REFERENCES Normalization.Instructors_BCNF(course_name, semester)
					);
;
					-- Insert Data into Enrollments_BCNF Table
					INSERT INTO Normalization.Enrollments_BCNF (student_id, course_name, semester) VALUES
					(1, 'Mathematics', 'Fall 2024'),
					(1, 'Physics', 'Fall 2024'),
					(2, 'Mathematics', 'Fall 2024'),
					(2, 'Chemistry', 'Fall 2024'),
					(3, 'Physics', 'Fall 2024'),
					(3, 'Biology', 'Fall 2024'),
					(4, 'Chemistry', 'Fall 2024'),
					(4, 'Computer Science', 'Fall 2024'),
					(5, 'Mathematics', 'Spring 2024');

            -- Step 3: (Optional) Create Students Table
                -- Although not strictly necessary for BCNF, having a students table can be useful for managing student information.
                    -- Create Students Table
                    CREATE TABLE Normalization.Students_BCNF (
                        student_id INTEGER PRIMARY KEY,
                        student_name VARCHAR(100)
                    );

                    -- Insert Data into Students Table
                    INSERT INTO Normalization.Students_BCNF 
                        (student_id, student_name) 
                    VALUES
                        (1, 'Alice Smith'),
                        (2, 'Bob Johnson'),
                        (3, 'Charlie Williams'),
                        (4, 'Diana Scott'),
                        (5, 'Evan Clark');
                        
    -- -- Fourth Normal Form (4NF)
        -- To achieve Fourth Normal Form (4NF), we need to ensure that
            -- the table must first be in Boyce-Codd Normal Form (BCNF), and 
            -- it must not have any non-trivial multivalued dependencies.
        -- Steps to Implement 4NF
            -- Step 1: Create the Student_Activities Table
                -- This table will store the relationship between students and their extracurricular activities.
                CREATE TABLE Normalization.Student_Activities_4NF (
                    student_id INTEGER,
                    activity_name VARCHAR(100),
                    PRIMARY KEY (student_id, activity_name),
                    FOREIGN KEY (student_id) REFERENCES Normalization.Students_BCNF(student_id)
                );

            -- Insert Data into Student_Activities_4NF Table
                INSERT INTO Normalization.Student_Activities_4NF 
                    (student_id, activity_name) 
                VALUES
                    (1, 'Football'),
                    (1, 'Debate Club'),
                    (2, 'Basketball'),
                    (3, 'Music Club'),
                    (4, 'Drama Club'),
                    (4, 'Debate Club'),
                    (5, 'Football');
            -- Step 2: Split the Enrollments_BCNF Table (already BCNF compliant)
                -- Enrollments_BCNF: Handles student course enrollments.
                -- Student_Activities_4NF: Handles student activities.

    -- Final Database Structure
    -- Students_BCNF Table (Normalization.Students_BCNF):

    -- student_id: Primary key for the student.
    -- student_name: Name of the student.
    -- Instructors_BCNF Table (Normalization.Instructors_BCNF):

    -- instructor_name: Name of the instructor.
    -- course_name: Name of the course.
    -- semester: Semester in which the course is taught.
    -- Enrollments_BCNF Table (Normalization.Enrollments_BCNF):

    -- student_id: References the student.
    -- course_name: References the course.
    -- semester: References the semester of enrollment.
    -- Student_Activities_4NF Table (Normalization.Student_Activities_4NF):

    -- student_id: References the student.
    -- activity_name: The extracurricular activity the student is involved in.