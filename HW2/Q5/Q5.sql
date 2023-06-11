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
HAVING COUNT(DISTINCT Subject) = (SELECT COUNT(*) FROM Subjects);

-- This query does the following:

-- * It uses a `WITH` clause to create a subquery named `RequiredSubjects`. This subquery lists the subjects that an instructor must be able to teach to be considered qualified.
-- * It selects the `Instructor` from the `Instructors` table where the Subject is in the list of required subjects.
-- * It groups the results by `Instructor`.
-- * It uses the HAVING clause to filter the results where the count of distinct subjects for an instructor is equal to the total count of required subjects. This ensures that the selected instructors can teach all required subjects.

-- The `GROUP BY` and `HAVING` clauses are necessary to count the number of different subjects each instructor can teach, and then to compare that count to the total number of required subjects. If an instructor can teach all required subjects, 
-- their count of distinct subjects will equal the total count of required subjects.