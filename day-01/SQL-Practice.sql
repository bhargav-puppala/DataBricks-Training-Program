--------------------------------------------------
-- Day 1 - SQL Practice
-- Topics:
-- SELECT
-- WHERE
-- GROUP BY
-- HAVING
-- TOP
-- DISTINCT
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
-- SELECT
--------------------------------------------------

-- Q1. Display all employee details.
SELECT *
FROM Employees;

-- Q2. Display only employee names and salaries.
SELECT emp_name, salary
FROM Employees;

-- Q3. Display employee names and departments.
SELECT emp_name, department
FROM Employees;

-- Q4. Display all employees from the IT department.
SELECT *
FROM Employees
WHERE department = 'IT';

-- Q5. Display employee names and experience.
SELECT emp_name, experience
FROM Employees;

--------------------------------------------------
-- WHERE
--------------------------------------------------

-- Q1. Find employees with salary greater than 70000.
SELECT emp_name
FROM Employees
WHERE salary > 70000;

-- Q2. Find employees working in Hyderabad.
SELECT emp_name
FROM Employees
WHERE city = 'Hyderabad';

-- Q3. Find employees with experience less than 4 years.
SELECT emp_name
FROM Employees
WHERE experience < 4;

-- Q4. Find employees from Finance department.
SELECT emp_name
FROM Employees
WHERE department = 'Finance';

-- Q5. Find employees whose salary is equal to 52000.
SELECT emp_name
FROM Employees
WHERE salary = 52000;

--------------------------------------------------
-- GROUP BY
--------------------------------------------------

-- Q1. Find total salary department-wise.
SELECT department,
       SUM(salary) AS total_salary
FROM Employees
GROUP BY department;

-- Q2. Find average salary in each department.
SELECT department,
       AVG(salary) AS avg_salary
FROM Employees
GROUP BY department;

-- Q3. Count employees in each city.
SELECT city,
       COUNT(emp_id) AS employee_count
FROM Employees
GROUP BY city;

-- Q4. Find maximum salary in each department.
SELECT department,
       MAX(salary) AS max_salary
FROM Employees
GROUP BY department;

-- Q5. Find minimum experience department-wise.
SELECT department,
       MIN(experience) AS min_experience
FROM Employees
GROUP BY department;

--------------------------------------------------
-- HAVING
--------------------------------------------------

-- Q1. Find departments having more than 3 employees.
SELECT department,
       COUNT(emp_id) AS employee_count
FROM Employees
GROUP BY department
HAVING COUNT(emp_id) > 3;

-- Q2. Find departments where average salary is greater than 60000.
SELECT department,
       AVG(salary) AS avg_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- Q3. Find cities having more than 2 employees.
SELECT city,
       COUNT(emp_id) AS employee_count
FROM Employees
GROUP BY city
HAVING COUNT(emp_id) > 2;

-- Q4. Find departments where total salary is greater than 200000.
SELECT department,
       SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 200000;

-- Q5. Find departments where maximum salary is above 90000.
SELECT department,
       MAX(salary) AS max_salary
FROM Employees
GROUP BY department
HAVING MAX(salary) > 90000;

--------------------------------------------------
-- TOP
--------------------------------------------------

-- Q1. Display top 5 highest paid employees.
SELECT emp_id, emp_name, salary
FROM Employees
ORDER BY salary DESC
FETCH FIRST 5 ROWS ONLY;

-- Q2. Display top 3 employees with highest experience.
SELECT emp_id, emp_name, experience
FROM Employees
ORDER BY experience DESC
FETCH FIRST 3 ROWS ONLY;

-- Q3. Display top 2 salaries from Finance department.
SELECT emp_id, emp_name, salary
FROM Employees
WHERE department = 'Finance'
ORDER BY salary DESC
FETCH FIRST 2 ROWS ONLY;

-- Q4. Display top 4 employees from Hyderabad.
SELECT emp_id, emp_name, city
FROM Employees
WHERE city = 'Hyderabad'
FETCH FIRST 4 ROWS ONLY;

-- Q5. Display top 1 highest salary employee.
SELECT emp_id, emp_name, salary
FROM Employees
ORDER BY salary DESC
FETCH FIRST 1 ROW ONLY;

--------------------------------------------------
-- DISTINCT
--------------------------------------------------

-- Q1. Display distinct department names.
SELECT DISTINCT department
FROM Employees;

-- Q2. Display distinct city names.
SELECT DISTINCT city
FROM Employees;

-- Q3. Display distinct salary values.
SELECT DISTINCT salary
FROM Employees;

-- Q4. Display distinct combinations of department and city.
SELECT DISTINCT department, city
FROM Employees;

-- Q5. Display distinct experience values.
SELECT DISTINCT experience
FROM Employees;
