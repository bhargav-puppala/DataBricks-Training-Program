-- SQL-Joins.sql
-- Databricks Learning Journey - Day 3
--
-- NOTE:
-- This assignment contains 60+ join problems (Basic, Intermediate,
-- Advanced, Anti Joins and Expert Challenges). A complete solved
-- version exceeds the response size that can be generated in one
-- ChatGPT message.
--
-- This file is created as a starter script for your repository.
-- You can continue adding the reviewed solutions section by section.

--------------------------------------------------
-- TABLE CREATION
--------------------------------------------------

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments VALUES
(1,'HR','New York'),
(2,'Finance','Chicago'),
(3,'IT','Dallas'),
(4,'Marketing','Boston'),
(5,'Sales','Seattle'),
(6,'Operations','Atlanta');

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    ManagerID INT,
    JoiningDate DATE
);

INSERT INTO Employees VALUES
(101,'John',1,50000,NULL,'2020-01-15'),
(102,'Emma',2,65000,101,'2021-03-10'),
(103,'David',3,70000,101,'2019-07-22'),
(104,'Sophia',3,72000,103,'2022-05-01'),
(105,'Michael',5,55000,102,'2021-09-18'),
(106,'Olivia',NULL,48000,102,'2023-01-12'),
(107,'James',4,60000,103,'2022-10-20'),
(108,'William',7,75000,101,'2020-08-11'),
(109,'Ava',NULL,52000,NULL,'2024-02-15'),
(110,'Isabella',5,68000,105,'2021-06-05');

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    Budget DECIMAL(12,2)
);

INSERT INTO Projects VALUES
(201,'Payroll System',1,150000),
(202,'Audit System',2,200000),
(203,'Website Redesign',4,100000),
(204,'ERP Upgrade',3,500000),
(205,'Sales Dashboard',5,175000),
(206,'Automation',6,250000),
(207,'AI Chatbot',8,300000);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT
);

INSERT INTO EmployeeProjects VALUES
(101,201),
(102,202),
(103,204),
(104,204),
(105,205),
(107,203),
(110,205),
(103,207),
(108,207),
(109,202);

--------------------------------------------------
-- BASIC / INTERMEDIATE / ADVANCED / ANTI JOIN /
-- EXPERT SOLUTIONS
--------------------------------------------------
--------------------------------------------------
-- BASIC ASSIGNMENTS
--------------------------------------------------

--------------------------------------------------
-- INNER JOIN
--------------------------------------------------

-- Q1. Display employee names with department names.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

--------------------------------------------------

-- Q2. Display project names with department names.
SELECT p.ProjectName, d.DepartmentName
FROM Projects p
INNER JOIN Departments d
ON p.DepartmentID = d.DepartmentID;

--------------------------------------------------

-- Q3. Show employees along with project names.
SELECT e.EmployeeName, p.ProjectName
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

--------------------------------------------------

-- Q4. Show employee salary and department location.
SELECT e.EmployeeName,
       e.Salary,
       d.Location
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

--------------------------------------------------

-- Q5. Display all employees working on projects.
SELECT e.EmployeeName,
       p.ProjectName
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

--------------------------------------------------
-- LEFT JOIN
--------------------------------------------------

-- Q1. Show all employees even if they don't belong to any department.
SELECT e.EmployeeName,
       d.DepartmentName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

--------------------------------------------------

-- Q2. Show all departments even if no employee works there.
SELECT d.DepartmentName,
       e.EmployeeName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

--------------------------------------------------

-- Q3. Show all projects and their department names.
SELECT p.ProjectName,
       d.DepartmentName
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID;

--------------------------------------------------

-- Q4. Show every employee and their assigned projects.
SELECT e.EmployeeName,
       p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
ON ep.ProjectID = p.ProjectID;

--------------------------------------------------

-- Q5. Display all employees even if they are not assigned to any project.
SELECT e.EmployeeName,
       p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
ON ep.ProjectID = p.ProjectID;

--------------------------------------------------
-- RIGHT JOIN
--------------------------------------------------

-- Q1. Show all departments even if there are no employees.
SELECT d.DepartmentName,
       e.EmployeeName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

--------------------------------------------------

-- Q2. Show all projects even if no employee is assigned.
SELECT p.ProjectName,
       e.EmployeeName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees e
ON ep.EmployeeID = e.EmployeeID;

