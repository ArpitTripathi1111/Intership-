use CollegeManagement;
SELECT * FROM Teachers;
select * from teachers
order by salary;

ALTER TABLE teachers ADD COLUMN age INT;

-- Create the new database
CREATE DATABASE IF NOT EXISTS faculty_db;
USE faculty_db;

-- Create the table with the requested columns
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2),
    location VARCHAR(100),
    experience INT
);

-- Insert 5 records into the table
INSERT INTO teachers (id, name, age, salary, location, experience)
VALUES 
    (1, 'Dr. Sharma', 45, 75000.00, 'Lucknow', 15),
    (2, 'Prof. Verma', 52, 85000.00, 'Kanpur', 20),
    (3, 'Mr. Gupta', 38, 60000.00, 'Lucknow', 8),
    (4, 'Ms. Singh', 32, 55000.00, 'Delhi', 5),
    (5, 'Dr. Khan', 48, 80000.00, 'Lucknow', 18);

-- Verify the data
SELECT * FROM teachers;

SELECT * FROM teachers 
ORDER BY salary ASC;

SELECT * FROM teachers 
ORDER BY experience DESC;

SELECT * FROM teachers 
ORDER BY name ASC;

SELECT * FROM teachers 
ORDER BY location ASC, age DESC;

-- Clean up and set up structure
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2),
    location VARCHAR(100),
    experience INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Insert 3 Departments
INSERT INTO Department VALUES 
(101, 'Computer Science'),
(102, 'Mathematics'),
(103, 'Robotics');

-- Insert 10 teachers with department_id
INSERT INTO teachers VALUES 
(1, 'Dr. Sharma', 45, 75000, 'Lucknow', 15, 101),
(2, 'Prof. Verma', 52, 85000, 'Kanpur', 20, 102),
(3, 'Mr. Gupta', 38, 60000, 'Lucknow', 8, 103),
(4, 'Ms. Singh', 32, 55000, 'Delhi', 5, 101),
(5, 'Dr. Khan', 48, 80000, 'Lucknow', 18, 101),
(6, 'Prof. Mishra', 42, 72000, 'Lucknow', 12, 102),
(7, 'Ms. Kapoor', 29, 48000, 'Kanpur', 3, 103),
(8, 'Dr. Joshi', 55, 95000, 'Delhi', 25, 102),
(9, 'Mr. Verma', 35, 52000, 'Lucknow', 7, 103),
(10, 'Ms. Reddy', 40, 68000, 'Hyderabad', 14, 101);


SELECT t.name, t.salary, d.department_name
FROM teachers t
JOIN Department d ON t.department_id = d.department_id
ORDER BY t.salary DESC;

SELECT *
FROM teachers t
JOIN Department d ON t.department_id = d.department_id
ORDER BY t.salary DESC;

SELECT name, salary, department_id 
FROM teachers 
ORDER BY salary DESC 
LIMIT 5;

SELECT *
FROM teachers 
ORDER BY salary DESC 
LIMIT 5;

SELECT *
FROM teachers 
ORDER BY salary 
LIMIT 5;

show databases;

SELECT COUNT(*) AS total_teachers FROM teachers;

SELECT AVG(salary) AS average_salary FROM teachers;

SELECT * FROM teachers 
WHERE salary BETWEEN 50000 AND 80000;

SELECT * FROM teachers 
WHERE name LIKE 'Dr.%';

SELECT department_id, COUNT(*) 
FROM teachers 
GROUP BY department_id;

SELECT department_id, COUNT(*) 
FROM teachers 
GROUP BY department_id 
HAVING COUNT(*) > 3;

SELECT MAX(experience) AS max_exp, MIN(experience) AS min_exp 
FROM teachers;

SELECT DISTINCT location FROM teachers;

UPDATE teachers 
SET salary = salary * 1.10 
WHERE department_id = 101;

SELECT * FROM teachers;

CREATE TABLE staff (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50)
);

INSERT INTO staff (id, name, role)
VALUES 
    (1, 'Alice Smith', 'Admin'),
    (2, 'Bob Johnson', 'Librarian'),
    (3, 'Dr. Sharma', 'Teacher'); -- Added a duplicate name to demonstrate UNION

-- Using UNION (Removes duplicates)
SELECT name FROM teachers
UNION
SELECT name FROM staff;

-- Using UNION ALL (Includes duplicates)
SELECT name FROM teachers
UNION ALL
SELECT name FROM staff;

DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;

-- Create the Course table first (it contains the primary key)
CREATE TABLE course (
    C_ID INT PRIMARY KEY,
    C_Name VARCHAR(100)
);

-- Create the Student table (it contains the foreign key)
CREATE TABLE student (
    ID INT PRIMARY KEY,
    name VARCHAR(100),
    C_ID INT,
    FOREIGN KEY (C_ID) REFERENCES course(C_ID)
);

-- Insert data into Course
INSERT INTO course VALUES 
(101, 'Machine Learning'),
(102, 'Artificial Intelligence'),
(103, 'Database Management'),
(104, 'P.B'),
(105, 'SQL');

-- Insert data into Student
INSERT INTO student VALUES 
(1, 'Jai', 101),
(2, 'Rahul', 102),
(3, 'Dhanya', 101),
(4, 'Karan',103),
(5, 'Neha', 104);

-- View all data in the student table
SELECT * FROM student;

-- View all data in the course table
SELECT * FROM course;

SELECT s.ID, s.name, c.C_Name
FROM student s
JOIN course c ON s.C_ID = c.C_ID;

SELECT *
FROM student s
JOIN course c ON s.C_ID = c.C_ID;

SELECT s.name AS student_name, c.C_Name AS course_name
FROM student s
CROSS JOIN course c;

SELECT student.name, course.C_Name
FROM student
JOIN course ON student.C_ID = course.C_ID;