************ Day 4 ************** 
Name: Omar Karem
------------------------------------------


Boys: 47
Girls: 45


SELECT [TOP number] *|[column1, column2,...]
FROM table_name
WHERE condition [AND|OR condition2 ...]		--- Filter rows
GROUP BY column|expr, ...
HAVING condition [AND|OR condition2 ...]	--- Filter groups
ORDER BY column|number|alias|expr [ASC|DESC], ...
OFFSET number ROWS
FETCH NEXT number ROWS ONLY


* Retriving, Restricting and Sorting data

Math Operators: +, -, *, /, %
Concat Operator: +
Comparisone Operators:
    =, <>, !=, >, <, >=, <=
    BETWEEN ... AND ...
    IN (value1, value2,...)
    LIKE 'pattern'
    IS NULL | IS NOT NULL
Logical Operators:
    AND, OR, NOT

    condition1 AND condition2
    condition1 OR condition2


* Using Single-Row Functions to Customize Output
    Charcters:
        upper(), lower(), trim(), replace()
        len(), charindex(), substring()
    Numbers:
        round(), ceiling(), floor(), abs()
        sqrt(), power()

    Dates:
        getdate(), datepart(), datename(),
        day(), month(), year(), format(),
        datediff(), dateadd(), eomonth()
        
    General:
		isnull(), coalesce(),
		iif(), case

	Conversion:
		cast(), convert()


* Reporting Aggregated Data Using the Group Functions

	COUNT(), SUM(), AVG(), MIN(), MAX()


* Displaying Data from Multiple Tables Using Joins

	FROM table1 [INNER] JOIN table2 ON condition1 JOIN table3 ON condition2 ...
	FROM table1 LEFT|RIGHT|FULL [OUTER] JOIN table2 ON condition1 JOIN table3 ON condition2 ...

* Using Subqueries to Solve Queries

	- Single-row subquery
	- Multi-row subquery



---------------------- Examples ------------------------



select job_id, round(avg(salary), 0) as avg_salary
from employees
where job_id like '%MAN' and round(avg(salary), 0) < 12000
group by job_id
having round(avg(salary), 0) < 12000

-----------------

select last_name, department_name
from employees as e
join departments as d
on e.department_id = d.department_id


select last_name, salary, e.job_id, min_salary
from employees as e
join jobs as j
on e.job_id = j.job_id


select department_name, last_name
from departments as d
join employees as e
on d.manager_id = e.employee_id


select department_name, last_name, job_title
from departments as d
join employees as e
on d.manager_id = e.employee_id
join jobs as j
on e.job_id = j.job_id


select department_name, last_name, job_title
from departments as d
	join employees as e
	on d.manager_id = e.employee_id
	join jobs as j
	on e.job_id = j.job_id
where d.department_id in (30, 60, 90)


select last_name, job_id, e.department_id, department_name
from employees as e
join departments as d
on e.department_id = d.department_id
join locations as l
on d.location_id = l.location_id
where city = 'Toronto'


select e.last_name, m.last_name
from employees as e
join employees as m
on e.manager_id = m.employee_id
where m.last_name = 'Greenberg'
order by e.employee_id



select e.last_name as employee
	, m.last_name as manager
	, mm.last_name as director
	, mm.salary as director_salary
from employees as e
join employees as m
on e.manager_id = m.employee_id
join employees as mm
on m.manager_id = mm.employee_id
order by e.employee_id


select last_name, department_name
from employees as e left join departments as d
on e.department_id = d.department_id

select last_name, department_name
from employees as e right join departments as d
on e.department_id = d.department_id


select last_name, department_name
from employees as e full join departments as d
on e.department_id = d.department_id


select last_name, department_name
from employees as e, departments as d
where e.department_id = d.department_id


---------------------

select *
from employees
where salary > (
	select salary
	from employees
	where last_name = 'Fox'
)


select *
from employees
where job_id = (
	select job_id
	from employees
	where employee_id = 180
)


select *
from employees
where job_id = (
	select job_id
	from employees
	where employee_id = 180
)
and salary > (
	select salary
	from employees
	where employee_id = 180
)


-- Sales Representative
select *
from employees
where job_id = (
	select job_id
	from jobs
	where job_title = 'Sales Representative'
)


select *
from employees
where salary < (
	select avg(salary)
	from employees
)


select *
from employees
where salary = (
	select min(salary)
	from employees
)


select last_name, salary
	, salary - (select floor(avg(salary)) from employees) as salary_diff
from employees


select *
from employees
where salary >all (
	select salary
	from employees
	where last_name = 'Grant'
)


select *
from employees
where salary >any (
	select salary
	from employees
	where last_name = 'Grant'
)


select *
from employees
where job_id =any (
	select job_id
	from jobs
	where min_salary = 4000
)

select *
from employees
where job_id in (
	select job_id
	from jobs
	where min_salary = 4000
)




-------------------- Questions ------------------------

* Write a query for the HR department to produce the addresses of all the 
departments. Use the LOCATIONS tables. Show the location ID, street address, 
city, state or province, and country in the output.

* The HR department needs a report of employees in Toronto. Display the last name, 
job, department number, and the department name for all employees who work in 
Toronto.

* Create a report to display employees’ last names and employee numbers along 
with their managers’ last names and manager numbers. 
Label the columns Employee, Emp#, Manager, and Mgr#, respectively.



* The HR department wants to determine the names of all employees who were hired 
after Davies. Create a query to display the name and hire date of any employee 
hired after employee Davies.

* Create a report that displays the employee number, last name, and salary of 
all employees who earn more than the average salary. 
Sort the results in ascending order by salary.

* Create a report for HR that displays the department 
number, last name, and job ID for every employee in 
the Executive department.

* The HR department needs a report that displays the 
last name, department number, and job ID of all 
employees whose department location ID is 1700.
