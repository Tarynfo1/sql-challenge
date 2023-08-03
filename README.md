# sql-challenge

## Background
# It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and # 1990s. All that remains of the employee database from that period are six CSV files.

# For this project, you’ll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. That is, you’ll perform data modelling, data engineering, and data analysis, respectively.


# README Module 9 Assignment
## Acknowledgements

The code implementation for the import of the departments csv file correctlt provided by TA Chris Thom. The provided code snippet helped in understanding where the code was failing to read the csv file.

### Code Snippet

``
' ...
'CREATE TABLE departments(
'	dept_no VARCHAR PRIMARY KEY,
'	dept_name VARCHAR
');

' ...


The insights and code helped enhance the functionality and efficiency of the assignment. 

The code implementation for adding the foreign key syntax was assisted by https://www.pgadmin.org/docs/pgadmin4/development/foreign_key_dialog.html#:~:text=A%20Foreign%20Key%20constraint%20requires,compared%20to%20the%20foreign%20table.. The provided code snippet helped in adding a foreign key correctly.

### Code Snippet

``
' ...

'Create a series for each year level  by score

'CREATE TABLE dept_emp(
	'emp_no INT NOT NULL,
	'dept_no VARCHAR NOT NULL,
	'PRIMARY KEY (emp_no, dept_no),
	'FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	'FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
');

' ...

The insights and code helped enhance the functionality and efficiency of the assignment. 

The code implementation for adding the GROUP BY function was assisted by https://stackoverflow.com/questions/63095867/how-to-get-the-frequency-in-postgresql The provided code snippet helped in understanding the syntax for group by function.

### Code Snippet

``
' ...

'Create a series for each year level  by score

'-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
'SELECT last_name, COUNT(last_name) AS "Frequency count"
'FROM employees
'GROUP BY last_name
'ORDER BY "Frequency count" DESC;

' ...

The insights and code helped enhance the functionality and efficiency of the assignment. 

# sql-challenge