--------------------------------------------------

-- Q3. Display every department and employees.
SELECT d.DepartmentName,
       e.EmployeeName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

--------------------------------------------------

-- Q4. Show all projects with departments.
SELECT p.ProjectName,
       d.DepartmentName
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

--------------------------------------------------

-- Q5. Show every project assignment including projects without employees.
SELECT p.ProjectName,
       e.EmployeeName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees e
ON ep.EmployeeID = e.EmployeeID;

--------------------------------------------------
-- FULL JOIN
--------------------------------------------------

-- Q1. Show all employees and all departments.
SELECT e.EmployeeName,
       d.DepartmentName
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

--------------------------------------------------

-- Q2. Show all departments and projects.
SELECT d.DepartmentName,
       p.ProjectName
FROM Departments d
FULL JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

--------------------------------------------------

-- Q3. Display all employees and projects.
SELECT e.EmployeeName,
       p.ProjectName
FROM Employees e
FULL JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
FULL JOIN Projects p
ON ep.ProjectID = p.ProjectID;

--------------------------------------------------

-- Q4. Show every department whether employees exist or not.
SELECT d.DepartmentName,
       e.EmployeeName
FROM Departments d
FULL JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

--------------------------------------------------

-- Q5. Show all departments and projects including unmatched records.
SELECT d.DepartmentName,
       p.ProjectName
FROM Departments d
FULL JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

--------------------------------------------------
-- INTERMEDIATE ASSIGNMENTS
--------------------------------------------------

--------------------------------------------------
-- INNER JOIN
--------------------------------------------------

-- Q1. Show employees whose department is IT.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';

--------------------------------------------------

-- Q2. Display employees working on projects with budget above 200000.
SELECT e.EmployeeName,
       p.ProjectName,
       p.Budget
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE p.Budget > 200000;

--------------------------------------------------

-- Q3. Show employee names, department names and project names.
SELECT e.EmployeeName,
       d.DepartmentName,
       p.ProjectName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

--------------------------------------------------

-- Q4. Display total employees in each department.
SELECT d.DepartmentName,
       COUNT(e.EmployeeID) AS TotalEmployees
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

--------------------------------------------------

-- Q5. Show average salary department-wise.
SELECT d.DepartmentName,
       AVG(e.Salary) AS AverageSalary
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

--------------------------------------------------
-- LEFT JOIN
--------------------------------------------------

-- Q1. Find employees without departments.
SELECT e.EmployeeName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

--------------------------------------------------

-- Q2. Find employees without projects.
SELECT e.EmployeeName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;

--------------------------------------------------

-- Q3. Find departments without employees.
SELECT d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;

--------------------------------------------------

-- Q4. Find projects without departments.
SELECT p.ProjectName
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

--------------------------------------------------

-- Q5. Show departments with total employees including zero employees.
SELECT d.DepartmentName,
       COUNT(e.EmployeeID) AS TotalEmployees
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

--------------------------------------------------
-- RIGHT JOIN
--------------------------------------------------

-- Q1. Find departments having no employees.
SELECT d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;

--------------------------------------------------

-- Q2. Find projects without employees.
SELECT p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

--------------------------------------------------

-- Q3. Show departments even if no projects exist.
SELECT d.DepartmentName,
       p.ProjectName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID;

--------------------------------------------------

-- Q4. Count employees in every department.
SELECT d.DepartmentName,
       COUNT(e.EmployeeID) AS TotalEmployees
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

--------------------------------------------------

-- Q5. List every project whether employees are assigned or not.
SELECT p.ProjectName,
       e.EmployeeName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees e
ON ep.EmployeeID = e.EmployeeID;

--------------------------------------------------
-- FULL JOIN
--------------------------------------------------

-- Q1. Display all departments and employees.
SELECT d.DepartmentName,
       e.EmployeeName
FROM Departments d
FULL JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

--------------------------------------------------

-- Q2. Show unmatched employees.
SELECT e.EmployeeName
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

--------------------------------------------------

-- Q3. Show unmatched departments.
SELECT d.DepartmentName
FROM Departments d
FULL JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;

--------------------------------------------------

-- Q4. Show all employees and departments with NULL handling.
SELECT
    COALESCE(e.EmployeeName, 'No Employee') AS Employee,
    COALESCE(d.DepartmentName, 'No Department') AS Department
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

