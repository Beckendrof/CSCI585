-- database created in liveSQL  

CREATE TABLE Instructors (
    Instructor VARCHAR2(50),
    Subject VARCHAR2(50)
);

BEGIN
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Aleph', 'MIDI controllers');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Aleph', 'Sound mixing');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Aleph', 'Synthesis algorithms');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Bit', 'EDM synthesis');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Bit', 'Electronic Music Fundamentals');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Bit', 'Sound mixing');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('CRC', 'EDM synthesis');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('CRC', 'Electronic Music Fundamentals');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Dat', 'MIDI controllers');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Dat', 'EDM synthesis');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Dat', 'Electronic Music Fundamentals');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Emscr', 'MIDI controllers');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Emscr', 'Synthesis algorithms');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Emscr', 'Electronic Music Fundamentals');
    INSERT INTO Instructors (Instructor, Subject) VALUES ('Emscr', 'EDM synthesis');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

WITH Subjects AS (
    SELECT 'Electronic Music Fundamentals' AS Subject FROM dual
    UNION ALL
    SELECT 'MIDI controllers' FROM dual
    UNION ALL
    SELECT 'EDM synthesis' FROM dual
)

SELECT Instructor
FROM Instructors
WHERE Subject IN (SELECT Subject FROM Subjects)
GROUP BY Instructor
HAVING COUNT(DISTINCT Subject) = (SELECT COUNT(*) FROM Subjects)
AND COUNT(Subject) <= 3;