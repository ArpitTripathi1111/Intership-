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
