INSERT INTO joins.courses (course_name, credits) VALUES
('Mathematics', 4),
('Physics', 3),
('Chemistry', 4),
('Biology', 3),
('Computer Science', 4),
('History', 3),
('Art', 2),
('IOT', 4);

INSERT INTO joins.students (fname, lname, age, course_id) VALUES
-- Students taking courses
('Alice', 'Johnson', 20, 1), -- Enrolled in Mathematics
('Bob', 'Smith', 21, 2),   -- Enrolled in Physics
('Charlie', 'Williams', 22, 3), -- Enrolled in Chemistry
('David', 'Brown', 20, 4), -- Enrolled in Biology
('Eve', 'Jones', 21, 5),   -- Enrolled in Computer Science
('Frank', 'Davis', 22, NULL), -- Not enrolled in any course
('Grace', 'Miller', 23, 6), -- Enrolled in History
('Hannah', 'Wilson', 24, 7), -- Enrolled in Art
('Ivy', 'Moore', 22, NULL), -- Not enrolled in any course
('Jack', 'Taylor', 20, NULL); -- Not enrolled in any course