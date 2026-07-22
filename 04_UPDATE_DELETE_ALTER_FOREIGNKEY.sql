/*
===============================================================================
Topic       : UPDATE, DELETE, FOREIGN KEY, ALTER TABLE & TRUNCATE
Author      : Vishal Bharwad
Repository  : SQL-Server-Practice
Database    : College

Description :
This script demonstrates:

1. UPDATE Statement
2. DELETE Statement
3. FOREIGN KEY
4. ON UPDATE CASCADE
5. ON DELETE CASCADE
6. ALTER TABLE
7. TRUNCATE TABLE

===============================================================================
*/

------------------------------------------------------------------------------
-- USE DATABASE
------------------------------------------------------------------------------

USE College;

------------------------------------------------------------------------------
-- CREATE STUDENT TABLE
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
-- INSERT SAMPLE DATA
------------------------------------------------------------------------------

INSERT INTO Student (RollNo, Name, Marks, Grade, City)
VALUES
(101, 'Anil',    78, 'C', 'Pune'),
(102, 'Bhumika', 93, 'A', 'Mumbai'),
(103, 'Chetan',  85, 'B', 'Mumbai'),
(104, 'Dhruv',   96, 'A', 'Delhi'),
(105, 'Emanuel', 12, 'F', 'Delhi'),
(106, 'Farah',   82, 'B', 'Delhi');

------------------------------------------------------------------------------
-- DISPLAY RECORDS
------------------------------------------------------------------------------

SELECT * FROM Student;

------------------------------------------------------------------------------
-- UPDATE STATEMENT
------------------------------------------------------------------------------

-- Change Grade A to O

UPDATE Student
SET Grade = 'O'
WHERE Grade = 'A';

-- Update Marks of Roll Number 105

UPDATE Student
SET Marks = 82
WHERE RollNo = 105;

-- Change Grade to B where Marks are between 80 and 90

UPDATE Student
SET Grade = 'B'
WHERE Marks BETWEEN 80 AND 90;

-- Increase Marks of every student by 1

UPDATE Student
SET Marks = Marks + 1;

------------------------------------------------------------------------------
-- DISPLAY UPDATED DATA
------------------------------------------------------------------------------

SELECT * FROM Student;

------------------------------------------------------------------------------
-- DELETE STATEMENT
------------------------------------------------------------------------------

-- Delete students whose marks are less than 33

DELETE FROM Student
WHERE Marks < 33;

SELECT * FROM Student;

------------------------------------------------------------------------------
-- FOREIGN KEY WITH CASCADE
------------------------------------------------------------------------------

CREATE TABLE Department
(
    DepartmentId INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Teacher
(
    TeacherId INT PRIMARY KEY,
    TeacherName VARCHAR(50),

    DepartmentId INT,

    FOREIGN KEY (DepartmentId)
    REFERENCES Department(DepartmentId)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

------------------------------------------------------------------------------
-- INSERT DATA
------------------------------------------------------------------------------

INSERT INTO Department
VALUES
(101,'Agriculture'),
(102,'IT');

INSERT INTO Teacher
VALUES
(1,'Adam',101),
(2,'Eve',102);

------------------------------------------------------------------------------
-- DISPLAY TABLES
------------------------------------------------------------------------------

SELECT * FROM Department;

SELECT * FROM Teacher;

------------------------------------------------------------------------------
-- CASCADE UPDATE
------------------------------------------------------------------------------

UPDATE Department
SET DepartmentId = 103
WHERE DepartmentId = 102;

SELECT * FROM Department;

SELECT * FROM Teacher;

------------------------------------------------------------------------------
-- ALTER TABLE
------------------------------------------------------------------------------

-- Add New Column

ALTER TABLE Student
ADD Age INT;

-- Change Data Type

ALTER TABLE Student
ALTER COLUMN Age VARCHAR(50);

-- Rename Column

EXEC sp_rename 'Student.Age', 'StudentAge', 'COLUMN';

-- Rename Table

EXEC sp_rename 'Student', 'Students';

------------------------------------------------------------------------------
-- DISPLAY TABLE
------------------------------------------------------------------------------

SELECT * FROM Students;

------------------------------------------------------------------------------
-- Drop Column
------------------------------------------------------------------------------

ALTER TABLE Students
DROP COLUMN StudentAge;

------------------------------------------------------------------------------
-- TRUNCATE TABLE
------------------------------------------------------------------------------

TRUNCATE TABLE Students;

------------------------------------------------------------------------------
-- END OF SCRIPT
------------------------------------------------------------------------------