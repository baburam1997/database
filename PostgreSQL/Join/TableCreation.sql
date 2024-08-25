-- Create Tables in Schema joins
-- First, ensure the schema joins exists:

CREATE SCHEMA IF NOT EXISTS joins;
-- Create courses Table

CREATE TABLE joins.courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    credits INTEGER
);

-- Create students Table
CREATE TABLE joins.students (
    student_id SERIAL PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INTEGER,
    course_id INTEGER,
    FOREIGN KEY (course_id) REFERENCES joins.courses(course_id)
);