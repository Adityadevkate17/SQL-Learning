-- ** JOINS **

-- Table 1
CREATE TABLE Employees3 (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

INSERT INTO Employees3 (first_name, last_name, department_id)
VALUES
('Rahul', 'Sharma', 101),
('Priya', 'Mehta', 102),
('Ankit', 'Verma', 103),
('Simran', 'Kaur', NULL),
('Aman', 'Singh', 101);

-- Table 2
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Departments (department_id, department_name)
VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'IT'),
(104, 'HR');

SELECT * FROM Employees3;
SELECT * FROM Departments;


-- INNER JOIN  -> Show only those employees who have a matching department.
SELECT e.employee_id,e.first_name,e.last_name,
		d.department_id,d.department_name
FROM Employees3 e
INNER JOIN 
Departments d
ON e.department_id=d.department_id;

--LEFT JOIN  -> Show all employees and their department names, even if some employees do not have a department.
SELECT e.employee_id,e.first_name,e.last_name,
		d.department_id,d.department_name
FROM Employees3 e
LEFT JOIN 
Departments d
ON e.department_id=d.department_id;

--RIGHT JOIN ->Show all departments and their employees, even if a department has no employees.
SELECT e.employee_id,e.first_name,e.last_name,
		d.department_id,d.department_name
FROM Employees3 e
RIGHT JOIN 
Departments d
ON e.department_id=d.department_id;


-- FULL OUTER JOINS  -> all records show on both table including non-matching record 
SELECT e.employee_id,e.first_name,e.last_name,
		d.department_id,d.department_name
FROM Employees3 e
FULL OUTER JOIN 
Departments d
ON e.department_id=d.department_id;
	
-- CROSS JOIN  -> Retrieve all possible combinations of Employees3 and departments.
SELECT e.first_name,e.last_name,d.department_name
FROM Employees3 e
CROSS JOIN 
Departments d;

--SELF JOIN  ->Find Employees3 who share the same department.
SELECT e1.first_name AS Employees_name1,
	   e2.first_name AS Employees_name2
FROM employees3 e1
JOIN 
employees3 e2
ON e1.department_id = e2.department_id AND e1.employee_id = e2.employee_id;







