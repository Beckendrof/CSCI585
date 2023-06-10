-- database created in liveSQL

CREATE TABLE Instructors (
    InstructorID NUMBER,
    Name VARCHAR2(100),
    HourlyRate NUMBER
);

INSERT INTO Instructors (InstructorID, Name, HourlyRate) VALUES (1, 'Johnny', 30);
INSERT INTO Instructors (InstructorID, Name, HourlyRate) VALUES (2, 'Bobby', 10);

CREATE TABLE Classes (
    ClassID NUMBER,
    InstructorID NUMBER,
    StudentCount NUMBER
);

INSERT INTO Classes (ClassID, InstructorID, StudentCount) VALUES (1, 1, 20);
INSERT INTO Classes (ClassID, InstructorID, StudentCount) VALUES (2, 1, 20);
INSERT INTO Classes (ClassID, InstructorID, StudentCount) VALUES (3, 1, 15);
INSERT INTO Classes (ClassID, InstructorID, StudentCount) VALUES (4, 2, 15);
INSERT INTO Classes (ClassID, InstructorID, StudentCount) VALUES (5, 2, 20);
INSERT INTO Classes (ClassID, InstructorID, StudentCount) VALUES (6, 1, 50);

SELECT MAX(HourlyRate * sum_of_class_counts * 0.1) AS HighestBonus
FROM (
    SELECT 
        I.HourlyRate, 
        SUM(C.StudentCount) as sum_of_class_counts
    FROM 
        Instructors I
    JOIN 
        Classes C 
    ON 
        I.InstructorID = C.InstructorID
    GROUP BY 
        I.HourlyRate
);