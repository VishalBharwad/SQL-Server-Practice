/*
===============================================================================
Topic       : SQL Server Constraints & Keys
Author      : Vishal Bharwad
Repository  : SQL-Server-Practice
Description : This script demonstrates different types of SQL constraints
              and keys with examples.
===============================================================================
*/

------------------------------------------------------------------------------
-- Create Database
------------------------------------------------------------------------------

CREATE DATABASE College;

USE College;

------------------------------------------------------------------------------
-- 1. PRIMARY KEY
-- A Primary Key uniquely identifies each record in a table.
-- Rules:
-- 1. Duplicate values are NOT allowed.
-- 2. NULL values are NOT allowed.
-- 3. Only ONE Primary Key is allowed per table.
------------------------------------------------------------------------------

CREATE TABLE Student
(
    StudentId INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

------------------------------------------------------------------------------
-- Insert Data
------------------------------------------------------------------------------

INSERT INTO Student
VALUES
(1, 'Vishal', 21),
(2, 'Ketan', 22);

SELECT * FROM Student;

------------------------------------------------------------------------------
-- Composite Primary Key
-- A Primary Key can contain multiple columns.
------------------------------------------------------------------------------

CREATE TABLE StudentCourse
(
    StudentId INT,
    CourseId INT,

    PRIMARY KEY (StudentId, CourseId)
);

------------------------------------------------------------------------------
-- 2. UNIQUE CONSTRAINT
-- Prevents duplicate values.
-- NULL value is allowed (one NULL in SQL Server).
------------------------------------------------------------------------------

CREATE TABLE Employee
(
    EmployeeId INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE,
    Mobile VARCHAR(15) UNIQUE
);

------------------------------------------------------------------------------
-- 3. NOT NULL CONSTRAINT
-- A column must always contain a value.
------------------------------------------------------------------------------

CREATE TABLE Teacher
(
    TeacherId INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Subject VARCHAR(50) NOT NULL
);

------------------------------------------------------------------------------
-- 4. DEFAULT CONSTRAINT
-- Assigns a default value if no value is provided.
------------------------------------------------------------------------------

CREATE TABLE Product
(
    ProductId INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Status VARCHAR(20) DEFAULT 'Available'
);

INSERT INTO Product(ProductId, ProductName, Price)
VALUES
(1,'Laptop',65000);

SELECT * FROM Product;

------------------------------------------------------------------------------
-- 5. CHECK CONSTRAINT
-- Restricts values based on a condition.
------------------------------------------------------------------------------

CREATE TABLE Person
(
    PersonId INT PRIMARY KEY,
    Name VARCHAR(50),

    Age INT CHECK (Age >= 18)
);

------------------------------------------------------------------------------
-- Valid
------------------------------------------------------------------------------

INSERT INTO Person
VALUES
(1,'Vishal',21);

------------------------------------------------------------------------------
-- Invalid
------------------------------------------------------------------------------

-- INSERT INTO Person
-- VALUES
-- (2,'Rahul',15);

------------------------------------------------------------------------------
-- 6. FOREIGN KEY
-- Creates a relationship between two tables.
------------------------------------------------------------------------------

CREATE TABLE Department
(
    DepartmentId INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE EmployeeDetails
(
    EmployeeId INT PRIMARY KEY,
    EmployeeName VARCHAR(50),

    DepartmentId INT,

    FOREIGN KEY (DepartmentId)
    REFERENCES Department(DepartmentId)
);

------------------------------------------------------------------------------
-- Insert Parent Table Data
------------------------------------------------------------------------------

INSERT INTO Department
VALUES
(101,'IT'),
(102,'HR');

------------------------------------------------------------------------------
-- Insert Child Table Data
------------------------------------------------------------------------------

INSERT INTO EmployeeDetails
VALUES
(1,'Vishal',101),
(2,'Ketan',102);

SELECT * FROM Department;
SELECT * FROM EmployeeDetails;

------------------------------------------------------------------------------
-- Summary
------------------------------------------------------------------------------

/*

PRIMARY KEY
------------
✔ Unique
✔ Not Null
✔ One Primary Key per Table

UNIQUE
-------
✔ Unique
✔ Allows NULL

NOT NULL
---------
✔ Value Required

DEFAULT
--------
✔ Inserts Default Value

CHECK
------
✔ Restricts Invalid Data

FOREIGN KEY
-----------
✔ Creates Relationship
✔ Maintains Referential Integrity

COMPOSITE PRIMARY KEY
---------------------
✔ Multiple Columns Together Form Primary Key

*/