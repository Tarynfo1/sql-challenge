TABLE departments {
  dept_no VARCHAR [primary key]
  dept_name VARCHAR
}

TABLE dept_employee {
  emp_no INT [primary key]
  dept_no VARCHAR [primary key]
}

TABLE dept_manager {
  dept_no VARCHAR [primary key]
  dept_name VARCHAR
}

 TABLE titles {
  title_id VARCHAR [primary key]
  title VARCHAR
 }

 TABLE employees {
  emp_no INT [primary key]
  emp_title_id VARCHAR
  birth_date VARCHAR
  first_name VARCHAR
  last_name VARCHAR
  sex VARCHAR
  hire_date VARCHAR
 }

 TABLE salaries {
  emp_no INT [primary key]
  salary VARCHAR 
 }

Ref: departments.dept_no > dept_manager.dept_no

Ref: departments.dept_no > dept_employee.dept_no

Ref: dept_employee.emp_no > employees.emp_no

Ref: employees.emp_no > salaries.emp_no

Ref: employees.emp_title_id > titles.title_id

Ref: dept_manager.dept_no > employees.emp_no