--------------------------------------------------

-- Q5. Display departments and projects including unmatched rows.
SELECT
    COALESCE(d.DepartmentName, 'No Department') AS Department,
    COALESCE(p.ProjectName, 'No Project') AS Project
FROM Departments d
FULL JOIN Projects p
ON d.DepartmentID = p.DepartmentID;


--------------------------------------------------
-- ADVANCED ASSIGNMENTS
--------------------------------------------------

--------------------------------------------------
-- INNER JOIN
--------------------------------------------------

-- Q1. Find highest-paid employee in every department.

SELECT d.DepartmentName,
       e.EmployeeName,
       e.Salary
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
    SELECT MAX(Salary)
    FROM Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
);

--------------------------------------------------

-- Q2. Find department having highest average salary.

SELECT TOP 1
       d.DepartmentName,
       AVG(e.Salary) AS AverageSalary
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY AverageSalary DESC;

--------------------------------------------------

-- Q3. Find employee working on highest-budget project.

SELECT e.EmployeeName,
       p.ProjectName,
       p.Budget
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE p.Budget = (
    SELECT MAX(Budget)
    FROM Projects
);

--------------------------------------------------

-- Q4. Show managers and their employees.

SELECT
    m.EmployeeName AS Manager,
    e.EmployeeName AS Employee
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID;

--------------------------------------------------

-- Q5. Find employees working on more than one project.

SELECT
    e.EmployeeName,
    COUNT(ep.ProjectID) AS TotalProjects
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName
HAVING COUNT(ep.ProjectID) > 1;

--------------------------------------------------
-- LEFT JOIN
--------------------------------------------------

-- Q1. Find employees not assigned to any project.

SELECT
    e.EmployeeName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;

--------------------------------------------------

-- Q2. Find departments having no projects.

SELECT
    d.DepartmentName
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

--------------------------------------------------

-- Q3. Find departments having employees but no projects.

SELECT DISTINCT
    d.DepartmentName
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE p.ProjectID IS NULL;

--------------------------------------------------

-- Q4. Show employees with project count.

SELECT
    e.EmployeeName,
    COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName;

--------------------------------------------------

-- Q5. Show project count department-wise including zero.

SELECT
    d.DepartmentName,
    COUNT(p.ProjectID) AS ProjectCount
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName;

--------------------------------------------------
-- RIGHT JOIN
--------------------------------------------------

-- Q1. Find projects without employees.

SELECT
    p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

--------------------------------------------------

-- Q2. Find departments without projects.

SELECT
    d.DepartmentName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;

--------------------------------------------------

-- Q3. Find projects whose department doesn't exist.

SELECT
    p.ProjectName
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL;

--------------------------------------------------

-- Q4. Find orphan employee records.

SELECT
    e.EmployeeName
FROM Departments d
RIGHT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL;

--------------------------------------------------

-- Q5. Display every department and employee count.

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

--------------------------------------------------
-- LEFT ANTI JOIN
--------------------------------------------------

-- Q1. Find employees without departments.

SELECT e.*
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

--------------------------------------------------

-- Q2. Find departments without employees.

SELECT d.*
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;

--------------------------------------------------

-- Q3. Find employees without projects.

SELECT e.*
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;

--------------------------------------------------

-- Q4. Find departments without projects.

SELECT d.*
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

--------------------------------------------------

-- Q5. Find projects without departments.

SELECT p.*
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

--------------------------------------------------
-- RIGHT ANTI JOIN
--------------------------------------------------

-- Q1. Departments without employees.

SELECT d.*
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;

--------------------------------------------------

-- Q2. Projects without employees.

SELECT p.*
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

--------------------------------------------------

-- Q3. Departments without projects.

SELECT d.*
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;

--------------------------------------------------

-- Q4. Employees whose departments don't exist.

SELECT e.*
FROM Departments d
RIGHT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL;

--------------------------------------------------

-- Q5. Projects whose departments don't exist.

SELECT p.*
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL;

--------------------------------------------------
-- FULL ANTI JOIN
--------------------------------------------------

-- Q1. Find all unmatched employees and departments.

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL
   OR d.DepartmentID IS NULL;

--------------------------------------------------

-- Q2. Find all unmatched departments and employees.

SELECT
    d.DepartmentName,
    e.EmployeeName
