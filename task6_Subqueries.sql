-- Task 6: Subqueries and Nested Queries
-- Author: Nandini Samdariya
-- Description: Demonstrates scalar, correlated, and nested subqueries in SELECT, WHERE, FROM, and UPDATE using MySQL.

-- Use database
USE task6_subqueries;

-- Create Departments Table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Create Employees Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Insert Departments
INSERT INTO Departments VALUES
(1, 'IT'), 
(2, 'HR'), 
(3, 'Finance'), 
(4, 'Marketing');

-- Insert Employees
INSERT INTO Employees VALUES
(101, 'Mayur Sharma', 90000, 1),
(102, 'Priya Verma', 80000, 2),
(103, 'Ravi Chopra', 75000, 2),
(104, 'Neha Jain', 50000, 1),
(105, 'Karan Mehta', 60000, 3),
(106, 'Sonal Kapoor', 85000, 4),
(107, 'Palak Giri', 55000, 3);

-- 1. Scalar subquery in SELECT
SELECT EmpName, Salary,
(SELECT AVG(Salary) FROM Employees E2 WHERE E2.DeptID = E1.DeptID) AS AvgDeptSalary
FROM Employees E1;

-- 2. Subquery using IN
SELECT EmpName, Salary
FROM Employees
WHERE DeptID IN (
    SELECT DISTINCT DeptID FROM Employees WHERE Salary > 80000
);

-- 3. Correlated subquery using EXISTS
SELECT E1.EmpName, E1.Salary
FROM Employees E1
WHERE EXISTS (
    SELECT 1 FROM Employees E2
    WHERE E2.DeptID = E1.DeptID AND E2.Salary > E1.Salary
);

-- 4. Scalar subquery using =
SELECT EmpName, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- 5. Subquery in FROM clause (derived table)
SELECT DeptID, AvgSalary
FROM (
    SELECT DeptID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DeptID
) AS DeptAvg;

-- 6. Update using subquery in JOIN (avoid safe update mode)
SET SQL_SAFE_UPDATES = 0;

UPDATE Employees E
JOIN (
    SELECT DeptID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DeptID
) AS DeptAvg
ON E.DeptID = DeptAvg.DeptID
SET E.Salary = E.Salary * 1.10
WHERE E.Salary < DeptAvg.AvgSalary;

SET SQL_SAFE_UPDATES = 1;

-- 7. Select updated employees
SELECT * FROM Employees;

-- 8. Subquery to find second highest salary
SELECT MAX(Salary) AS SecondHighest
FROM Employees
WHERE Salary < (
    SELECT MAX(Salary) FROM Employees
);
