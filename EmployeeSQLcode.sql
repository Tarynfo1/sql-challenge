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