-- Insert Sample Data into Unnormalized Table
INSERT INTO Normalization.student_courses_unnormalized 
	(student_id, student_name, courses, semester, grades) 
VALUES
	(1, 'Alice Smith', 'Mathematics,Physics', 'Fall 2024', 'A,B'),
	(2, 'Bob Johnson', 'Mathematics,Chemistry', 'Fall 2024', 'C,B'),
	(3, 'Charlie Williams', 'Physics,Biology', 'Fall 2024', 'A,B'),
	(4, 'Diana Scott', 'Chemistry,Computer Science', 'Fall 2024', 'A,C'),
	(5, 'Evan Clark', 'Mathematics,Biology', 'Spring 2024', 'B,A');
	
