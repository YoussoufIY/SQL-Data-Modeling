--DATA ENGINEERING

--Create titles table
CREATE TABLE titles(
title_id VARCHAR PRIMARY KEY NOT NULL,
title VARCHAR);

--Create employees table
CREATE TABLE employees(
emp_no INT PRIMARY KEY NOT NULL,
emp_title_id VARCHAR NOT NULL,
birth_date VARCHAR NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
sex VARCHAR NOT NULL,
hire_date VARCHAR NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

--Create salaries table
CREATE TABLE salaries(
emp_no INT,
salary INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Create departments table
CREATE TABLE departments(
dept_no VARCHAR PRIMARY KEY NOT NULL,
dept_name VARCHAR NOT NULL);

--Create dept_emp table
CREATE TABLE dept_emp(
emp_no INT,
dept_no VARCHAR,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

--Create dept_manager table
CREATE TABLE dept_manager(
dept_no VARCHAR,
emp_no INT,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
