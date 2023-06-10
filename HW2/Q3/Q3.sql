-- database created in liveSQL

CREATE TABLE Projects (
    PID VARCHAR2(10),
    Step NUMBER,
    Status CHAR(1)
);

INSERT INTO Projects (PID, Step, Status) VALUES ('P100', 0, 'C');
INSERT INTO Projects (PID, Step, Status) VALUES ('P100', 1, 'W');
INSERT INTO Projects (PID, Step, Status) VALUES ('P100', 2, 'W');
INSERT INTO Projects (PID, Step, Status) VALUES ('P201', 0, 'C');
INSERT INTO Projects (PID, Step, Status) VALUES ('P201', 1, 'C');
INSERT INTO Projects (PID, Step, Status) VALUES ('P333', 0, 'W');
INSERT INTO Projects (PID, Step, Status) VALUES ('P333', 1, 'W');
INSERT INTO Projects (PID, Step, Status) VALUES ('P333', 2, 'W');
INSERT INTO Projects (PID, Step, Status) VALUES ('P333', 3, 'W');

SELECT PID
FROM Projects
GROUP BY PID
HAVING MIN(CASE WHEN Step = 0 THEN Status END) = 'C' 
    AND MAX(CASE WHEN Step > 0 THEN Status END) = 'W';