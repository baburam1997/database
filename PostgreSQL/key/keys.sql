-- Create Schema
CREATE SCHEMA keys;

-- Create Students Table
CREATE TABLE keys.students (
    student_id SERIAL PRIMARY KEY,  -- Primary Key
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE  -- Unique Key
);

-- Create Courses Table
CREATE TABLE keys.courses (
    course_id SERIAL PRIMARY KEY,  -- Primary Key
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER
);

-- Create Enrollments Table
CREATE TABLE keys.enrollments (
    enrollment_id SERIAL PRIMARY KEY,  -- Primary Key
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES keys.students(student_id),  -- Foreign Key
    FOREIGN KEY (course_id) REFERENCES keys.courses(course_id),  -- Foreign Key
    UNIQUE (student_id, course_id)  -- Composite Key (Unique Key Constraint)
);

-- Insert Sample Data into Students Table
INSERT INTO keys.students (fname, lname, email) VALUES
('Alice', 'Smith', 'alice.smith@example.com'),
('Bob', 'Johnson', 'bob.johnson@example.com'),
('Charlie', 'Williams', 'charlie.williams@example.com');

-- Insert Sample Data into Courses Table
INSERT INTO keys.courses (course_name, credits) VALUES
('Mathematics', 4),
('Physics', 3),
('Chemistry', 4);

-- Insert Sample Data into Enrollments Table
INSERT INTO keys.enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-15'),
(1, 2, '2024-01-16'),
(2, 2, '2024-01-17'),
(3, 3, '2024-01-18');

-- Primary Key:
--      students.student_id and courses.course_id are primary keys, ensuring each row in these tables is uniquely identifiable.
-- Unique Key:
--      students.email is a unique key, ensuring no two students can have the same email address.
-- Composite Key:
--      In the enrollments table, the combination of student_id and course_id is a composite key, 
--       ensuring that a student cannot enroll in the same course more than once. This is enforced with a UNIQUE constraint.
-- Foreign Key:
--      enrollments.student_id and enrollments.course_id are foreign keys that reference students.student_id and courses.course_id, respectively.
--       This establishes relationships between the tables.
-- Alternate Key:
--      email is an alternate key because it's a candidate key not chosen as the primary key.
-- Super Key:
--      (student_id, fname): This combination is also a super key, though student_id alone suffices for uniqueness. 
--       Adding fname is redundant but still makes a super key.
