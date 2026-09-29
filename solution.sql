USE collegeDBbca;
CREATE TABLE Department2 (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);

CREATE TABLE Course2 (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(50),
DepartmentID INT,
FOREIGN KEY (DepartmentID)
REFERENCES Department2(DepartmentID)
);

CREATE TABLE Faculty (
FacultyID INT PRIMARY KEY,
FacultyName VARCHAR(50),
DepartmentID INT,
FOREIGN KEY (DepartmentID)
REFERENCES Department2(DepartmentID)
);

CREATE TABLE Student2 (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50),
CourseID INT,
FacultyID INT,
FOREIGN KEY (CourseID)
REFERENCES Course(CourseID),
FOREIGN KEY (FacultyID)
REFERENCES Faculty(FacultyID)
);

INSERT INTO Department2 VALUES
(1,"Computer Science"),
(2,"Commerce");

INSERT INTO Course2 VALUES
(101,"BCA", 1),
(102,"BCom", 2);


INSERT INTO Faculty VALUES
(201,"Dr. Kumar", 1),
(202,"Dr. Ravi", 2);

INSERT INTO Student2 VALUES
(1,"Arun", 101, 201),
(2,"Priya", 101, 201),
(3,"Rahul", 102, 202);

SELECT
s.StudentID,
s.StudentName,
c.CourseName,
f.FacultyName,
d.DepartmentName
FROM Student s
JOIN Course c
ON s.CourseID = c.CourseID
JOIN Faculty f
ON s.FacultyID = f.FacultyID
JOIN Department d
ON c.DepartmentID = d.DepartmentID;
DROP TABLE Department;
