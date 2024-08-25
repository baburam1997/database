CREATE SCHEMA RelationalAlgebra;

CREATE TABLE raw_db.relationalalgebra.students (
    student_id SERIAL PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INTEGER,
    course_id INTEGER
);

CREATE TABLE raw_db.relationalalgebra.courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    credits INTEGER
);


