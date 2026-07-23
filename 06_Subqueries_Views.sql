/*
===============================================================================
Topic       : SQL Subqueries & Views
Author      : Vishal Bharwad
Repository  : SQL-Server-Practice
Database    : College

Description :
This script demonstrates:

1. Single Row Subquery
2. Multi Row Subquery
3. Subquery using IN
4. Subquery in FROM Clause
5. Aggregate Function with Subquery
6. Creating Views
7. Retrieving Data from Views

===============================================================================
*/

------------------------------------------------------------------------------
-- USE DATABASE
------------------------------------------------------------------------------

USE College;

------------------------------------------------------------------------------
-- CREATE STUDENTS TABLE
------------------------------------------------------------------------------

CREATE TABLE Students
(
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT NOT NULL,
    Grade CHAR(1),
    City VARCHAR(20)
);

------------------------------------------------------------------------------
-- INSERT SAMPLE DATA
------------------------------------------------------------------------------

INSERT INTO Students
VALUES
(101,'Anil',78,'C','Pune'),
(102,'Bhumika',93,'A','Mumbai'),
(103,'Chetan',85,'B','Mumbai'),
(104,'Dhruv',96,'A','Delhi'),
(105,'Emanuel',12,'F','Delhi'),
(106,'Farah',82,'B','Delhi');

------------------------------------------------------------------------------
-- DISPLAY DATA
------------------------------------------------------------------------------

SELECT *
FROM Students;

------------------------------------------------------------------------------
-- AVERAGE MARKS
------------------------------------------------------------------------------

SELECT AVG(Marks) AS AverageMarks
FROM Students;

------------------------------------------------------------------------------
-- WITHOUT SUBQUERY
-- Students having marks greater than 74
------------------------------------------------------------------------------

SELECT Name, Marks
FROM Students
WHERE Marks > 74;

------------------------------------------------------------------------------
-- SINGLE ROW SUBQUERY
-- Students having marks greater than average marks
------------------------------------------------------------------------------

SELECT Name, Marks
FROM Students
WHERE Marks >
(
    SELECT AVG(Marks)
    FROM Students
);

------------------------------------------------------------------------------
-- EVEN ROLL NUMBERS
------------------------------------------------------------------------------

SELECT RollNo, Name
FROM Students
WHERE RollNo % 2 = 0;

------------------------------------------------------------------------------
-- SUBQUERY USING IN
------------------------------------------------------------------------------

SELECT Name
FROM Students
WHERE RollNo IN
(
    102,
    104,
    106
);

------------------------------------------------------------------------------
-- SUBQUERY WITH IN OPERATOR
------------------------------------------------------------------------------

SELECT RollNo, Name
FROM Students
WHERE RollNo IN
(
    SELECT RollNo
    FROM Students
    WHERE RollNo % 2 = 0
);

------------------------------------------------------------------------------
-- SUBQUERY IN FROM CLAUSE
-- Maximum marks among Delhi students
------------------------------------------------------------------------------

SELECT MAX(Marks) AS MaximumMarks
FROM
(
    SELECT *
    FROM Students
    WHERE City = 'Delhi'
) AS TempTable;

------------------------------------------------------------------------------
-- VIEWS
------------------------------------------------------------------------------

CREATE VIEW StudentView
AS
SELECT
    RollNo,
    Name,
    Marks
FROM Students;

------------------------------------------------------------------------------
-- DISPLAY VIEW
------------------------------------------------------------------------------

SELECT *
FROM StudentView;

------------------------------------------------------------------------------
-- END OF SCRIPT
------------------------------------------------------------------------------