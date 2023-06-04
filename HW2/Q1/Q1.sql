CREATE TABLE ProjectRoomBookings
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime));

CREATE OR REPLACE TRIGGER checkBookingSlot
BEFORE INSERT ON ProjectRoomBookings
FOR EACH ROW
DECLARE
    bookingCount NUMBER;
    timeDiff NUMBER;
BEGIN
    SELECT COUNT(*) INTO bookingCount
    FROM ProjectRoomBookings
    WHERE roomNum = :NEW.roomNum
    AND endTime > :NEW.startTime
    AND startTime < :NEW.endTime;

	timeDiff := :NEW.endTime - :NEW.startTime;

    IF bookingCount > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Slot is already booked');
    ELSIF :NEW.startTime < 9 OR :NEW.endTime > 21 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Booking outside allowed time range (9 AM - 9 PM)');
    ELSIF timeDiff > 3 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Booking duration exceeds the allowed limit of 3 hours');
    END IF;
END;
/

INSERT INTO ProjectRoomBookings (roomNum, startTime, endTime, groupName)
VALUES (2, '8', '12', 'Trojan01');

INSERT INTO ProjectRoomBookings (roomNum, startTime, endTime, groupName)
VALUES (2, '9', '12', 'Trojan02');

INSERT INTO ProjectRoomBookings (roomNum, startTime, endTime, groupName)
VALUES (2, '17', '21', 'Trojan03');

INSERT INTO ProjectRoomBookings (roomNum, startTime, endTime, groupName)
VALUES (2, '17', '20', 'Trojan03');

INSERT INTO ProjectRoomBookings (roomNum, startTime, endTime, groupName)
VALUES (2, '20', '22', 'Trojan04');

SELECT * FROM ProjectRoomBookings