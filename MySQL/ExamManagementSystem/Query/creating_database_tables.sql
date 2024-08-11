
CREATE DATABASE ExamManagementSystem;

USE ExamManagementSystem;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(5),
    Email VARCHAR(5),
    Contact_Number VARCHAR(8),
    Address TEXT
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_Name VARCHAR(30),
    Course_Description TEXT,
    Credits INT
);

CREATE TABLE Subject (
    Subject_ID INT PRIMARY KEY AUTO_INCREMENT,
    Subject_Name VARCHAR(100),
    Subject_Code VARCHAR(50),
    Credits INT
);

CREATE TABLE Exam (
    Exam_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_ID INT,
    Exam_Date DATE,
    Total_Marks INT,
    Passing_Marks INT,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Result (
    Result_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT,
    Exam_ID INT,
    Marks_Obtained INT,
    Grade CHAR(2),
    Result_Status VARCHAR(10),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID)
);

CREATE TABLE Exam_Center (
    Center_ID INT PRIMARY KEY AUTO_INCREMENT,
    Center_Name VARCHAR(100),
    Location VARCHAR(100),
    Capacity INT
);

CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Department VARCHAR(100),
    Contact_Number VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Course_Subject (
    Course_ID INT,
    Subject_ID INT,
    PRIMARY KEY (Course_ID, Subject_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID)
);

CREATE TABLE Exam_Center_Exam (
    Center_ID INT,
    Exam_ID INT,
    PRIMARY KEY (Center_ID, Exam_ID),
    FOREIGN KEY (Center_ID) REFERENCES Exam_Center(Center_ID),
    FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID)
);

CREATE TABLE Faculty_Subject (
    Faculty_ID INT,
    Subject_ID INT,
    PRIMARY KEY (Faculty_ID, Subject_ID),
    FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID),
    FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID)
);