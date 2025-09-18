************ Day 5 ************** 
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
	[NOT] EXISTS (subquery)


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
	- Correlated subquery
	- CTE (Common Table Expression)

* Using the Set Operators

	- UNION, UNION ALL
	- INTERSECT
	- EXCEPT


* Managing Tables Using DML Statements

	- insert
		INSERT INTO table_name [(col1, col2,...)]
		VALUES (val1, val2,...), (val1, val2,...), ...
	
	- update
		UPDATE table_name
		SET col1 = val1, col2 = val2, ...
		WHERE condition
	
	- delete
		DELETE [FROM] table_name
		WHERE condition


---------------------- Examples ------------------------



select *
from employees
where salary > (
	select avg(salary)
	from employees
)


select last_name, salary, job_id
from employees as e
where salary > (
	select avg(salary)
	from employees
	where job_id = e.job_id
)



select *
from employees as e
where salary = (
	select min(salary)
	from employees
	where department_id = e.department_id
)


select *
from employees m
where exists (
	select last_name
	from employees
	where manager_id = m.employee_id
)

select *
from employees m
where not exists (
	select last_name
	from employees
	where manager_id = m.employee_id
)


select last_name, salary, department_name
from employees as e
join departments as d
on e.department_id = d.department_id
where salary = (
	select max(salary)
	from employees
	where department_id = e.department_id
)


select department_name, city, department_id
from departments as d
join locations as l
on d.location_id = l.location_id
where not exists (
	select employee_id
	from employees
	where department_id = d.department_id
	and hire_date > '2006-12-31'
)


select *
from employees as e
where salary >= 0.85 * (
	select salary
	from employees
	where employee_id = e.manager_id
)



with 
jobs_avg_salary as (
	select job_id, avg(salary) as avg_salary
	from employees
	group by job_id
)
select *
from employees e
join jobs_avg_salary j
on e.job_id = j.job_id
where salary > avg_salary


select 
	case job_id
		when 'AD_PRES' then 'A'
		when 'ST_MAN' then 'B'
		when 'IT_PROG' then 'C'
		when 'SA_REP' then 'D'
		else '0'
	end as grade
	, count(*) as num_employees
from employees
group by case job_id
		when 'AD_PRES' then 'A'
		when 'ST_MAN' then 'B'
		when 'IT_PROG' then 'C'
		when 'SA_REP' then 'D'
		else '0'
	end


with 
job_grades as (
	select job_id
		, case job_id
			when 'AD_PRES' then 'A'
			when 'ST_MAN' then 'B'
			when 'IT_PROG' then 'C'
			when 'SA_REP' then 'D'
			else '0'
		end as grade
	from jobs
)
select grade, count(*) as num_emps
from employees as e
join job_grades as j
on e.job_id = j.job_id
group by grade



with 
depts_max as (
	select department_id, max(salary) as max_salary
	from  employees
	group by department_id
)
select *
from employees as e
join depts_max as d
on e.department_id = d.department_id
where salary = max_salary

-------------------

select first_name, last_name
from employees
union
select first_name, last_name
from dependents


select first_name
from employees
union
select first_name
from dependents

select first_name
from employees
union all
select first_name
from dependents



select first_name, last_name, null
from employees
union
select first_name, last_name, relationship
from dependents

select first_name, last_name, 'Employee' as person_type
from employees
union
select first_name, last_name, relationship
from dependents


select first_name, last_name, 'Employee' as person_type
from employees
union
select first_name, last_name, relationship
from dependents
order by person_type


select first_name
from employees
intersect
select first_name
from dependents


select employee_id
from employees
except
select manager_id
from employees


select job_id, department_id
from employees
where department_id = 10
union all
select job_id, department_id
from employees
where department_id = 50
union all
select job_id, department_id
from employees
where department_id = 20

----------------------
select *
from departments

insert into departments (department_name)
values ('Training')


insert into departments (department_name)
values ('X'), ('Y'), ('Z')

select *
from departments


update departments
set manager_id = 105
where department_id = 273

select *
from departments

update departments
set manager_id = (
	select manager_id
	from departments
	where department_name = 'Y'
)
where department_name = 'X'


select *
from departments


begin transaction;

select *
from departments

update departments
set manager_id = 105


select *
from departments

rollback

select *
from departments

begin transaction;

update departments
set manager_id = 106
where department_name = 'Z'

select *
from departments

commit

select *
from departments

-------- 

begin transaction;

update departments
set manager_id = 105
where department_name = 'Z'

save transaction A;

update departments
set manager_id = 104
where department_name = 'Y'

save transaction B;

update departments
set manager_id = 103
where department_name = 'X'

select *
from departments

rollback transaction A

commit

delete from departments
where department_id > 270


select *
from departments

rollback


-------------------- Questions ------------------------

* Show the highest-paid employee(s) in each department (name, salary, department).

* List departments (name, city) that have no employees hired after 2006-12-31,
do not join with employees table.

* Find employees whose salary is at least 85% of their own manager’s salary
do not use join.

* Return the name and department of employees who manage at least 
two direct reports and work in the same city as their department, 
show also the number of employees who report to that employee.

* The HR department needs a list of department IDs 
for departments that do not contain the job ID 
ST_CLERK. Use the set operators to create this report.

* Produce a list of jobs for departments 10, 50, and 
20, in that order. Display job ID and department ID 
using the set operators.

