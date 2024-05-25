--First table for departments
CREATE TABLE departments (
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

--Verify departments table
SELECT *
FROM departments


--Second table is for the employee job titles
CREATE TABLE titles (
	title_id TEXT NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);

--Verify titles table
SELECT *
FROM titles

--Alter the data type in table titles from TEXT to VARCHAR
ALTER TABLE titles 
ALTER COLUMN title_id 
TYPE VARCHAR(20);

--verify the table alteration
SELECT *
FROM titles


--Third table is for employee data
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(20) NOT NULL,
	birth_date TEXT NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date TEXT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

--Verify employees table
SELECT *
FROM employees

--Change date fields from text to date format
SET DATESTYLE = 'SQL, MDY';
ALTER TABLE employees
ALTER COLUMN birth_date SET DATA TYPE DATE
USING birth_date::DATE;
ALTER TABLE employees
ALTER COLUMN hire_date SET DATA TYPE DATE
USING hire_date::DATE;

--Verify changed fields in employees table
SELECT *
FROM employees


--Fourth table is for employee salaries
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salaries INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

--Verify salaries table
SELECT *
FROM salaries


--Fifth table is for department managers
CREATE TABLE dept_manager (
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

--Verify dept_manager table
SELECT *
FROM dept_manager


--Sixth table is for all employee departments
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

--Verify dept_emp table
SELECT *
FROM dept_emp


