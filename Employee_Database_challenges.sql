-- Creating Tables

-- Create departments table
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

SELECT * FROM departments;

-- Create employees table
CREATE TABLE employees (
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

SELECT * FROM employees;

-- Create dept_no table
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_manager;

-- Create salaries table
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

SELECT * FROM salaries;

-- Create dept table
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)

);
SELECT * FROM dept_emp;

-- Create titles tabble
CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR NOT NULL,o
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

SELECT * FROM titles;

SELECT DISTINCT ON (COUNT(emp_no)) emp_no
FROM employees
GROUP BY emp_no;

-- Deliverabble 1:  The Number of Retiring Employees by Title

--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no,
	   first_name,
	   last_name
FROM employees;

--Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title,
	   from_date,
	   to_date
FROM titles;

--Create a new table using the INTO clause.
--Join both tables on the primary key.
--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
DROP TABLE unique_titles;

SELECT 	employees.emp_no,
		employees.first_name,
		employees.last_name,
		titles.title,
		titles.from_date,
		titles.to_date		
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Export retirement_titles
-- path C:\Users\dixie\Desktop\Dixie\Data_Analyst_Boot_Camp\Review_Practices\BootCamp_Modules\Module_7\Analysis_Projects_Folder\Pewlett-Hackard-Analysis\Data\retirement_titles.csv

-- Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
-- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.

---- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM retirement_titles;

--Retrieve the number of employees by their most recent job title who are about to retire.
-- First, retrieve the number of titles from the Unique Titles table.

SELECT COUNT(emp_no)
FROM unique_titles;
--90398

DROP TABLE mentorship_eligibility;
-- create a Retiring Titles table to hold the required information.
-- Group the table by title, then sort the count column in descending order.

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles

-- Export retiring_titles
-- path C:\Users\dixie\Desktop\Dixie\Data_Analyst_Boot_Camp\Review_Practices\BootCamp_Modules\Module_7\Analysis_Projects_Folder\Pewlett-Hackard-Analysis\Data\retirement_titles.csv



-- Deliverable 2: The Employees Eligible for the Mentorship Program
-- Write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
--Retrieve the from_date and to_date columns from the Department Employee table.
SELECT 	from_date,
		to_date
FROM dept_emp;

-- Retrieve the title column from the Titles table.
SELECT 	title
FROM titles;

--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- Create a new table using the INTO clause. 
-- Join the Employees and the Department Employee tables on the primary key.
SELECT  DISTINCT ON (emp_no) employees.emp_no, 
		employees.first_name, 
		employees.last_name, 
		employees.birth_date, 
		dept_emp.from_date, 
		dept_emp.to_date, 
		titles.title
-- INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN  '1965-01-01' AND '1965-12-31')  
AND (dept_emp.to_date = '9999-01-01')
ORDER BY emp_no;


SELECT * FROM mentorship_eligibility;

SELECT count(emp_no)
FROM mentorship_eligibility;
SELECT * FROM employees;

--Total number of current employees to date
SELECT  DISTINCT ON (emp_no) employees.emp_no, 
		employees.first_name, 
		employees.last_name, 
		employees.birth_date, 
		dept_emp.from_date, 
		dept_emp.to_date, 
		titles.title
INTO current_employees
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (dept_emp.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT COUNT(emp_no)
FROM current_employees;

--Total number of current employees to date
SELECT  DISTINCT ON (emp_no) employees.emp_no, 
		employees.first_name, 
		employees.last_name, 
		employees.birth_date, 
		dept_emp.from_date, 
		dept_emp.to_date, 
		titles.title
