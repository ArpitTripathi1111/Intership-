create database clg;
show databases;
use clg;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    hire_date DATE
);
INSERT INTO employees (id, name, department, hire_date)
VALUES (1, 'Alice Smith', 'Engineering', '2024-01-15');
UPDATE employees
SET department = 'Management'
WHERE id = 1;
SELECT * FROM employees;
INSERT INTO employees (id, name, department, hire_date)
VALUES 
    (2, 'Bob Johnson', 'Sales', '2024-02-01'),
    (3, 'Charlie Davis', 'Engineering', '2023-11-15'),
    (4, 'Diana Prince', 'Management', '2022-06-30'),
    (5, 'Evan Wright', 'HR', '2024-03-10');
show tables;
SELECT * FROM departments;
/* Step 1: CREATE (DDL)
We create a temporary table to track office inventory.
*/
CREATE TABLE temp_inventory (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    quantity INT,
    price DECIMAL(8,2)
);

/* Step 2: INSERT (DML)
Populate the table with some initial stock using a multi-row insert.
*/
INSERT INTO temp_inventory (item_id, item_name, quantity, price)
VALUES 
    (1, 'Laptop', 10, 1200.00),
    (2, 'Monitor', 25, 300.00),
    (3, 'Mouse', 100, 25.00),
    (4, 'Keyboard', 50, 45.00);

/* Step 3: SELECT (DQL)
Check our work. Let's find items where we have fewer than 30 in stock.
*/
SELECT item_name, quantity 
FROM temp_inventory 
WHERE quantity < 30;

/* Step 4: UPDATE (DML)
The price of monitors dropped. We update that specific row.
Always use a WHERE clause!
*/
UPDATE temp_inventory 
SET price = 275.00 
WHERE item_id = 2;

/* Step 5: DELETE (DML)
We stopped selling keyboards. Let's remove that specific row entirely.
*/
DELETE FROM temp_inventory 
WHERE item_id = 4;

/* Step 6: TRUNCATE (DDL) - Optional Step
If you wanted to keep the table structure but wipe all the data out of it:
TRUNCATE TABLE temp_inventory;
*/

/* Step 7: DROP (DDL)
We are done with this tracking exercise. 
This command permanently deletes the table structure and all data inside it.
*/
DROP TABLE temp_inventory;
create Database manga;
drop database manga;
create Database college;
use college;
create table students(
Rollno INT PRIMARY KEY,
    Name VARCHAR(100),
    Class INT
    );
insert into students(Rollno, Name, Class)
values(1, "Rahul",1),
	  (2,"Sumita",1),
      (3,"Arnav",1),
      (4,"Kavya",1),
      (5,"Nina",1);
select * from students;
UPDATE students
SET Name = 'Neena'
WHERE Rollno = 5;
UPDATE students
SET Name = 'Mayank'
WHERE Rollno = 6;
insert into students(Rollno, Name, Class)
values(6,'Mayank',1);
select * from students;
DESCRIBE students;
CREATE DATABASE CollegeManagement;

USE CollegeManagement;

DROP TABLE IF EXISTS Teachers;
DROP TABLE IF EXISTS Departments;


CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100)
);


CREATE TABLE Teachers (
    Teacher_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Subject VARCHAR(100),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);

INSERT INTO Departments VALUES (101, 'Computer Science');
INSERT INTO Departments VALUES (102, 'Mathematics');

INSERT INTO Teachers VALUES (1, 'Sanjay', 'Lucknow', 'Software Engineering', 101);
INSERT INTO Teachers VALUES (2, 'Mohan', 'Lucknow', 'Data Structures', 101);
INSERT INTO Teachers VALUES (3, 'Ajay', 'Delhi', 'Algebra', 102);

ALTER TABLE Teachers
ADD Salary INT;

UPDATE Teachers
SET Salary = 50000
WHERE Teacher_ID < 10;

UPDATE Teachers
SET Salary = 50000
WHERE Teacher_ID < 10;


SELECT * FROM Departments;
SELECT * FROM Teachers;
SELECT name, salary FROM Teachers where Teacher_ID<3;
SELECT name, salary FROM Teachers where Teacher_ID<=3;
SELECT Dept_Name FROM Departments;

SELECT Teachers.Name, Departments.Dept_Name
FROM Teachers
JOIN Departments ON Teachers.Dept_ID = Departments.Dept_ID;

SELECT *
FROM Teachers
JOIN Departments ON Teachers.Dept_ID = Departments.Dept_ID;

INSERT INTO Teachers (Teacher_ID, Name, Location, Subject, Dept_ID, Salary)
VALUES (4, 'Rahul Verma', 'Lucknow', 'Operating Systems', 101, 45000);

SELECT * FROM Teachers;

DELETE FROM Teachers
WHERE Teacher_ID = 4;

SELECT * FROM Teachers;