--DATA ENGINEERING

--Create titles table
CREATE TABLE titles(
title_id VARCHAR(20) PRIMARY KEY NOT NULL,
title VARCHAR(20));

--Create employees table
CREATE TABLE employees(
emp_no INT PRIMARY KEY NOT NULL,
emp_title_id VARCHAR NOT NULL,
birth_date VARCHAR(10) NOT NULL,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
sex VARCHAR(4) NOT NULL,
hire_date VARCHAR(10) NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

--Create salaries table
CREATE TABLE salaries(
emp_no INT,
salary INT(15) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Create departments table
CREATE TABLE departments(
dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
dept_name VARCHAR(15) NOT NULL);

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
