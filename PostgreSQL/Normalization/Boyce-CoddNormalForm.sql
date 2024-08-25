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