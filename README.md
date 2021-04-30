# Pewlett-Hackard-Analysis
Module 7 SQL database


## Project Overview & Challenge
In this module we are tasked by Bobby, HR analyst at Pewlett-Hackard, to determine  who will be retiring and how many positions need to be filled. Data provided consistThe 

The first step is to reviw the files in CSV format. Get familiar with the data and work on any relationship that can be used to combine, merge or join tables for the analysis. We used the Entity Relation Database (ERD) and this helped in the creation of the tables to demonstrate various SQL query techniques.


## Resources
    * Data Source: departmens.csv, dept_emp.csv, dept_manager.csv, retirement.csv, employees.csv and salaries.csv
    * Software: PostgresSQL pgAdmin4 Version 4.30

## Summary 
ERD prepared helped in creating tables easily since the primary keys and the data types were identified. Joining the tables that was provided, we are able to create 4 tables to get the values or data we are looking for.

![EmployeeDB](https://user-images.githubusercontent.com/80075982/116642563-0bfd5280-a924-11eb-846b-ba5b98016013.png)

### Tables created combining files provided:
    
         1. retirement_titles.csv
         2. unique_titles.csv
         3. retiring_titles.csv
         4. mentoship_elibility.csv

retirement_titles
    - joined employees & titles table using the inner join method and emp_no as primary key relation. Filtered birth_dates beween 1952 and 1955

![retirement_titles_results_preview](https://user-images.githubusercontent.com/80075982/116724217-3a674600-a995-11eb-9aad-fa74d04817cd.png)

unique_titles
    - from the retirement_titles table, removed the duplicate entries for some employees who have switched titles over the years by using the DISTINCT ON statement.    

![unique_titles_results_preview](https://user-images.githubusercontent.com/80075982/116724230-3f2bfa00-a995-11eb-9113-ee75afac557a.png)
 

retiring_titles
    - from the unique_titles table, to retrieve the number of employees by their most recent job tite who are about to retire.


![unique_titles_count_by_title](https://user-images.githubusercontent.com/80075982/116642365-87123900-a923-11eb-906f-aa77f56bc388.png)

mentorship_eligibility
    - joined 3 tables: employees table,  dept_employee table and title table using the left join method and emp_no as primary key relationship. Filtered to to_date from dept_emp table and the birth date between 01-01-1965 and 12-31-1965 from employees table as retiring age.

![mentorship_eligibility_results_preview](https://user-images.githubusercontent.com/80075982/116724253-46eb9e80-a995-11eb-852b-85019ce0d269.png)

After the table creation, we were able to determine who will be retiring and how many positions need to be filled.

### Results
Total current employees to date total is 240,124 employees. Out of the total employees, 90,398 who are about to retire and 1,940 employees are available for mentorship. Pewlett Hackard need to hire and train candidates fast to fill in the positions.

Query below shows which table needed to combine and filter to get the total employee count.
![Current_Employees_count](https://user-images.githubusercontent.com/80075982/116642861-9b0a6a80-a924-11eb-829b-0329e574db89.png)
![Current_Employees_count_total](https://user-images.githubusercontent.com/80075982/116727378-54a32300-a999-11eb-8ce1-1cd1157bd8e7.png)

![Current_Employees_results_preview](https://user-images.githubusercontent.com/80075982/116725526-d9d90880-a996-11eb-9cf6-abebbce5aa58.png)


How many roles will need to be filled as the "silver tsunami" begins to make an impact?
   
    From the unique_titles table, total count of employees by their most recent job title who are about to retire is 90,398.

The query below shows positions need to be filled, positions or title and the count

![unique_titles_count_by_title](https://user-images.githubusercontent.com/80075982/116642365-87123900-a923-11eb-906f-aa77f56bc388.png)
![Retiree_Count](https://user-images.githubusercontent.com/80075982/116727381-566ce680-a999-11eb-8acf-a4472d4186a0.png)


Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
    
There's not enough candidates or eligible employees to mentor the next genration of Pewlett Hackard employees. 
From the mentorship program table, total number of employees that are available for the mentorship role is 1,940 employees. Total of 90,308 positions need to be filled.



   










