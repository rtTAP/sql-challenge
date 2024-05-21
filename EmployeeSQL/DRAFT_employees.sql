--drop table
DROP TABLE employees;


--Create a table for employee data
CREATE TABLE employees (
	emp_no INT,
	emp_title_id TEXT,
	birth_date TEXT,
	first_name VARCHAR,
	last_name VARCHAR,
	sex CHAR(1),
	hire_date TEXT
);
SET DATESTYLE = 'SQL, MDY';
ALTER TABLE employees
ALTER COLUMN birth_date SET DATA TYPE DATE
USING birth_date::DATE;
ALTER TABLE employees
ALTER COLUMN hire_date SET DATA TYPE DATE
USING hire_date::DATE;




--view the table
SELECT * 
FROM employees;



