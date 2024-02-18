-- Change the name from  students.st_id to students.student_ID
ALTER TABLE STUDENTS RENAME COLUMN ST_ID TO STUDENT_ID;


-- Increase the length of STUDENTS.ST_NAME and STUDENTS.ST_LAST from 20 to 30
ALTER TABLE STUDENTS ALTER COLUMN ST_NAME TYPE VARCHAR(30);
ALTER TABLE STUDENTS ALTER COLUMN ST_LAST TYPE VARCHAR(30);


--Change the name of the INTERESTS.INTEREST to INTERESTS
ALTER TABLE INTERESTS RENAME COLUMN INTEREST TO INTERESTS;


-- Create an extra table INTERESTS_EXTRA to save interests as an array of strings for every student.
CREATE TABLE INTERESTS_EXTRA (
    STUDENT_ID INTEGER REFERENCES STUDENTS(STUDENT_ID),
    INTERESTS VARCHAR[]
);


-- Insert data into the additionally created INTERESTS_EXTRA table + interests aggregated 
INSERT INTO INTERESTS_EXTRA (STUDENT_ID, INTERESTS)
SELECT STUDENT_ID, ARRAY_AGG(INTERESTS) 
FROM INTERESTS 
GROUP BY STUDENT_ID
ORDER by STUDENT_ID;


-- Drop the originaly created table INTERESTS 
DROP TABLE INTERESTS;

-- Rename the INTERESTS_EXTRA table to INTERESTS to replace the originaly created table
ALTER TABLE INTERESTS_EXTRA RENAME TO INTERESTS;

--Migration is done 
