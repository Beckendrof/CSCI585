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
WHERE Step = 0 AND Status = 'C'
AND PID IN (
    SELECT PID
    FROM Projects
    WHERE Step > 0
)
AND PID NOT IN (
    SELECT PID
    FROM Projects
    WHERE Step > 0 AND Status = 'C'
);

-- Here's how this query works:
-- * This query first selects projects where step 0 is completed, and then it ensures that the same PID has at least one row where step > 0. 
-- * After this, it filters out any project that has any step greater than 0 that is also completed. 
-- * The final result would be projects where only step 0 is completed, all other steps are waiting, and there is at least one step greater than 0.
-- If both conditions are true, the project ID is included in the result.