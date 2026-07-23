/*
===============================================================================
Topic       : Stored Procedures
Author      : Vishal Bharwad
Repository  : SQL-Server-Practice
Database    : CompanyDB

Description :
This script demonstrates:

1. Creating a Stored Procedure
2. Executing a Stored Procedure
3. Stored Procedure with Input Parameters
4. Insert using Stored Procedure
5. Update using Stored Procedure
6. Delete using Stored Procedure
7. Alter Stored Procedure
8. Drop Stored Procedure

===============================================================================
*/

------------------------------------------------------------------------------
-- WHAT IS A STORED PROCEDURE?
------------------------------------------------------------------------------

/*
A Stored Procedure is a collection of SQL statements stored inside
the database that performs a specific task.

Advantages:
✔ Reusable
✔ Faster Execution
✔ Better Security
✔ Easy Maintenance
✔ Reduces Code Duplication
*/

------------------------------------------------------------------------------
-- CREATE DATABASE
------------------------------------------------------------------------------

CREATE DATABASE CompanyDB;
GO

USE CompanyDB;
GO

------------------------------------------------------------------------------
-- CREATE EMPLOYEES TABLE
------------------------------------------------------------------------------

CREATE TABLE Employees
(
    EmployeeId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

------------------------------------------------------------------------------
-- INSERT SAMPLE DATA
------------------------------------------------------------------------------

INSERT INTO Employees(Name, Department, Salary)
VALUES
('Vishal','IT',45000),
('Rahul','HR',35000),
('Priya','IT',50000),
('Amit','Sales',40000);

------------------------------------------------------------------------------
-- DISPLAY TABLE
------------------------------------------------------------------------------

SELECT *
FROM Employees;

------------------------------------------------------------------------------
-- STORED PROCEDURE 1
-- Display All Employees
------------------------------------------------------------------------------

/*
Purpose:
Returns all employee records.
*/

CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT *
    FROM Employees;
END;
GO

------------------------------------------------------------------------------
-- EXECUTE PROCEDURE
------------------------------------------------------------------------------

EXEC GetAllEmployees;

------------------------------------------------------------------------------
-- STORED PROCEDURE 2
-- Employees Having Salary Greater Than 40000
------------------------------------------------------------------------------

CREATE PROCEDURE GetHighSalaryEmployees
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE Salary > 40000;
END;
GO

EXEC GetHighSalaryEmployees;

------------------------------------------------------------------------------
-- STORED PROCEDURE WITH INPUT PARAMETER
------------------------------------------------------------------------------

/*
Input Parameter

Used when we want dynamic input.

Instead of writing different queries for different Employee IDs,
we create one procedure and pass the ID while executing.
*/

CREATE PROCEDURE GetEmployeeById
    @EmployeeId INT
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE EmployeeId = @EmployeeId;
END;
GO

------------------------------------------------------------------------------
-- EXECUTE PROCEDURE
------------------------------------------------------------------------------

EXEC GetEmployeeById 2;

-- OR

EXEC GetEmployeeById
    @EmployeeId = 2;

------------------------------------------------------------------------------
-- STORED PROCEDURE
-- Search Employees by Department
------------------------------------------------------------------------------

CREATE PROCEDURE GetEmployeesByDepartment
    @Department VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE Department = @Department;
END;
GO

EXEC GetEmployeesByDepartment 'IT';

------------------------------------------------------------------------------
-- STORED PROCEDURE
-- Insert Employee
------------------------------------------------------------------------------

/*
Commonly used in ASP.NET Core projects.
*/

CREATE PROCEDURE AddEmployee
    @Name VARCHAR(50),
    @Department VARCHAR(50),
    @Salary DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Employees(Name,Department,Salary)
    VALUES(@Name,@Department,@Salary);
END;
GO

EXEC AddEmployee
    @Name='Rohan',
    @Department='Finance',
    @Salary=55000;

------------------------------------------------------------------------------
-- VERIFY INSERT
------------------------------------------------------------------------------

SELECT *
FROM Employees;

------------------------------------------------------------------------------
-- STORED PROCEDURE
-- Update Salary
------------------------------------------------------------------------------

CREATE PROCEDURE UpdateEmployeeSalary
    @EmployeeId INT,
    @Salary DECIMAL(10,2)
AS
BEGIN
    UPDATE Employees
    SET Salary=@Salary
    WHERE EmployeeId=@EmployeeId;
END;
GO

EXEC UpdateEmployeeSalary
    @EmployeeId=1,
    @Salary=60000;

------------------------------------------------------------------------------
-- VERIFY UPDATE
------------------------------------------------------------------------------

SELECT *
FROM Employees;

------------------------------------------------------------------------------
-- STORED PROCEDURE
-- Delete Employee
------------------------------------------------------------------------------

CREATE PROCEDURE DeleteEmployee
    @EmployeeId INT
AS
BEGIN
    DELETE FROM Employees
    WHERE EmployeeId=@EmployeeId;
END;
GO

EXEC DeleteEmployee 4;

------------------------------------------------------------------------------
-- VERIFY DELETE
------------------------------------------------------------------------------

SELECT *
FROM Employees;

------------------------------------------------------------------------------
-- ALTER STORED PROCEDURE
------------------------------------------------------------------------------

/*
Suppose the company now wants only
Employee Name and Salary.

Instead of creating a new procedure,
we modify the existing one.
*/

ALTER PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT
        Name,
        Salary
    FROM Employees;
END;
GO

EXEC GetAllEmployees;

------------------------------------------------------------------------------
-- DROP STORED PROCEDURE
------------------------------------------------------------------------------

DROP PROCEDURE GetHighSalaryEmployees;

------------------------------------------------------------------------------
-- END OF SCRIPT
------------------------------------------------------------------------------