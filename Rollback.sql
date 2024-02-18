-- Creation of temporary table
-- Create the ORG_INTERESTS table back again for storing interests in the original format
 CREATE TABLE ORG_INTERESTS 
(
STUDENT_ID INTEGER REFERENCES STUDENTS(STUDENT_ID),
INTEREST VARCHAR(20)
);

-- Retrieve the interests array into the original format and insert the unpacked strings into the temporary table ORG_INTERESTS
--Unpacking is done using UNNEST function.
INSERT INTO ORG_INTERESTS (STUDENT_ID, INTEREST)
SELECT STUDENT_ID, UNNEST(INTERESTS) 
FROM INTERESTS;

-- Drop the INTERESTS table and rename ORG_INTERESTS back to INTERESTS
DROP TABLE INTERESTS;
ALTER TABLE ORG_INTERESTS RENAME TO INTERESTS;


-- Retrieve back all changes that were done for students table
ALTER TABLE STUDENTS RENAME COLUMN STUDENT_ID TO ST_ID;
ALTER TABLE STUDENTS ALTER COLUMN ST_NAME TYPE VARCHAR(20);
ALTER TABLE STUDENTS ALTER COLUMN ST_LAST TYPE VARCHAR(20);

