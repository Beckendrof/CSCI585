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

-- For this question I created two different tables named `Instuctors` and `Classes` 
-- respectively and populated them with some data. The script calculates the bonus for 
-- each instructor by joining the `Instructors` and `Classes` tables based on the 
-- instructor ID, then calculates the total student count for each instructor, multiplies 
-- this by the instructor's hourly rate and 0.1, and finally outputs the maximum bonus. 
-- Note that the sum of the student counts and the maximum bonus are calculated in 
-- separate steps because Oracle SQL does not allow using aggregate functions like 
-- `SUM` and `MAX` in the same `SELECT` clause.