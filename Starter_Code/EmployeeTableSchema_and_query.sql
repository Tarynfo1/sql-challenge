-- Drop table if exists
DROP TABLE IF EXISTS departments;

-- Create table
CREATE TABLE departments (  
	dept_no VARCHAR PRIMARY KEY,
  	dept_name VARCHAR
);

-- Import data from departments.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM departments;

-- Drop table if exists
DROP TABLE IF EXISTS dept_emp;

-- Create table 
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL
PRIMARY KEY (emp_no, dept_no)
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Import data from dept_emp.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM dept_emp;

-- Drop table if exists
DROP TABLE IF EXISTS dept_manager;

-- Create table
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Import data from dept_manager.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM dept_manager;

-- Drop table if exists
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR NOT NULL,
  birth_date VARCHAR NOT NULL,
  first_name VARCHAR  NOT NULL, 
  last_name VARCHAR NOT NULL,
  sex VARCHAR NOT NULL,
  hire_date VARCHAR NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
 );
 
 -- Import data from employees.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM employees;

-- Drop table if exists
DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries (
  emp_no INT PRIMARY KEY,
  salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
 );
 
-- Import data from salaries.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM salaries;

-- Drop table if exists
DROP TABLE IF EXISTS titles;

-- Create table
CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
 );
 
-- Import data from titles.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM titles;

-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- 2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

-- 5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT * FROM departments;

-- The department number for Sales is d007
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT * FROM departments;

-- The  Sales and Development department numbers  are d007 for Sales and d005 for Development

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd005' or departments.dept_no = 'd007';

-- 8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, 
COUNT(last_name) 
AS "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;