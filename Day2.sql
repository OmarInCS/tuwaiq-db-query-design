************ Day 2 ************** 
Name: Omar Karem
------------------------------------------


Boys: 10 + 3
Girls: 10 + 15


SELECT [TOP number] *|[column1, column2,...]
FROM table_name
WHERE condition [AND|OR condition2 ...]
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



---------------------- Examples ------------------------


select *
from employees
where hire_date like '2007%'
and salary > 5000


select *
from employees
where hire_date like '2007%'
or salary > 5000



select *
from employees
order by first_name

select *
from employees
order by salary desc


select *
from employees
order by salary desc, first_name


select last_name, salary * 12 as annual_salary
from employees
order by annual_salary desc



select last_name, salary * 12 as annual_salary
from employees
-- where annual_salary > 150000  -- Error
where salary * 12 > 150000
order by annual_salary desc


select last_name, salary * 12 as annual_salary
from employees
-- where annual_salary > 150000  -- Error
where salary * 12 > 150000
order by 2 desc


select top 10 *
from employees


select *
from employees
order by employee_id
offset 10 rows
fetch next 5 rows only


select first_name, hire_date
from employees
where hire_date >= '2006-06-01' and hire_date <= '2007-07-30'


select top 3 last_name, salary, department_id
from employees
where (department_id = 60 or department_id = 90)
and salary > 5000


select top 3 last_name, salary, department_id
from employees
where department_id in (60, 90)
and salary > 5000

-------------------

select upper(last_name), lower(job_id)
from employees

select trim('   Omar     and  ')

select replace('   Omar     and  ', '  ', '')

-- select REGEXP_REPLACE('   Omar     and  ', '\s+', ' ')

select last_name, replace(job_id, 'MGR', 'MAN') as job_id
from employees


select last_name, job_id, len(job_id)
from employees

select last_name, job_id, CHARINDEX('_', job_id)
from employees


select last_name, job_id, CHARINDEX(' ', last_name)
from employees

select last_name, first_name, SUBSTRING(last_name, 3, 4)
from employees



select last_name, first_name
	, SUBSTRING(last_name, 1, 1) + SUBSTRING(first_name, 1, 1) as initials
from employees


select round(19.4725, 0)


select round(19.4725, 1)

select round(19.4725, -1)


select last_name, salary, salary * 0.0133
from employees


select last_name, salary, salary * 0.0133
	, round(salary * 0.0133, 0) as bouns
from employees


select last_name, salary, salary * 0.0133
	, round(salary * 0.0133, -1) as bouns
from employees


select last_name, salary, salary * 0.0133
	, round(salary * 0.0133, -1, 1) as bouns
from employees


select last_name, salary, salary * 0.0133
	, round(salary * 0.0133, -1) as bouns
from employees



select ceiling(19.4725)

select floor(19.4725)


select city
	, substring(street_address, 1
				, CHARINDEX(' ', street_address)
				) as building_num
from locations
where country_id in ('US', 'CA')


select getdate()

select last_name, hire_date
	, datepart(YEAR, hire_date) as hire_year
	, datepart(MONTH, hire_date) as hire_month
	, datepart(DAY, hire_date) as hire_day
from employees

select last_name, hire_date
	, YEAR(hire_date) as hire_year
	, MONTH(hire_date) as hire_month
	, DAY(hire_date) as hire_day
from employees


select last_name, hire_date
	, datename(YEAR, hire_date) as hire_year
	, datename(MONTH, hire_date) as hire_month
	, datename(DAY, hire_date) as hire_day
	, datename(WEEKDAY, hire_date) as hire_day
from employees

select last_name, hire_date, salary
	, format(hire_date, 'yyyy-MM')
	, format(hire_date, 'dd-MMM-yy')
	, format(hire_date, 'yyyy, dd "of" MMMM')
	, format(salary, '$##,###.00')
	, format(hire_date, 'yyyy, dd MMMM', 'ar-SA')
from employees


select last_name, hire_date
	, datediff(YEAR, hire_date, getdate()) as service_years
	, dateadd(MONTH, 3, hire_date) as start_date
	, dateadd(DAY, 1, EOMONTH(hire_date))
from employees


select last_name, hire_date
	, dateadd(DAY, 1, eomonth(dateadd(MONTH, 6, hire_date))) as salary_review_date
from employees



-------------------- Questions ------------------------



* Write a query to get the first name and hire date from employees table 
where hire date between '2006-06-01' and '2007-07-30' (do not use between)

* From the employees table, list the first 3 employees in departments 60 or 90 
who earn more than 5,000, ordered by salary descending.


* Write a query that displays the last name (with all letters in uppercase) 
and the length of the last name for all employees whose name starts 
with the letters “J,” “A,” or “M.” Give each column an appropriate label. 
Sort the results by the employees’ last names.

* from locations table display city and building num. which is 
the number at the begining of street address for all addresses in US and CA.

* The HR department needs a report to display the employee number, last name, 
salary, and salary increased by 15.5% (expressed as a whole number) for each 
employee. Label the column New Salary.

* The HR department wants to find the duration of employment for each employee. 
For each employee, display the last name and calculate the number of months 
between today and the date on which the employee was hired. 
Label the column as MONTHS_WORKED. Order your results by the number of months 
employed.

* Create a query to display the last name and the number of weeks employed 
for all employees in department 90. Label the number of weeks column as TENURE. 
Truncate the number of weeks value to 0 decimal places. Show the records in 
descending order of the employee’s tenure.

* Display each employee’s last name, hire date, and salary review date, 
which is the start of the month after six months of service.

* Display each employee’s last name, hire date, and salary.
Format the dates to appear in a format that is similar 
to “Monday, the 31 of July, 2000.”
