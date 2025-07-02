-- Create a table
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  Name VARCHAR(255),
  Department VARCHAR(255),
  Salary DECIMAL(10, 2)
);

-- Insert data into the table
INSERT INTO Employees (EmployeeID, Name, Department, Salary)
VALUES
(1, 'ayesha', 'Sales', 50000.00),
(2, 'rupali', 'Marketing', 60000.00),
(3, 'nancy', 'Sales', 55000.00),
(4, 'vishal', 'IT', 70000.00);

-- Subquery in SELECT clause
SELECT Name, Salary, 
       (SELECT AVG(Salary) FROM Employees) AS AverageSalary
FROM Employees;

-- Subquery in WHERE clause
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Subquery in FROM clause
SELECT Department, AverageSalary
FROM (
  SELECT Department, AVG(Salary) AS AverageSalary
  FROM Employees
  GROUP BY Department
) AS DepartmentAverageSalaries;

