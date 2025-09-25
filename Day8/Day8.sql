************ Day 8 ************** 
Name: Omar Karem
------------------------------------------


Boys: 55 + 25
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

* Relational Database Design Concepts
ERD: Entity Relationship Diagram (Conceptual, Physical)
	- Entities and Attributes
	- Relationships
	- Primary Key and Foreign Key
	- Cardinality and Modality
	- Normalization (1NF, 2NF, 3NF)
		1NF: Entities, Repeating Groups, Multivalued Attributes
		2NF: Remove partial dependency
		3NF: Remove internal dependency

---------------------- Examples ------------------------

A big company has decided to store information about its projects and employees in 
a database. The company has wisely chosen to hire you as a database designer. 
Prepare an E-R diagram for this Company according to The following Description: 
	• The company has a number of **employees** each employee has SSN, Birth Date, 
	Gender and Name which represented as Fname and Lname. 
	• The company has a set of **departments** each department has a set of attributes 
	DName, DNUM (unique) and locations. 
	• Employees work in several **projects** each project has Pname, PNumber as an 
	identifier, Location and City. 
	• Each employee may have a set of dependent; each dependent has Dependent 
	Name (unique), Gender, and Birth Date. 
	Note: if the employee left the company no needs to store his dependents info 
	• For each Department, there is always one employee assigned to manage that 
	Department and each manager has a hiring Date  
	• Department may have employees but employee must work on Only One 
	department 
	• Each department may have a set of projects and each project must assigned to one 
	department 
	• Employees work in several projects and each project has several employees and 
	each employee has a number of working hours in each project 
	• Each employee has a supervisor  






-------------------- Questions ------------------------

Real Estate Firm
Prepare an E-R diagram for a real estate firm that lists properties for sale. The 
following describes this organization:
	• The firm has a number of sales offices in several states. Attributes of sales office 
	include Office_Number and Location. 
	• Each sales office is assigned zero or more employees. Attributes of employee 
	include Employee_ID  and Employee_Name. An employee must be assigned to 
	only one sales office. 
	• For each sales office, there is always one employee assigned to manage that office 
	and manager can’t manage many sales office at the same time.  
	• The firm lists property for sale. Attributes of property include Property_ID and 
	Location. Components of Location include Address, City, State, and Zip_Code. 
	• Each property must be listed with one (and only one) of the sales offices. A sales 
	office may have any number of properties listed, or may have no properties listed. 
	• Each property may have zero or more owners. Attributes of owners are 
	Owner_ID and Owner_Name. An owner own one or more properties. The system 
	stores the percent owned by each owner in each property. 


Hospital Equipment Maintenance System
	* A hospital needs a system to manage its medical equipment and ensure proper maintenance.
	* The hospital has multiple departments (e.g., Radiology, Cardiology, Surgery, Pediatrics).
	* Each department owns several equipment items (e.g., MRI machine, ventilator, ECG monitor). Every equipment has a unique code, purchase date, warranty period, and status (active, under repair, retired).
	* Equipment is supplied by vendors. Vendors have details like name, address, contact person, phone, and email.
	* Each equipment may have multiple maintenance contracts (annual service agreements, extended warranty, etc.) with vendors. A contract includes start date, end date, cost, and type.
	* Hospital has technicians who perform maintenance tasks. Each technician has name, specialization, contact info, and may belong to a department.
	* When equipment requires service, a maintenance request is created. It includes the request date, description of the problem, status (open, in progress, closed), and priority.
	* A maintenance request is assigned to a technician, and may result in one or more service logs (date of work, work done, parts replaced, cost).
	* Sometimes equipment maintenance requires ordering spare parts from vendors. Spare parts have codes, names, prices, and stock quantities.
	* The hospital wants to track which spare parts were used in each service log.

