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

WITH RequiredSubjects AS (
    SELECT 'Electronic Music Fundamentals' AS Subject FROM dual
    UNION ALL
    SELECT 'MIDI controllers' FROM dual
    UNION ALL
    SELECT 'EDM synthesis' FROM dual
)

SELECT DISTINCT Instructor
FROM Instructors i
WHERE NOT EXISTS (
    (SELECT Subject FROM RequiredSubjects)
    MINUS
    (SELECT Subject FROM Instructors WHERE Instructor = i.Instructor)
);

-- In the **'Q5_v2.sql'** file, for each instructor, I have subtracted the subjects they can teach from the 
-- required subjects. If there are no remaining subjects after the subtraction (which is achieved with the `MINUS` operator), 
-- it means the instructor can teach all required subjects.