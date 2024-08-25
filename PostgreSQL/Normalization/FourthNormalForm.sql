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