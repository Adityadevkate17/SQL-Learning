--- CREATE DATABASE ---

CREATE DATABASE company;

CREATE TABLE employee(
	employee_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	postiion VARCHAR(50),
	department VARCHAR(50),
	hire_date DATE,
	salary NUMERIC(10,2)
);

SELECT * FROM employee;


--- INSERT DATA INTO TABLE ---
SELECT * FROM employee;

INSERT INTO employee(name, position, department, hire_date, salary)
		VALUES ('Ajit Sharma', 'Data Analyst', 'Data Science', '2022-05-15', 65000.00),
			('Priya Desai','Software Engineer', 'IT', '2021-09-20',75000.00),
			('Rajesh Kumar', 'HR Manager', 'Human Resources', '2019-03-10', 82000.00),
			('Sneha Patel', 'Marketing Specialist', 'Marketing', '2020-11-25', 58000.00),
			('Vikram Singh', 'Sales Executive', 'Sales', '2023-02-12', 62000.00);


ALTER TABLE employee
RENAME COLUMN postiion TO position;

TRUNCATE TABLE employee;

TRUNCATE TABLE employee RESTART IDENTITY;

SELECT * FROM empl
--- DELETE ROWS , COLUMN FROM TABLE 

DELETE FROM employee2
WHERE employee_id=100;

ALTER TABLE employee2
DROP COLUMN salary;

DROP TABLE IF EXISTS employee2;

DROP DATABASE IF EXISTS company2;


--- DATA TYPES AND CONTRAINS ---

--INSERTING DATA INTO TABLE
INSERT INTO users (user_id, username, email, age) 
VALUES (7, 'John Doe', 'john.doe@example.com', 25);

-- INSERTING DATA INTO TABLE 2
INSERT INTO users (user_id, username, email, age) 
VALUES (8, 'John Doe', 'john1.doe@example.com', 19);
		

--- UPDATE DATA IN SQL ---

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT,
    city VARCHAR(50)
);


SELECT * FROM users;

-- Insert 5 sample users into the users table

INSERT INTO USERS (USERNAME,EMAIL, AGE,CITY)
VALUES ('Rajesh', 'rajesh@gmail.com', 25, 'Mumbai'),
				('Priya', 'priya@yahoo.com', 30, 'Delhi'),
				('Ankit', 'ankit@gmail.com', 28, 'Bangalore'),
				('Sneha', 'sneha@hotmail.com', 35, 'Pune'),
				('Vikram', 'vikram@gmail.com', 22, 'Hyderabad');


SELECT username, city FROM users;
UPDATE users 
SET age=28
WHERE username='Rajesh';

SELECT * FROM users;


SELECT * FROM users ORDER BY user_id ASC;
UPDATE users
SET city='Chennai'
WHERE age>=30;

UPDATE users
SET age=31, city='kolkat1a'
WHERE username='Priya';

UPDATE users
SET age=age+1
WHERE email LIKE '%@gmail.com';


--- ALTER COLUMN AND DATATYPE ---


SELECT USERNAME,CITY
FROM USERS;

UPDATE users 
SET age=28
WHERE username='Rajesh';

SELECT *
FROM USERS
ORDER BY USER_ID ASC;

UPDATE users
SET city='Chennai'
WHERE age>=30;

UPDATE users
SET age=31, city='kolkat1a'
WHERE username='Priya';

UPDATE users
SET age=age+1
WHERE email LIKE '%@gmail.com';

DELETE FROM users WHERE user_id=6;

-- To Rename the username column to Full_Name

ALTER TABLE users
RENAME COLUMN username TO full_name;

SELECT * FROM USERS ORDER BY USER_ID ASC;

--To change the age column's data type from INT to SMALLINT

ALTER TABLE users
ALTER COLUMN age TYPE SMALLINT;


-- TO add a NOT NULL CONSTRAINT to city column

ALTER TABLE users
ALTER COLUMN city SET NOT NULL;

-- Adding CHECK constraint to age column

ALTER TABLE users
DROP CONSTRAINT age;

ALTER TABLE users
ADD CONSTRAINT age CHECK(age>=18);

-- inserting data to check constraint of age
INSERT INTO USERS (FULL_NAME,EMAIL, AGE,CITY)
VALUES ('Vinod', 'rajesh@gmail.com',19, 'Mumbai');

-- change the table name
ALTER TABLE users
RENAME TO customers;

SELECT * FROM customers ORDER BY USER_ID ASC;










