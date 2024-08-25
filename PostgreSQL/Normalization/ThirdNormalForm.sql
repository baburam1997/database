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

