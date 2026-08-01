-- CRETAE TABLE 
SELECT * FROM employee2;
	CREATE TABLE employee3(
	  employee_id INT PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	email VARCHAR(100),
	department VARCHAR(100),
	salary NUMERIC (10,2),
	joining_date DATE,
	age INT
	);

--DROP TABLE 
DROP TABLE employee2;

-- ADD DATASET 
COPY employee2
(employee_id,
first_name,
last_name,
email,
department,
salary,
joining_date,
age)

FROM '‪‪C:\Users\Aditay Devkate\Desktop\tutorials\postgreSQL\ST - SQL ALL PRACTICE FILES-2\employee3 data.csv'
DELIMITER','
CSV HEADER;

------ OPERATORS ------

-- * ARITHMETIC OPERATOR

-- retrive the first_name,salary and aclculate a 10 % bounus on the salary 
SELECT first_name, salary, ( salary*0.10) AS BOUNS
FROM employee2;

-- Calculate the annual salary and salary increment by 5% show the monthly new salary as well 
SELECT first_name, last_name, salary, 
	(salary *12) AS annual_salary,
	(salary * 0.05) AS increment_ammount,
	(salary + salary * 0.5) AS new_salary
FROM employee2;

-- ** Comparison Operators 

-- matches age 30
SELECT * FROM employee2
WHERE age = 30;

--  matches all except 30 
SELECT first_name,age FROM employee2
WHERE age!=30;

-- salary gretar than 50000 
SELECT first_name, salary FROM employee2
WHERE salary > 50000;



-- ** Logical operator 

-- age is greater than 40 AND salary 50000
SELECT first_name,age,salary FROM employee2
WHERE age >=40 AND salary >=50000;

-- Using OR operator 
SELECT first_name,age,salary FROM employee2
WHERE age >60 OR salary >50000;

-- Using NOT operator
SELECT first_name,department FROM employee2
WHERE NOT(department = 'IT');



-- ** BETWEEN operator 

-- Retrives employees whos salary is between 40,000 and 60,000 
SELECT first_name, last_name,salary FROM employee2
WHERE salary BETWEEN 40000 and 60000;


-- ** LIKE operator 

-- find employees whoes email addreses end with gmail.com 
SELECT first_name, last_name,email FROM employee2
WHERE email LIKE '%gmail.com';

-- Second Example
SELECT first_name FROM employee2
WHERE first_name LIKE 'A%';


-- ** IN operator  

-- retrives employees whos belong to either the 'Finance' or 'marketing' departments 
SELECT first_name,department FROM employee2
WHERE department IN ('Finance','Marketing','IT');


-- ** NULL operator 

-- find employees where the email column is NULL ( if applicable )
SELECT first_name,email FROM employee2
WHERE email IS NULL;


-- ** ORDER Operator

--Q list employee sorted by salary is DESCENDING order
SELECT first_name,salary FROM employee2
ORDER BY salary DESC;

-- ** LIMTI operator 

--Q retrive the top 5 highest-paid employees
SELECT first_name,salary FROM employee2
ORDER BY salary DESC
LIMIT 5;


-- ** DISTINCT / DUBLICATE operator 

-- retrive  a list of unique departments 
SELECT COUNT( DISTINCT department ) AS uniq_department_count
FROM employee2;


-- ** SET Operator 

SELECT * FROM students_2023;

CREATE TABLE students_2023 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2023 (student_id, student_name, course)
VALUES
(1, 'Aarav Sharma', 'Computer Science'),
(2, 'Ishita Verma', 'Mechanical Engineering'),
(3, 'Kabir Patel', 'Electronics'),
(4, 'Ananya Desai', 'Civil Engineering'),
(5, 'Rahul Gupta', 'Computer Science');

SELECT * FROM students_2024;

CREATE TABLE students_2024 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2024 (student_id, student_name, course)
VALUES
(3, 'Kabir Patel', 'Electronics'),          -- Same as students_2023
(4, 'Ananya Desai', 'Civil Engineering'),   -- Same as students_2023
(6, 'Meera Rao', 'Computer Science'),
(7, 'Vikram Singh', 'Mathematics'),
(8, 'Sanya Kapoor', 'Physics');

--  UNION -- combine results remove duplicates  
	SELECT student_name,course FROM students_2023
	UNION 
	SELECT student_name,course FROM students_2024;

-- UNION ALL -- combine results, keeps duplicates
    SELECT student_name,course FROM students_2023
	UNION ALL
	SELECT student_name,course FROM students_2024;

--INTERSECT - returns comman result in both tables 
    SELECT student_name,course FROM students_2023
	INTERSECT ALL
	SELECT student_name,course FROM students_2024;

--EXCEPT -- returns results in the first table but not in the second 
    SELECT student_name,course FROM students_2023
	EXCEPT ALL
	SELECT student_name,course FROM students_2024;










