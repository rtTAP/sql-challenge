--Alter the data type in table titles from TEXT to VARCHAR
ALTER TABLE titles 
ALTER COLUMN title_id 
TYPE VARCHAR(20);

--verify the table alteration
SELECT *
FROM titles

--Q1 List the employee number, last name, first name, sex, and 
---salary of each employee.
SELECT employees.emp_no,
    employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salaries
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--Q2 List the first name, last name, and hire date for the 
---employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--Q3 List the manager of each department along with 
---their department number, department name, employee number, last name, and first name.
SELECT departments.dept_no,
    departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name	
FROM departments
INNER JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

--Q4 List the department number for each employee along with that employee’s 
---department number, employee number, last name, first name, and department name.
SELECT departments.dept_no,
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM departments
INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no;


--Q5 List the first name, last name, and sex of each employee whose 
---first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%';

--Q6 List each employee in the 
---Sales department, including their employee number, last name, and first name.
SELECT departments.dept_name,
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales';

--Q7 List each employee in the Sales and Development departments, 
---including their employee number, last name, first name, and department name.	
SELECT dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM departments
INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name IN ('Sales', 'Development');

--Q8 List the frequency counts, in descending order, 
---of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;




