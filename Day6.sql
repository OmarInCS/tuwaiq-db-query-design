************ Day 6 ************** 
Name: Omar Karem
------------------------------------------


Boys: 55
Girls: 55


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

* Introduction to Data Definition Language (DDL)

	- create
		CREATE TABLE table_name (
			col1 datatype [[CONSTRAINT cons_name] constraint] [IDENTITY[(seed, increment)]],
			col2 datatype [[CONSTRAINT cons_name] constraint],
			...
			[[CONSTRAINT cons_name] constraint]
		)

		Object Naming Rules:
			- begin with a letter as first character
			- contain only letters, numbers, @, _, #
			- not exceed 128 characters
			- not be a reserved keyword

		Datatypes:
			- int, bigint, smallint, tinyint
			- decimal(p,s), numeric(p,s), float, real
			- char(n), varchar(n), varchar(max)
			- date, datetime, datetime2, smalldatetime, time
			- bit
			- binary(n), varbinary(n), varbinary(max)
			- uniqueidentifier

		Constraints:
			- NOT NULL
			- UNIQUE
			- PRIMARY KEY
			- FOREIGN KEY
			- CHECK(condition)
			- DEFAULT default_value

	- alter
		ALTER TABLE table_name
		
		ADD col_name datatype [[CONSTRAINT cons_name] constraint], ...
		ALTER COLUMN col_name datatype [DEFAULT expression] [NOT NULL|NULL]
		DROP COLUMN col_name

		ADD CONSTRAINT cons_name constraint
		DROP CONSTRAINT cons_name
		NOCHECK|CHECK cons_name

	- drop
		DROP TABLE [IF EXISTS] table_name

	- truncate
		TRUNCATE TABLE table_name

---------------------- Examples ------------------------



insert into employees 
		(last_name, job_id, email, salary, department_id)
values	('Osama', 'SA_REP', 'o@gmail.com', 8888, 30)


select *
from employees

update employees
set salary = (
	select max_salary
	from jobs
	where job_id = employees.job_id
)
where employee_id = 207


select *
from employees

-----------------------------

create table my_depts
(
	dept_id int primary key identity(100, 10),
	dept_name varchar(50) unique not null
)

insert into my_depts
values ('Accounting')

select *
from my_depts

insert into my_depts
values ('IT')

select *
from my_depts

insert into my_depts
values ('Administration')


create table my_emps
(
	emp_id int primary key identity(100, 1),
	emp_name varchar(100) not null,
	hire_date date default(getdate()) not null,
	salary decimal(8, 2) constraint my_emps_salary_ck check(salary > 3000),
	dept_id int constraint my_emps_dept_id_fk references my_depts(dept_id)
)


create table courses 
(
	course_id int primary key identity,
	course_title varchar(50) not null,
	price decimal(8, 2) check(price between 800 and 3000),
	start_date date default(getdate() + 7),
	duration int check(duration between 12 and 120)
)

insert into courses (course_title, price)
values ('SQL', 1500)

select *
from courses



insert into my_emps 
		(emp_name, salary, dept_id)
values	('Wael', 8888, 110)



insert into my_emps 
		(emp_name, salary, dept_id)
values	('Abass', 7777, 100)


select *
from my_emps

select *
from my_depts

alter table my_depts
add city varchar(50) default('Riyadh')

alter table my_depts
drop constraint DF__my_depts__c1__73BA3083

alter table my_depts
drop column c1

alter table my_depts
drop constraint DF__my_depts__c2__74AE54BC

alter table my_depts
drop column c2

alter table my_depts
alter column city varchar(100)

alter table my_depts
add constraint my_depts_city_ck 
check(city in ('Riyadh', 'Dammam', 'Jeddah'))


update my_depts
set city = 'Haiel'

alter table My_depts
nocheck constraint my_depts_city_ck

update my_depts
set city = 'Mecca'

alter table My_depts
check constraint my_depts_city_ck

select *
from my_depts


select *
from my_emps

delete from my_depts
where dept_id = 110

alter table my_emps
drop constraint my_emps_dept_id_fk

alter table my_emps
add constraint my_emps_dept_id_fk
foreign key (dept_id)
references my_depts(dept_id)
on delete cascade

delete from my_depts
where dept_id = 110

select *
from my_emps

drop table my_emps
drop table my_depts




-------------------- Questions ------------------------

* create courses table as follow:
cours_id => pk
course_title => not null
price => between 800 and 3000
start_date => default value the date after 7 days
duration => between 12 and 120


* modify course_title to be varchar(70)
* modify price constraint to be 500 and 2000
* add column trainer_name 



