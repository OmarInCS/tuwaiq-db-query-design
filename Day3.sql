************ Day 3 ************** 
Name: Omar Karem
------------------------------------------


Boys: 10 + 3 + 13 + 13 = 39
Girls: 10 + 15 + 5 + 5 = 35


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


---------------------- Examples ------------------------



select last_name, salary, commission_pct
	, isnull(commission_pct, 0)
	, salary + salary * isnull(commission_pct, 0) as total_salary
from employees


select last_name, salary, commission_pct
	, coalesce(commission_pct, 0)
	, salary + salary * coalesce(commission_pct, 0) as total_salary
from employees

select last_name, isnull(cast(manager_id as varchar), 'No Mgr')
from employees

select last_name, isnull(convert(varchar, manager_id), 'No Mgr')
from employees


select last_name, department_id, salary
	, iif(
		department_id = 90, salary - 500
		, salary
	) as new_salary
from employees

select last_name, department_id, salary
	, iif (
		department_id = 90, salary - 500
		, iif (
			department_id = 60, salary + 1000
			, iif (
				department_id = 100, salary + 500
				, salary
			)
		)
	) as new_salary
from employees


select last_name, department_id, salary
	, case
		when department_id = 90 then salary - 500
		when department_id = 60 then salary + 1000
		when department_id = 100 then salary + 500
		else salary
	  end as new_salary
from employees


select last_name, department_id, salary
	, case department_id
		when 90 then salary - 500
		when 60 then salary + 1000
		when 100 then salary + 500
		else salary
	  end as new_salary
from employees


select last_name, salary
	, case
		when salary > 12000 then 'High Salary'
		when salary > 6000 then 'Normal Salary'
		else 'Low Salary'
	  end as salary_level
from employees


select last_name, job_id
	, case job_id
		when 'AD_PRES' then 'A'
		when 'ST_MAN' then 'B'
		when 'IT_PROG' then 'C'
		when 'SA_REP' then 'D'
		when 'ST_CLERK' then 'E'
		else '0'
	  end as grade
from employees


--------------------------

select min(salary), max(salary)
from employees

select min(hire_date), max(hire_date)
from employees


select sum(salary), round(avg(salary), 0)
from employees

select sum(salary), round(avg(salary), 0)
from employees
where department_id = 60


select count(last_name)
from employees

select count(commission_pct)
from employees


select count(*)
from employees


select count(distinct job_id)
from employees


--select last_name, min(salary)
--from employees

select department_id, min(salary)
from employees
group by department_id


select job_id, count(last_name)
from employees
group by job_id

select year(hire_date) as hire_year, count(last_name) as num_hired
from employees
group by year(hire_date)


select department_id, job_id, count(last_name)
from employees
group by department_id, job_id


select year(hire_date) as hire_year, count(last_name) as num_hired
from employees
where year(hire_date) > 2003
group by year(hire_date)
having count(last_name) < 20


--select max(count(last_name))
--from employees
--group by year(hire_date)

select manager_id, min(salary) as min_salary
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min_salary desc


select last_name, manager_id, salary
from employees
where manager_id = 100
order by salary




-------------------- Questions ------------------------

* Create a query that displays employees’ last names and commission amounts. 
If an employee does not earn commission, show “No Commission.” 
Label the column COMM.


* Using the CASE or iif function, write a query that displays the grade of all
employees based on the value of the JOB_ID column, using the following data:
Job 				Grade
AD_PRES 			A
ST_MAN 				B
IT_PROG 			C
SA_REP 				D
ST_CLERK 			E
None of the above 	0


* Find the highest, lowest, sum, and average salary for each job type. 
Label the columns Maximum, Minimum, Sum, and Average, respectively. 
Round your results to the nearest whole number.

* Determine the number of managers without listing them. 
Label the column Number of Managers.

* Create a report to display the manager number and the salary of 
the lowest-paid employee for that manager. 
Exclude anyone whose manager is not known. 
Exclude any groups where the minimum salary is $6,000 or less. 
Sort the output in descending order of salary.
