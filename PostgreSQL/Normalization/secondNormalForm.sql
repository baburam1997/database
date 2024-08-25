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
