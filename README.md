# Pewlett-Hackard-Analysis
Module 7 SQL database


## Project Overview & Challenge
In this module we are tasked by Bobby, HR analyst at Pewlett-Hackard, to determine who will be retiring and how many positions need to be filled. Data provided consists of 6 csv files to load into to database table created in PostgresSQL. 

In order for us to be successful with the data creation, we used the Entity Relation Database (ERD) to see the relationships to each CSV files provided in order to get the data we needed to demonstrate various SQL query techniques.



## Resources
    * Data Source: departmens.csv, dept_emp.csv, dept_manager.csv, retirement.csv, employees.csv and salaries.csv
    * Software: PostgresSQL pgAdmin4 Version 4.30

## Summary 
ERD prepared helped in creating merged data into a new tables to get the information needed to query employees  retiring and positions need to be filled.
    
    1. retirement_titles.csv
    2. unique_titles.csv
    3. retiring_titles.csv
    4. mentoship_elibility.csv

retirement_titles
    - joined employees & titles table using the inner join method and emp_no as primary key relationship. Filtered birth_dates beween 1952 and 1955

unique_titles
    - from the retirement_titles table, removed the duplicate entries for some employees who have switched titles over the years by using the DISTINCT ON statement.             

retiring_titles
    - from the unique_titles table, to retrieve the number of employees by their most recent job tite who are about to retire 

mentorship_eligibility
    - joined 3 tables: employees table,  dept_employee table and title table using the left join method and emp_no as primary key relationship. Filtered birth date between 01-01-1965 and 12-31-1965 as retiring age.


### Results

How many roles will need to be filled as the "silver tsunami" begins to make an impact?
    From the unique_titles table, total count of employees by their most recent job title who are about to retire is 90,398


Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

   From the mentorship program table, total number of employees that are available for the mentorship role is 
   
