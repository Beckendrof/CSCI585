-- database created in liveSQL
CREATE TABLE CLASS
(SID INTEGER NOT NULL,
CLASSNAME CHAR(20) NOT NULL,
GRADE CHAR(1) NOT NULL,
PRIMARY KEY (SID));

INSERT INTO CLASS (SID, CLASSNAME, GRADE)
VALUES (100, 'synthetic algorithms', 'A');

INSERT INTO CLASS (SID, CLASSNAME, GRADE)
VALUES (102, 'edm synthesis', 'A');

INSERT INTO CLASS (SID, CLASSNAME, GRADE)
VALUES (102, 'MIDI controllers', 'B');

INSERT INTO CLASS (SID, CLASSNAME, GRADE)
VALUES (103, 'MIDI controllers', 'A');

INSERT INTO CLASS (SID, CLASSNAME, GRADE)
VALUES (104, 'MIDI controllers', 'A');

INSERT INTO CLASS (SID, CLASSNAME, GRADE)
VALUES (105, 'MIDI controllers', 'A');

INSERT INTO CLASS (SID, CLASSNAME, GRADE)
VALUES (105, 'synthetic algorithms', 'C');

SELECT CLASSNAME, COUNT(*) AS STRENGTH
FROM CLASS
GROUP BY CLASSNAME
ORDER BY STRENGTH DESC;