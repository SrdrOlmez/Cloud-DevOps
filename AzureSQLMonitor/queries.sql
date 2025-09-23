-- Create table
CREATE TABLE Students (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50),
    Age INT,
    Course NVARCHAR(50)
);

-- Insert data
INSERT INTO Students (Name, Age, Course) VALUES
('Alice', 22, 'Azure Fundamentals'),
('Bob', 25, 'DevOps Basics');

-- Read data
SELECT * FROM Students;

-- Update record
UPDATE Students SET Course='Azure & DevOps' WHERE Name='Bob';

-- Delete record
DELETE FROM Students WHERE Name='Alice';

-- Confirm changes
SELECT * FROM Students;

