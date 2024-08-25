
-- Relational Algebra Operations

    -- Selection (σ): Filters rows based on a condition.
        -- Syntax:
            -- σ Condition (Relation)
        -- Example:
            -- σ {age > 21} (students)
        -- Query:
            SELECT * FROM raw_db.relationalalgebra.students WHERE age > 21;

    -- Projection (π): Selects specific columns from the table.
        -- Syntax:
            -- σ Condition(π {Attribute1, Attribute2, Attribute3,..} (Relation))
            -- π {Attribute1, Attribute2, Attribute3,..} (σ Condition (Relation))
        -- Example:
            -- σ {age > 21} (π {fname, age} (students))
            -- π {fname, age} (σ {age > 21} (students))
        -- Query:
            SELECT * FROM (SELECT fname, age FROM raw_db.relationalalgebra.students) WHERE age > 21;
            SELECT fname, age FROM(SELECT * FROM raw_db.relationalalgebra.students WHERE age > 21);

    -- Combinining Selection (σ) and Projection (π)
        -- Syntax:
            -- π {Attribute1, Attribute2, Attribute3,..} (Relation)
        -- Example:
            -- π {fname, age} (students)
        -- Query:
            SELECT fname, age FROM raw_db.relationalalgebra.students;

    -- Renaming (ρ): Renames a table or columns.
        -- Syntax for table:
            -- ρ {new Relation name} (old Relation name)
        -- Example:
            -- ρ {StudentDetails} (students)
            -- Renames the students table to StudentDetails
        -- Query:
            ALTER TABLE raw_db.relationalalgebra.students RENAME TO StudentDetails;
		-- SELECT * FROM raw_db.relationalalgebra.StudentDetails WHERE age > 21;
        
        -- Syntax for column:
            -- ρ {new Column name / old Column name}(Relation)
        -- Example:
            -- ρ {firstname / fname}(StudentDetails)
            -- Renames the fname column to firstname in the StudentDetails table
        -- Query:
            SELECT fname AS firstname FROM raw_db.relationalalgebra.StudentDetails;

    -- Union (∪): Combines results from two sets, removing duplicates.
        -- Syntax:
            -- π {Attribute(s)} (Relation1) ∪ π {Attribute(s)} (Relation2)
        -- Example:
            -- π {course_id} (StudentDetails) ∪ π {course_id} (AnotherRelation)
        -- Query:
            SELECT course_id FROM raw_db.relationalalgebra.StudentDetails
            UNION
            SELECT course_id FROM raw_db.relationalalgebra.courses;

    -- Set Difference (−): Retrieves items from the first set that aren't in the second set.
        -- Syntax:
            -- π {Attribute(s)} (Relation1) − π {Attribute(s)} (Relation1 WHERE Condition(s))
        -- Example:
            -- π {lname} (StudentDetails) − π {lname} (StudentDetails WHERE course_id = 2)
        -- Query:
            SELECT lname FROM raw_db.relationalalgebra.StudentDetails
            EXCEPT
            SELECT lname FROM raw_db.relationalalgebra.StudentDetails WHERE course_id = 2;

    -- Intersection (∩): Retrieves items common to both sets.
        -- Syntax:
            -- π {Attribute(s)} (Relation1) ∩ π {Attribute(s)} (Relation1 WHERE Condition)
        -- Example:
            -- π {lname} (StudentDetails) ∩ π {lname} (StudentDetails WHERE age > 21)
        -- Query:
            SELECT lname FROM raw_db.relationalalgebra.StudentDetails
            INTERSECT
            SELECT lname FROM raw_db.relationalalgebra.StudentDetails WHERE age > 21;

    -- Cartesian Product (×): Combines all rows from two tables, forming all possible pairs.
        -- Syntax:
            -- Relation1 × Relation2
        -- Example:
            -- StudentDetails × courses
        -- Query:
            SELECT * FROM raw_db.relationalalgebra.StudentDetails, raw_db.relationalalgebra.courses;

    -- Division (÷): Finds all items in one set that are related to all items in another set.
        -- Syntax:
            -- π {Attribute1} (Relation1) ÷ π {Attribute1} (Relation2)
        -- Example:
            -- π {student_id} (StudentDetails) ÷ π {course_id} (courses)
        -- Query:
            SELECT DISTINCT sd.student_id
			FROM raw_db.relationalalgebra.StudentDetails sd
			WHERE NOT EXISTS (
			    SELECT c.course_id
			    FROM raw_db.relationalalgebra.courses c
			    WHERE EXISTS (
			        SELECT s2.student_id
			        FROM raw_db.relationalalgebra.StudentDetails s2
			        WHERE s2.course_id = c.course_id AND s2.student_id = sd.student_id
			    )
			);





