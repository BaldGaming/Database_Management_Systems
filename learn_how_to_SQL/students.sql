-- We define a table
CREATE TABLE students (
    sid int PRIMARY KEY,
    name varchar(20),
    age int
);


-- Use these commands to manage the table
INSERT INTO students (sid, name, age) VALUES (1, 'Itay', 20); -- Adds new rows
UPDATE students SET age = 21 WHERE sid = 1; -- Modifies existing data
-- DELETE: removes rows based on condition


-- Retrieving info
SELECT name, age -- Select which columns we want to see (use * for all)
FROM students -- Which table
WHERE age >= 18 -- Filter the rows based on a condition
ORDER BY name ASC; -- Sort the results