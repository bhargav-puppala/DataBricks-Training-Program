--------------------------------------------------
-- Day 2 - SQL Operators
-- Topics:
-- Comparison Operators
-- Logical Operators
-- IN / NOT IN
-- BETWEEN
-- LIKE
--------------------------------------------------

--------------------------------------------------
-- Create Table
--------------------------------------------------

CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    experience INT
);

--------------------------------------------------
-- Insert Sample Data
--------------------------------------------------

INSERT INTO Employees VALUES
(101, 'Rahul', 'IT', 75000, 'Hyderabad', 5),
(102, 'Anjali', 'HR', 45000, 'Chennai', 3),
(103, 'Kiran', 'IT', 82000, 'Bangalore', 6),
(104, 'Sneha', 'Finance', 67000, 'Hyderabad', 4),
(105, 'Aman', 'HR', 39000, 'Pune', 2),
(106, 'Ravi', 'Finance', 91000, 'Mumbai', 8),
(107, 'Divya', 'IT', 55000, 'Chennai', 3),
(108, 'Meena', 'Sales', 48000, 'Bangalore', 2),
(109, 'Arjun', 'Sales', 61000, 'Hyderabad', 5),
(110, 'Pooja', 'IT', 73000, 'Mumbai', 4),
(111, 'Vikas', 'HR', 52000, 'Pune', 3),
(112, 'Nisha', 'Finance', 88000, 'Bangalore', 7),
(113, 'Tarun', 'Sales', 46000, 'Chennai', 2),
(114, 'Kavya', 'IT', 97000, 'Hyderabad', 9),
(115, 'Manoj', 'Finance', 58000, 'Mumbai', 4);

--------------------------------------------------
-- COMPARISON OPERATORS
--------------------------------------------------

-- Q1. Find employees with salary >= 80000.
SELECT *
FROM Employees
WHERE salary >= 80000;

-- Q2. Find employees with experience <= 3.
SELECT *
FROM Employees
WHERE experience <= 3;

-- Q3. Find employees whose salary <> 45000.
SELECT *
FROM Employees
WHERE salary <> 45000;

-- Q4. Find employees with salary < 50000.
SELECT *
FROM Employees
WHERE salary < 50000;

-- Q5. Find employees with experience > 5.
SELECT *
FROM Employees
WHERE experience > 5;

--------------------------------------------------
-- LOGICAL OPERATORS
--------------------------------------------------

-- Q1. Find employees from IT department AND salary greater than 70000.
SELECT *
FROM Employees
WHERE department = 'IT'
AND salary > 70000;

-- Q2. Find employees from Hyderabad OR Bangalore.
SELECT *
FROM Employees
WHERE city IN ('Hyderabad', 'Bangalore');

-- Q3. Find employees from HR department AND experience less than 3.
SELECT *
FROM Employees
WHERE department = 'HR'
AND experience < 3;

-- Q4. Find employees with salary greater than 60000 OR experience greater than 6.
SELECT *
FROM Employees
WHERE salary > 60000
OR experience > 6;

-- Q5. Find employees NOT from Sales department.
SELECT *
FROM Employees
WHERE department <> 'Sales';

--------------------------------------------------
-- IN AND NOT IN
--------------------------------------------------

-- Q1. Find employees working in ('Hyderabad', 'Mumbai').
SELECT *
FROM Employees
WHERE city IN ('Hyderabad', 'Mumbai');

-- Q2. Find employees whose department IN ('IT', 'Finance').
SELECT *
FROM Employees
WHERE department IN ('IT', 'Finance');

-- Q3. Find employees whose city NOT IN ('Chennai', 'Pune').
SELECT *
FROM Employees
WHERE city NOT IN ('Chennai', 'Pune');

-- Q4. Find employees whose salary IN (45000, 75000, 91000).
SELECT *
FROM Employees
WHERE salary IN (45000, 75000, 91000);

-- Q5. Find employees whose department NOT IN ('HR', 'Sales').
SELECT *
FROM Employees
WHERE department NOT IN ('HR', 'Sales');

--------------------------------------------------
-- BETWEEN
--------------------------------------------------

-- Q1. Find employees with salary BETWEEN 50000 AND 80000.
SELECT *
FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

-- Q2. Find employees with experience BETWEEN 3 AND 6.
SELECT *
FROM Employees
WHERE experience BETWEEN 3 AND 6;

-- Q3. Find employees whose emp_id BETWEEN 105 AND 112.
SELECT *
FROM Employees
WHERE emp_id BETWEEN 105 AND 112;

-- Q4. Find employees with salary NOT BETWEEN 40000 AND 60000.
SELECT *
FROM Employees
WHERE salary NOT BETWEEN 40000 AND 60000;

-- Q5. Find employees with experience BETWEEN 2 AND 4.
SELECT *
FROM Employees
WHERE experience BETWEEN 2 AND 4;

--------------------------------------------------
-- LIKE OPERATOR
--------------------------------------------------

-- Q1. Find employees whose names start with 'R'.
SELECT *
FROM Employees
WHERE emp_name LIKE 'R%';

-- Q2. Find employees whose names end with 'a'.
SELECT *
FROM Employees
WHERE emp_name LIKE '%a';

-- Q3. Find employees whose names contain 'v'.
SELECT *
FROM Employees
WHERE emp_name LIKE '%v%';

-- Q4. Find employees whose city starts with 'B'.
SELECT *
FROM Employees
WHERE city LIKE 'B%';

-- Q5. Find employees whose department ends with 's'.
SELECT *
FROM Employees
WHERE department LIKE '%s';
