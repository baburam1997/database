-- Join Operations
--     Inner Join
--         Equijoin: A type of inner join that matches rows based on equality of specified columns in both tables.
--              Syntax:
--                  SELECT R1.Attribute1, R1.Attribute2, ..., R1.AttributeN
--                  FROM Relation1 R1
--                  INNER JOIN Relation2 R2
--                  ON R1.KeyAttribute = R2.KeyAttribute;
--              Example Query:
                    SELECT 
                        s.student_id, s.fname, s.lname, s.age, c.course_name, c.credits,s.course_id s_course_id, c.course_id c_course_id
                    FROM joins.students s
                    INNER JOIN joins.courses c
                    ON s.course_id = c.course_id;
--         Natural Join: An inner join that automatically matches columns with the same name in both tables,
--          removing duplicate columns.
--              Syntax:
--                  SELECT R1.Attribute1, R1.Attribute2, ..., R1.AttributeN
--                  FROM Relation1 R1
--                  INNER JOIN Relation2 R2
--                  ON R1.KeyAttribute = R2.KeyAttribute;
--              Example Query:
                    SELECT 
                        s.student_id, s.fname, s.lname, s.age, c.course_name, c.credits,s.course_id s_course_id, c.course_id c_course_id
                    FROM joins.students s
                    INNER JOIN joins.courses c
                    ON s.course_id < c.course_id; -- Non-standard us
--     Outer Join
--         Left Outer Join: Returns all rows from the left table and the matched rows from the right table; 
--          rows from the left table with no match in the right table will have NULL values.
--              Syntax:
--                  SELECT R1.Attribute1, R1.Attribute2, ..., R1.AttributeN
--                  FROM Relation1 R1
--                  OUTER LEFT JOIN Relation2 R2
--                  ON R1.KeyAttribute = R2.KeyAttribute;
--              Example Query:
                    SELECT 
                        s.student_id, s.fname, s.lname, s.age, c.course_name, c.credits
                    FROM joins.students AS s
                    LEFT OUTER JOIN joins.courses AS c
                    ON s.course_id = c.course_id;


--         Right Outer Join: Returns all rows from the right table and the matched rows from the left table; 
--          rows from the right table with no match in the left table will have NULL values.
--              Syntax:
--                  SELECT R1.Attribute1, R1.Attribute2, ..., R1.AttributeN
--                  FROM Relation1 R1
--                  RIGHT OUTER JOIN Relation2 R2
--                  ON R1.KeyAttribute = R2.KeyAttribute;
--              Example Query:
                    SELECT 
                        s.student_id, s.fname, s.lname, s.age, c.course_name, c.credits
                    FROM joins.students AS s
                    RIGHT OUTER JOIN joins.courses AS c
                    ON s.course_id = c.course_id;

--         Full Outer Join: Returns all rows when there is a match in either the left or right table; 
--          unmatched rows from both tables will have NULL values.
--              Syntax:
--                  SELECT R1.Attribute1, R1.Attribute2, ..., R1.AttributeN
--                  FROM Relation1 R1
--                  FULL OUTER JOIN Relation2 R2
--                  ON R1.KeyAttribute = R2.KeyAttribute;
--              Example Query:
                    SELECT 
                        s.student_id, s.fname, s.lname, s.age, c.course_name, c.credits
                    FROM joins.students AS s
                    FULL OUTER JOIN joins.courses AS c
                    ON s.course_id = c.course_id;