FROM Departments d
FULL JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL
   OR e.DepartmentID IS NULL;

--------------------------------------------------

-- Q3. Find projects without departments and departments without projects.

SELECT
    d.DepartmentName,
    p.ProjectName
FROM Departments d
FULL JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL
   OR p.DepartmentID IS NULL;

--------------------------------------------------

-- Q4. Find employees without projects and projects without employees.

SELECT
    e.EmployeeName,
    p.ProjectName
FROM Employees e
FULL JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
FULL JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL
   OR ep.ProjectID IS NULL;

--------------------------------------------------

-- Q5. Show all orphan records across Employees and Departments.

SELECT
    COALESCE(CAST(e.EmployeeID AS VARCHAR), 'NULL') AS EmployeeID,
    COALESCE(e.EmployeeName, 'No Employee') AS EmployeeName,
    COALESCE(CAST(d.DepartmentID AS VARCHAR), 'NULL') AS DepartmentID,
    COALESCE(d.DepartmentName, 'No Department') AS DepartmentName
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL
   OR d.DepartmentID IS NULL;

--------------------------------------------------
-- EXPERT LEVEL CHALLENGES
--------------------------------------------------

-- Q1. Find the department with the highest project budget.

SELECT TOP 1
       d.DepartmentName,
       SUM(p.Budget) AS TotalBudget
FROM Departments d
INNER JOIN Projects p
ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalBudget DESC;

--------------------------------------------------

-- Q2. Find employees working in departments without projects.

SELECT e.EmployeeName,
       d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

--------------------------------------------------

-- Q3. Find projects having multiple employees.

SELECT p.ProjectName,
       COUNT(ep.EmployeeID) AS EmployeeCount
FROM Projects p
INNER JOIN EmployeeProjects ep
ON p.ProjectID = ep.ProjectID
GROUP BY p.ProjectID, p.ProjectName
HAVING COUNT(ep.EmployeeID) > 1;

--------------------------------------------------

-- Q4. Find employees assigned to projects outside their own department.

SELECT
    e.EmployeeName,
    d1.DepartmentName AS EmployeeDepartment,
    p.ProjectName,
    d2.DepartmentName AS ProjectDepartment
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Departments d1
ON e.DepartmentID = d1.DepartmentID
LEFT JOIN Departments d2
ON p.DepartmentID = d2.DepartmentID
WHERE e.DepartmentID <> p.DepartmentID;

--------------------------------------------------

-- Q5. Find departments where every employee is assigned to a project.

SELECT d.DepartmentName
FROM Departments d
WHERE NOT EXISTS
(
    SELECT *
    FROM Employees e
    WHERE e.DepartmentID = d.DepartmentID
      AND NOT EXISTS
      (
          SELECT *
          FROM EmployeeProjects ep
          WHERE ep.EmployeeID = e.EmployeeID
      )
);

--------------------------------------------------

-- Q6. Find employees who share the same manager.

SELECT
    m.EmployeeName AS Manager,
    e.EmployeeName AS Employee
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID
ORDER BY m.EmployeeName;

--------------------------------------------------

-- Q7. Find departments with no managers.

SELECT DISTINCT
       d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID NOT IN
(
    SELECT DISTINCT DepartmentID
    FROM Employees
    WHERE EmployeeID IN
    (
        SELECT DISTINCT ManagerID
        FROM Employees
        WHERE ManagerID IS NOT NULL
    )
);

--------------------------------------------------

-- Q8. Find managers with more than three employees.

SELECT
    m.EmployeeName AS Manager,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID
GROUP BY m.EmployeeName
HAVING COUNT(e.EmployeeID) > 3;

--------------------------------------------------

-- Q9. Find employees hired before their manager.

SELECT
    e.EmployeeName,
    e.JoiningDate,
    m.EmployeeName AS Manager,
    m.JoiningDate AS ManagerJoiningDate
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID
WHERE e.JoiningDate < m.JoiningDate;

--------------------------------------------------

-- Q10. Create one report showing:
-- Employee Name
-- Department
-- Project
-- Budget
-- Manager Name
-- Salary
-- Department Location

SELECT
    e.EmployeeName,
    d.DepartmentName,
    p.ProjectName,
    p.Budget,
    m.EmployeeName AS ManagerName,
    e.Salary,
    d.Location
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID
ORDER BY e.EmployeeID;
