/*
===============================================================================
Topic       : SELECT Statement, WHERE Clause, ORDER BY, Aggregate Functions,
              GROUP BY, HAVING Clause
Author      : Vishal Bharwad
Repository  : SQL-Server-Practice
Description : This script demonstrates commonly used SQL Server queries for
              retrieving, filtering, sorting, grouping, and summarizing data.
===============================================================================
*/

------------------------------------------------------------------------------
-- Use Database
------------------------------------------------------------------------------

USE College;

------------------------------------------------------------------------------
-- Create Student Table
------------------------------------------------------------------------------

CREATE TABLE Student
(
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT NOT NULL,
    Grade CHAR(1),
    City VARCHAR(20)
);

------------------------------------------------------------------------------
-- Insert Records
------------------------------------------------------------------------------

INSERT INTO Student (RollNo, Name, Marks, Grade, City)
VALUES
(101,'Anil',78,'C','Pune'),
(102,'Bhumika',93,'A','Mumbai'),
(103,'Chetan',85,'B','Mumbai'),
(104,'Dhruv',96,'A','Delhi'),
(105,'Emanuel',12,'F','Delhi'),
(106,'Farah',82,'B','Delhi');

------------------------------------------------------------------------------
-- SELECT Statement
------------------------------------------------------------------------------

-- Display all columns
SELECT * FROM Student;

-- Display selected columns
SELECT Name, Marks
FROM Student;

-- Display unique cities
SELECT DISTINCT City
FROM Student;

------------------------------------------------------------------------------
-- WHERE Clause
------------------------------------------------------------------------------

-- Students with marks greater than 80
SELECT *
FROM Student
WHERE Marks > 80;

-- Students from Mumbai
SELECT *
FROM Student
WHERE City = 'Mumbai';

-- Marks greater than 80 AND city is Mumbai
SELECT *
FROM Student
WHERE Marks > 80 AND City = 'Mumbai';

-- Marks greater than 80 OR city is Mumbai
SELECT *
FROM Student
WHERE Marks > 80 OR City = 'Mumbai';

------------------------------------------------------------------------------
-- Operators
------------------------------------------------------------------------------

-- Arithmetic Operator
SELECT *
FROM Student
WHERE Marks + 10 > 100;

-- Comparison Operator
SELECT *
FROM Student
WHERE Marks = 93;

-- BETWEEN Operator
SELECT *
FROM Student
WHERE Marks BETWEEN 80 AND 90;

-- IN Operator
SELECT *
FROM Student
WHERE City IN ('Delhi', 'Mumbai');

-- NOT IN Operator
SELECT *
FROM Student
WHERE City NOT IN ('Delhi', 'Mumbai');

------------------------------------------------------------------------------
-- TOP Clause (SQL Server)
------------------------------------------------------------------------------

SELECT TOP 3 *
FROM Student;

------------------------------------------------------------------------------
-- ORDER BY Clause
------------------------------------------------------------------------------

-- Ascending Order
SELECT *
FROM Student
ORDER BY City ASC;

-- Descending Order
SELECT *
FROM Student
ORDER BY Marks DESC;

------------------------------------------------------------------------------
-- Aggregate Functions
------------------------------------------------------------------------------

-- Maximum Marks
SELECT MAX(Marks) AS MaximumMarks
FROM Student;

-- Minimum Marks
SELECT MIN(Marks) AS MinimumMarks
FROM Student;

-- Average Marks
SELECT AVG(Marks) AS AverageMarks
FROM Student;

-- Total Students
SELECT COUNT(RollNo) AS TotalStudents
FROM Student;

------------------------------------------------------------------------------
-- GROUP BY Clause
------------------------------------------------------------------------------

-- Count students city-wise
SELECT City, COUNT(RollNo) AS TotalStudents
FROM Student
GROUP BY City;

-- Average marks city-wise
SELECT City, AVG(Marks) AS AverageMarks
FROM Student
GROUP BY City
ORDER BY AverageMarks DESC;

-- Count students grade-wise
SELECT Grade, COUNT(RollNo) AS TotalStudents
FROM Student
GROUP BY Grade
ORDER BY Grade;

------------------------------------------------------------------------------
-- HAVING Clause
------------------------------------------------------------------------------

-- Cities where maximum marks are greater than 90
SELECT City, COUNT(RollNo) AS TotalStudents
FROM Student
GROUP BY City
HAVING MAX(Marks) > 90;

------------------------------------------------------------------------------
-- General Order of SQL Clauses
------------------------------------------------------------------------------

/*
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
*/

SELECT City
FROM Student
WHERE Grade = 'A'
GROUP BY City
HAVING MAX(Marks) > 90
ORDER BY City ASC;