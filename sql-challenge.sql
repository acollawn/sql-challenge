-- Drop table if exists
DROP TABLE departments;
DROP TABLE employees;
DROP TABLE titles;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;


-- Create table - (1)departments
CREATE TABLE departments (
	dept_no VARCHAR(25) NOT NULL,
	dept_name VARCHAR(25) NOT NULL,
	PRIMARY KEY (dept_no)
	);
INSERT INTO departments (dept_no, dept_name)
VALUES ('d001', 'Marketing'),
('d002', 'Finance'),
('d003', 'Human Resources'),
('d004', 'Production'),
('d005', 'Development'),
('d006', 'Quality Management'),
('d007', 'Sales'),
('d008', 'Research'),
('d009', 'Customer Service');

SELECT * FROM departments;

-- Create table - TITLES
CREATE TABLE titles (
	title_id VARCHAR(25) NOT NULL,
	title VARCHAR (25),
	PRIMARY KEY (title_id)
	);

INSERT INTO titles (title_id, title)
VALUES ('s0001', 'Staff'),
('s0002', 'Senior Staff'),
('e0001', 'Assistant Engineer'),
('e0002', 'Engineer'),
('e0003', 'Senior Engineer'),
('e0004', 'Technique Leader'),
('m0001', 'Manager');

SELECT * 
FROM titles;

-- Create table - employees
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(25) NOT NULL,
	birth_date VARCHAR(25),
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	sex VARCHAR(25),
	hire_date VARCHAR(25),
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
	);

SELECT * FROM employees;


-- Create table and view column datatypes
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(25)
	);

SELECT * FROM dept_emp;

-- Create table and view column datatypes
CREATE TABLE dept_manager (
	dept_no VARCHAR(25),
	emp_no INT
	);

SELECT * FROM dept_manager;

-- Create table and view column datatypes
CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	PRIMARY KEY (emp_no)
	);

SELECT * FROM salaries;

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON 
s.emp_no=e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date LIKE '%1986';

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT  titles.title, dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, e.last_name, e.first_name
FROM dept_manager
INNER JOIN departments ON 
dept_manager.dept_no=departments.dept_no
INNER JOIN employees as e ON
dept_manager.emp_no=e.emp_no
INNER JOIN titles ON
e.emp_title_id=titles.title_id
WHERE title_id = 'm0001';

--List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no, e.last_name, e.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees as e ON
dept_emp.emp_no=e.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no
;

--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, 
--last name, and first name.
SELECT  departments.dept_name, dept_emp.emp_no, e.last_name, e.first_name
FROM employees as e
INNER JOIN dept_emp ON
dept_emp.emp_no=e.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
WHERE dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT  departments.dept_name, dept_emp.emp_no, e.last_name, e.first_name
FROM employees as e
INNER JOIN dept_emp ON
dept_emp.emp_no=e.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
WHERE dept_name = 'Sales' 
OR dept_name = 'Development'
ORDER BY last_name;

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name, COUNT(*) as frequency 
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC; 