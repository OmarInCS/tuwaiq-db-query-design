************ Day 7 ************** 
Name: Omar Karem
------------------------------------------


Boys: 55 + 7
Girls: 55 + 13


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


* Creating Sequences, Synonyms, Views and Indexes

	- Sequences:
		CREATE SEQUENCE seq_name
		[AS datatype]
		[START WITH start]
		[INCREMENT BY increment]
		[MINVALUE minvalue | NO MINVALUE]
		[MAXVALUE maxvalue | NO MAXVALUE]
		[CYCLE | NO CYCLE]
		[CACHE cache | NO CACHE]

		NEXT VALUE FOR seq_name

	- Synonyms:
		CREATE SYNONYM syn_name FOR object_name
		DROP SYNONYM syn_name

	- Views:
		CREATE VIEW view_name [(col1, col2,...)]
		AS
		SELECT statement

		ALTER VIEW view_name
		AS
		SELECT statement

		DROP VIEW [IF EXISTS] view_name

	- Indexes:
		CREATE [UNIQUE] [CLUSTERED] INDEX index_name
		ON table_name (col1 [ASC|DESC], col2 [ASC|DESC],...)


* Introduction to Catalog Views

	- sys.tables
	- sys.views
	- sys.synonyms

---------------------- Examples ------------------------


create sequence my_depts_seq
start with 10
increment by 10

create table my_depts
(
	dept_id int primary key,
	dept_name varchar(50)
)

insert into my_depts
values (
	(next value for my_depts_seq)
	, 'Marketing'
)

select next value for my_depts_seq

select *
from my_depts


drop table my_depts


create table my_depts
(
	dept_id int primary key default (next value for my_depts_seq),
	dept_name varchar(50)
)

insert into my_depts  (dept_name)
values ('Marketing')
	, ('Sales')
	, ('IT')

select *
from my_depts


---------------

select *
from employees

create synonym emps for employees

select *
from emps


--------


create view it_emps as
select 
	last_name, email, 
	hire_date, job_id, salary
from employees
where job_id = 'IT_PROG'


select last_name, hire_date
from it_emps
where salary > 6000

update it_emps
set salary = 10000
where last_name = 'Hunold'


select *
from it_emps

select *
from employees

alter view it_emps as
select 
	last_name, email, 
	hire_date, job_id, salary
	, salary * 12 as annual_salary
from employees
where job_id = 'IT_PROG'


select *
from it_emps

update it_emps
set annual_salary = 100000
where last_name = 'Hunold'


drop view it_emps


select *
from employees
where salary > 10000


create index memps_salary_idx
on employees (salary)

create unique index emps_email_idx
on employees (email)


select *
from employees
where email = 'DAUSTIN'

drop index emps_email_idx
on employees

drop index memps_salary_idx
on employees


select *
from sys.tables

select *
from sys.indexes

select *
from sys.sequences

-------------

select *
into #high_salary_emps
from employees
where salary > 12000


select *
from #high_salary_emps

select dept_id, dept_name, len(dept_name)
from my_depts

alter table my_depts
add dept_name_length as len(dept_name) persisted

select *
from my_depts


------------

create sequence depts_seq
start with 300
increment by 10

set identity_insert departments on

insert into departments 
	(department_id, department_name)
values (next value for depts_seq, 'D1'),
	(next value for depts_seq, 'D2'),
	(next value for depts_seq, 'D3')


select *
from departments

set identity_insert departments off









-------------------- Questions ------------------------

* create synonym "depts" for the departments table

* create a view for employees with job IT_PROG
and insert an employee using this view

* create sequence for the departments table starts 
with 300 and increment 10
add 3 departments to test the sequence



