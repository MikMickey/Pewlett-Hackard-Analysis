# Pewlett-Hackard-Analysis
Module 7 SQL database


## Project Overview & Challenge
In this module we are tasked by Bobby, HR analyst at Pewlett-Hackard, to determine who will be retiring and how many positions need to be filled. Data provided consists of 6 csv files to load into to database table created in PostgresSQL. 

In order for us to be successful with the data creation, we used the Entity Relation Database (ERD) to see the relationships to each CSV files provided in order to get the data we needed to demonstrate various SQL query techniques.


## Resources
    * Data Source: departmens.csv, dept_emp.csv, dept_manager.csv, retirement.csv, employees.csv and salaries.csv
    * Software: PostgresSQL pgAdmin4 Version 4.30

## Summary 
ERD prepared helped in creating merged data into a new tables to get the information needed to query employees retiring and positions need to be filled.

![EmployeeDB](https://user-images.githubusercontent.com/80075982/116642563-0bfd5280-a924-11eb-846b-ba5b98016013.png)
    
    1. retirement_titles.csv
    2. unique_titles.csv
    3. retiring_titles.csv
    4. mentoship_elibility.csv

retirement_titles
    - joined employees & titles table using the inner join method and emp_no as primary key relationship. Filtered birth_dates beween 1952 and 1955

![retirement_titles_query](https://user-images.githubusercontent.com/80075982/116642344-7661c300-a923-11eb-82c3-de585d5a50ed.png)

unique_titles
    - from the retirement_titles table, removed the duplicate entries for some employees who have switched titles over the years by using the DISTINCT ON statement.    

![unique_titles_query](https://user-images.githubusercontent.com/80075982/116642350-7e216780-a923-11eb-953a-d6105e338da1.png)      

retiring_titles
    - from the unique_titles table, to retrieve the number of employees by their most recent job tite who are about to retire.

![retiring_titles_query](https://user-images.githubusercontent.com/80075982/116642356-81b4ee80-a923-11eb-9d9b-59be2f213e79.png)

mentorship_eligibility
    - joined 3 tables: employees table,  dept_employee table and title table using the left join method and emp_no as primary key relationship. Filtered to to_date from dept_emp table and the birth date between 01-01-1965 and 12-31-1965 from employees table as retiring age.

![mentorship_eligibility_query](https://user-images.githubusercontent.com/80075982/116642358-82e61b80-a923-11eb-83eb-6dc2b79b921e.png)

### Results
Total current employees to date total is 240,124 employees. Out of the total employees, 90,398 who are about to retire and 1,940 employees are available for mentorship. Pewlett Hackard need to hire and train candidates fast to fill in the positions.

![Current_Employees_count](https://user-images.githubusercontent.com/80075982/116642861-9b0a6a80-a924-11eb-829b-0329e574db89.png)

How many roles will need to be filled as the "silver tsunami" begins to make an impact?
   
    From the unique_titles table, total count of employees by their most recent job title who are about to retire is 90,398

![unique_titles_count_by_title](https://user-images.githubusercontent.com/80075982/116642365-87123900-a923-11eb-906f-aa77f56bc388.png)
![Retiree_Count](https://user-images.githubusercontent.com/80075982/116642866-9d6cc480-a924-11eb-904c-08db93277efd.png)

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
    
    From the mentorship program table, total number of employees that are available for the mentorship role is 1,940 employees
![Mentorship_eligibility_count](https://user-images.githubusercontent.com/80075982/116643116-38659e80-a925-11eb-9d56-ff91b8adba01.png)


   










