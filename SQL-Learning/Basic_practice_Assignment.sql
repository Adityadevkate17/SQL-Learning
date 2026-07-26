-- Create Table 

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary > 0),
    joining_date DATE NOT NULL,
    age INT CHECK (age >= 18)
);

SELECT * FROM employees;

-- Insert Values in table
INSERT INTO employees
(first_name, last_name, department, salary, joining_date, age)
VALUES
('Amit', 'Sharma', 'IT', 60000.00, '2022-05-01', 29),
('Neha', 'Patel', 'HR', 55000.00, '2021-08-15', 32),
('Ravi', 'Kumar', 'Finance', 70000.00, '2020-03-10', 35),
('Anjali', 'Verma', 'IT', 65000.00, '2019-11-22', 28),
('Suresh', 'Reddy', 'Operations', 50000.00, '2023-01-10', 26);


--Q1: Retrieve all employees' first_names and their departments.
SELECT first_name,dept_name FROM employees;

--Q2: Update the salary of all employees in the 'IT' department by increasing it by 10%
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'IT';

--Q3: Delete all employees who are older than 34 years.
DELETE FROM employees
WHERE age > 34;

--Q4: Add a new column 'email' to the 'employees' table.
ALTER TABLE employees
ADD COLUMN email VARCHAR(30);

--Q5: Rename the 'department' column to 'dept_name'.
ALTER TABLE employees
RENAME department TO dept_name;

-- Q6: Retrieve the names of employees who joined after January 1, 2021.
SELECT first_name, last_name FROM employees
WHERE joining_date > '01-01-2021';

-- Q7: Change the data type of the 'salary' column to INTEGER.
ALTER TABLE employees
ALTER COLUMN salary TYPE INTEGER;

-- Q8: List all employees with their age and salary in descending order of salary.
SELECT first_name, last_name,salary FROM employees
ORDER BY salary DESC;

-- Q9: Insert a new employee
INSERT INTO employees
(first_name, last_name, dept_name, salary, joining_date, age)
VALUES
('Aditya', 'devkate', 'IT', 200000.00, '2022-05-01', 24);

-- Q10: Update age of every employee by +1
UPDATE employees
SET age = age+1;
