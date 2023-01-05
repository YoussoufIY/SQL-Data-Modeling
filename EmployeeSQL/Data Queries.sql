-- DATA ANALYSIS

--LIST THE EMPLOYEE NUMBER, LAST NAME, FIRST NAME, SEX AND SALARY OF EACH EMPLOYEE

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;

--LIST THE FIRST NAME, LAST NAME, AND HIRE DATE FOR THE EMPLOYEES WHO WERE HIRED IN 1986

--Modifying date string to date format 

ALTER TABLE employees ALTER COLUMN hire_date TYPE DATE using(hire_date::DATE);

--Selecting columns

SELECT first_name, last_name, hire_date FROM employees 
WHERE hire_date >='1986-01-01' AND hire_date <='1986-12-31';

--LIST THE MANAGER OF EACH DEPT ALONG WITH THEIR DEPT #, DEPT NAME, EMPLOYEE #, LAST NAME AND 
--FIRST NAME

SELECT departments.dept_no, departments.dept_name, employees.emp_no,employees.last_name, 
employees.first_name
FROM employees
JOIN dept_emp
ON dept_emp.emp_no=employees.emp_no
JOIN departments
ON departments.dept_no=dept_emp.dept_no
WHERE employees.emp_title_id='s0001';

--LIST THE DEPT # FOR EACH EMPLOYEE ALONG WITH THAT EMPLOYEE'S EMPLOYEE #, LAST NAME, FIRST NAME &
-- DEPT NAME

SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, 
departments.dept_name
FROM employees
JOIN dept_emp
ON dept_emp.emp_no=employees.emp_no
JOIN departments
on departments.dept_no=dept_emp.dept_no;

--LIST FIRST NAME, LAST NAME, AND SEX OF EACH EMPLOYEE WHOSE FIRST NAME IS HERCULES AND WHOLE LAST
--NAME BEGINS WITH THE LETTER B

SELECT first_name,last_name,sex FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--LIST EACH EMPLOYEE IN THE SALES DEPT, INCLUDING THEIR EMPLOYEE #, LAST NAME, AND FIRST NAME

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp
ON dept_emp.emp_no=employees.emp_no
WHERE dept_no='d007';

--LIST EACH EMPLOYEE IN THE SALES & DEVELOPMENT DEPTS, INCLUDING THEIR EMPLOYEE #, LAST NAME, 
--FIRST NAME, AND DEPT NAME

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON dept_emp.emp_no=employees.emp_no
JOIN departments
ON departments.dept_no=dept_emp.dept_no
WHERE dept_emp.dept_no='d007' OR dept_emp.dept_no='d005';

-- LIST THE FREQUENCY COUNTS, IN DESCENDING ORDER, OF ALL THE EMPLOYEE LAST NAMES (THAT IS, HOW MANY
-- EMPLOYEES SHARE EACH LAST NAME)

SELECT last_name, COUNT(last_name) AS "frequency of doppelgangers"
FROM employees
GROUP BY last_name
ORDER BY "frequency of doppelgangers" DESC;