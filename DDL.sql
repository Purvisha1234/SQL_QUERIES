--DATABASE ALL COMMANDS
create database DDL--CREATE DATABASE
USE DDL
DROP DATABASE DDL--DELETE DATABASE
ALTER DATABASE DDL MODIFY NAME="DDL1"--MODIFY DATABASE NAME
USE DDL1
-- to list all DBs
execute sp_databases

/*DATA DEFINITION LANGUAGE 
COMMAND INCLUDE :CREATE, ALTER, DROP, TRUNCATE, COMMENT, RENAME
1.CREATE statements define tables, schemas, views, indexes,database etc.

2.ALTER statements modify existing database structures (adding/removing columns, changing data types).

3.DROP statements remove tables, databases, or other objects permanently.

4.TRUNCATE statements delete all rows in a table but keep the structure intact.

5.DELETE  in SQL is used to remove specific rows from a table while keeping the table structure intact

--DIFFERENCE BETWEEN DELETE , TRUNCATE AND DROP
DELETE	Removes specific rows based on a condition (WHERE clause). If no condition, deletes all rows.
TRUNCATE	Removes all rows from a table, but keeps the table structure.
DROP	Deletes the entire table (structure + data).
*/
--SYNTAX FOR EVERY COMMAND
--HOW TO CREATE TABLE
/*Create database <DN>
Create table <Tb>
(<column name> <datatype and size>)*/
CREATE TABLE EMPLOYEEDETAILS
(EID INT,
ENAME VARCHAR(20),
EAGE INT,
DEPARTMENT VARCHAR(20),
SALARY MONEY,--decimal(10,2)
CITY VARCHAR(20),
DID INT,
GENDER VARCHAR(20))

--DIFFERENT INSERT METHOD
--insert method 1
Insert into EMPLOYEEDETAILS(EID,ENAME,EAGE,DEPARTMENT,SALARY,CITY) values(11,'Priya',39,'DA',87000,'New York')

--insert method 2
Insert into EMPLOYEEDETAILS(EID,ENAME,EAGE,DEPARTMENT,CITY) values(2,'Ramesh',20,'FS','Vadodara')

--insert method 3
Insert into EMPLOYEEDETAILS
values (2,'jayesh',21,'QA',30000,'Vadodara',101,'MALE'),
(3,'Jemil',NULL,'DE',40000,'Surat',102,'MALE'),
(4,'Parth',25,'DA',50000,'Bharuch',103,'MALE'),
(5,'Janvi',27,'DS',60000,'Navsari',104,'FEMALE'),
(6,'Urvi',26,'Cloud',70000,'Bhavnagar',105,'FEMALE'),
(7,'Purvi',22,'WD',80000,'Ahemdabad',106,'FEMALE')

--HOW TO SHOW TABLE'S RECORD
select * from EMPLOYEEDETAILS


--Drop method
DROP TABLE EMPLOYEEDETAILS --TABLE ARE DELETE WITH SCHEMA

--Truncate method
TRUNCATE TABLE EMPLOYEEDETAILS --DELETE THE RECORD BUT SCHEMA REMAINS AS IT AS

exec sp_help EMPLOYEEDETAILS --Retrive table structure





