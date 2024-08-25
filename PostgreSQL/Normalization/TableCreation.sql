-- Create Schema
CREATE SCHEMA Normalization;

-- Create Unnormalized Student Courses Table
CREATE TABLE Normalization.student_courses_unnormalized (
    student_id INTEGER,
    student_name VARCHAR(50),
    courses TEXT, -- This will store multiple courses in a single cell
    semester VARCHAR(10),
    grades TEXT -- This will store multiple grades in a single cell
);