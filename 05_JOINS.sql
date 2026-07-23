/*
===============================================================================
Topic       : SQL Server Joins
Author      : Vishal Bharwad
Repository  : SQL-Server-Practice
Database    : College

Description :
This script demonstrates different types of SQL Joins:

1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
4. FULL OUTER JOIN
5. LEFT EXCLUSIVE JOIN
6. RIGHT EXCLUSIVE JOIN
7. FULL EXCLUSIVE JOIN
8. UNION
9. UNION ALL

===============================================================================
*/

------------------------------------------------------------------------------
-- USE DATABASE
------------------------------------------------------------------------------

USE College;

------------------------------------------------------------------------------
-- CREATE TABLES
------------------------------------------------------------------------------

CREATE TABLE Student
(
    StudentId INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Course
(
    StudentId INT PRIMARY KEY,
    Course VARCHAR(50)
);

------------------------------------------------------------------------------
-- INSERT SAMPLE DATA
------------------------------------------------------------------------------

INSERT INTO Student
VALUES
(101,'Adam'),
(102,'Bob'),
(103,'Casey');

INSERT INTO Course
VALUES
(102,'English'),
(103,'Science'),
(105,'Mathematics'),
(107,'Computer Science');

------------------------------------------------------------------------------
-- DISPLAY TABLES
------------------------------------------------------------------------------

SELECT * FROM Student;

SELECT * FROM Course;

------------------------------------------------------------------------------
-- INNER JOIN
-- Returns only matching records.
------------------------------------------------------------------------------

SELECT
    S.StudentId,
    S.Name,
    C.Course
FROM Student AS S
INNER JOIN Course AS C
ON S.StudentId = C.StudentId;

------------------------------------------------------------------------------
-- LEFT JOIN
-- Returns all rows from Student and matching rows from Course.
------------------------------------------------------------------------------

SELECT
    S.StudentId,
    S.Name,
    C.Course
FROM Student AS S
LEFT JOIN Course AS C
ON S.StudentId = C.StudentId;

------------------------------------------------------------------------------
-- RIGHT JOIN
-- Returns all rows from Course and matching rows from Student.
------------------------------------------------------------------------------

SELECT
    C.StudentId,
    S.Name,
    C.Course
FROM Student AS S
RIGHT JOIN Course AS C
ON S.StudentId = C.StudentId;

------------------------------------------------------------------------------
-- FULL OUTER JOIN
-- Returns all matching and non-matching records.
------------------------------------------------------------------------------

SELECT *
FROM Student AS S
FULL OUTER JOIN Course AS C
ON S.StudentId = C.StudentId;

------------------------------------------------------------------------------
-- LEFT EXCLUSIVE JOIN
-- Records present only in Student table.
------------------------------------------------------------------------------

SELECT *
FROM Student AS S
LEFT JOIN Course AS C
ON S.StudentId = C.StudentId
WHERE C.StudentId IS NULL;

------------------------------------------------------------------------------
-- RIGHT EXCLUSIVE JOIN
-- Records present only in Course table.
------------------------------------------------------------------------------

SELECT *
FROM Student AS S
RIGHT JOIN Course AS C
ON S.StudentId = C.StudentId
WHERE S.StudentId IS NULL;

------------------------------------------------------------------------------
-- FULL EXCLUSIVE JOIN
-- Non-matching rows from both tables.
------------------------------------------------------------------------------

SELECT *
FROM Student AS S
LEFT JOIN Course AS C
ON S.StudentId = C.StudentId
WHERE C.StudentId IS NULL

UNION

SELECT *
FROM Student AS S
RIGHT JOIN Course AS C
ON S.StudentId = C.StudentId
WHERE S.StudentId IS NULL;

------------------------------------------------------------------------------
-- UNION
-- Removes duplicate rows.
------------------------------------------------------------------------------

SELECT *
FROM Student

UNION

SELECT *
FROM Course;

------------------------------------------------------------------------------
-- UNION ALL
-- Includes duplicate rows.
------------------------------------------------------------------------------

SELECT *
FROM Student

UNION ALL

SELECT *
FROM Course;

------------------------------------------------------------------------------
-- END OF SCRIPT
------------------------------------------------------------------------------