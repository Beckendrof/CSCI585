-- postgis databse

CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

CREATE TABLE LOCATIONS (name varchar, pos geometry);

INSERT INTO LOCATIONS VALUES
	('OHE','POINT(-118.28909 34.02055)'),
	('Fairbanks', 'POINT(-118.28643 34.02345)'),
	('Armstrong', 'POINT(-118.28855 34.02015)'),
	('Heritage', 'POINT(-118.28681 34.02232)'),
	('Kehle', 'POINT(-118.28733 34.02259)'),
	('McKay', 'POINT(-118.28791 34.02300)'),
	('Evelin', 'POINT(-118.28564 34.02248)'),
	('Paderewski', 'POINT(-118.28496 34.02275)'),
	('Generations', 'POINT(-118.28328 34.02229)'),
	('Leavey', 'POINT(-118.28284 34.02151)'),
	('Doheny', 'POINT(-118.28343 34.02057)'),
	('Tommy', 'POINT(-118.28535 34.02061)'),
	('Home', 'POINT(-118.29039 34.02734)');

-- Convex Hull
SELECT ST_AsText(ST_ConvexHull(ST_Collect(pos))) FROM LOCATIONS;

-- Nearest neighbour
SELECT name, ST_Astext(pos) as location, ST_Distance(pos,'POINT(-118.29039 34.02734)') as distance 
FROM LOCATIONS
WHERE name<>'Home' 
ORDER BY ST_Distance(pos,'POINT(-118.29039 34.02734)') 
limit 4;