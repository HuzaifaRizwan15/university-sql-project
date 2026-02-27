create database universitydb;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Result (
    result_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Software Engineering'),
(3, 'Data Science');

INSERT INTO Student VALUES
(101, 'Ali Khan', 'ali@gmail.com', 1),
(102, 'Sara Ahmed', 'sara@gmail.com', 2),
(103, 'Huzaifa Rizwan', 'huzaifa@gmail.com', 3);

INSERT INTO Course VALUES
(201, 'Database Systems', 1),
(202, 'Software Project Management', 2),
(203, 'Machine Learning', 3);

INSERT INTO Result VALUES
(1, 101, 201, 85, 'A'),
(2, 102, 202, 78, 'B'),
(3, 103, 203, 90, 'A+');

SELECT student_name, course_name, marks, grade
FROM Result
JOIN Student ON Result.student_id = Student.student_id
JOIN Course ON Result.course_id = Course.course_id;