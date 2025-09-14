************ Day 1 ************** 
Name: Omar Karem
Mobile: 0599888921
------------------------------------------

Boys: 10
Girls: 8


SELECT *|[column1, column2,...]
FROM table_name
WHERE condition


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /, %
Concat Operator: +
Comparisone Operators:
    =, <>, !=, >, <, >=, <=
    BETWEEN ... AND ...
    IN (value1, value2,...)
    LIKE 'pattern'
    IS NULL | IS NOT NULL




---------------------- Examples ------------------------


select *
from employees


select last_name, hire_date, 
	salary, job_id, department_id
from employees


select last_name, salary
	, salary * 12 as annual_salary
from employees

select last_name, salary
	, salary * 12 annual_salary
from employees

select last_name, salary
	, salary * 12 as "annual salary"
from employees


select first_name + ' ' + last_name as full_name
from employees

select first_name + ' bin ' + last_name as full_name
from employees

select last_name, salary, commission_pct
	, salary + salary * commission_pct as total_salary
from employees


select distinct job_id
from employees


select *
from employees
where salary < 3000


select *
from employees
where job_id = 'IT_PROG'

select *
from employees
where hire_date >= '2008-01-01'


select *
from employees
where hire_date between '2007-01-01' and '2007-12-31'

select *
from employees
where commission_pct between 0.1 and 0.2

select *
from employees
where department_id in (30, 60, 90)

select *
from employees
where job_id in ('IT_PROG', 'SA_REP')


select *
from employees
where job_id like 'SA%'


select *
from employees
where job_id like '%MAN'

select *
from employees
where phone_number like '%5%'


select *
from employees
where phone_number like '__5%'

select *
from employees
where phone_number like '__[50]%'


select *
from employees
where commission_pct is null

select *
from employees
where commission_pct is not null


select *
from employees
where last_name like '[JAM]%'






-------------------- Questions ------------------------

* The HR department wants a query to display the last name, 
job ID, hire date, and employee ID for each employee, 
with the employee ID appearing first. Provide an alias
STARTDATE for the HIRE_DATE column.

* The HR department wants a query to display all 
unique job IDs from the EMPLOYEES table.

* Because of budget issues, the HR department needs 
a report that displays the last name and salary 
of employees who earn more than $12,000.


* display the last name and salary for any employee 
whose salary is not in the range $5,000 through $12,000.


* Write a query that displays the last name for all employees 
whose name starts with the letters “J,” “A,” or “M.”.