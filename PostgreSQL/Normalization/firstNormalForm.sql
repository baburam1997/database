
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