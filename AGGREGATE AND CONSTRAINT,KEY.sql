CREATE DATABASE AGGREGATEFUN
USE AGGREGATEFUN
/*SUM, AVG, COUNT, MIN, MAX
? GROUP BY clause,HAVING clause are used this function
An aggregate function is a function that performs a calculation on a set of values, and returns a single value.
Aggregate functions are often used with the GROUP BY clause of the SELECT statement.
The GROUP BY clause splits the result-set into groups of values and the aggregate function can be used to return a single value for each group.
*/
CREATE TABLE EMPLOYEEDETAILS
(EID INT,
ENAME VARCHAR(20),
EAGE INT,
DEPARTMENT VARCHAR(20),
SALARY MONEY,--decimal(10,2)
CITY VARCHAR(20),
DID INT,
GENDER VARCHAR(20))
/*INSERT*/

Insert into EMPLOYEEDETAILS
values (2,'jayesh',21,'QA',30000,'Vadodara',101,'MALE'),
(3,'Jemil',NULL,'DE',40000,'Surat',102,'MALE'),
(4,'Parth',25,'DA',50000,'Bharuch',103,'MALE'),
(5,'Janvi',27,'DS',60000,'Navsari',104,'FEMALE'),
(6,'Urvi',26,'Cloud',70000,'Bhavnagar',105,'FEMALE'),
(7,'Purvi',22,'WD',80000,'Ahemdabad',106,'FEMALE')

--1) How many rows are in the Employeedetails table? 
SELECT count(*) from EMPLOYEEDETAILS

--2) How many rows in the Employeedetails table do not have a NULL value in the Age column?
select count(*) from EMPLOYEEDETAILS where EAGE is not null

--3) What is the average Salary for QA Department?
select avg(salary) from EMPLOYEEDETAILS where DEPARTMENT = 'QA'

--5) How expensive is the highest Salary in the Employeedetails table?
select max(salary) from EMPLOYEEDETAILS

--6) What is the total salary expenditure for the entire company
select sum(salary) from EMPLOYEEDETAILS

--7) What is the average age of employees in the "FS" department?
SELECT AVG(EAGE) FROM EMPLOYEEDETAILS WHERE DEPARTMENT = 'FS'

--8)What is the youngest employee's age in the company?
SELECT MIN(EAGE) FROM EMPLOYEEDETAILS

--9) How many different cities are employees located in?
SELECT COUNT(Distinct CITY) FROM EMPLOYEEDETAILS


/*ALL CONSTRAINT AND KEY IN SQL*/
CREATE TABLE EMPLOYEEDETAILS (
    EID INT PRIMARY KEY,  -- Unique Employee ID
    ENAME VARCHAR(20) NOT NULL UNIQUE,  -- Employee Name (Unique and Required)
    EAGE INT CHECK (EAGE >= 18),  -- Employee Age (Must be 18 or older)
    DEPARTMENT VARCHAR(20) NOT NULL,  -- Department Name (Required)
    SALARY MONEY CHECK (SALARY > 0),  -- Salary (Must be greater than 0)
    CITY VARCHAR(20) NOT NULL,  -- City Name (Required)
    DID INT,  -- Department ID (Foreign Key)
    GENDER VARCHAR(20) CHECK (GENDER IN ('Male', 'Female', 'Other')), -- Gender Constraint
    CONSTRAINT FK_DEPARTMENT FOREIGN KEY (DID) REFERENCES DEPARTMENT(DID)  -- Foreign Key Constraint
);

--USE OF LIKE OPERATOR:
SELECT *FROM EMPLOYEEDETAILS WHERE ENAME LIKE 'J%'
SELECT *FROM EMPLOYEEDETAILS WHERE ENAME LIKE '%i'
SELECT *FROM EMPLOYEEDETAILS WHERE ENAME LIKE 'AB%'
SELECT *FROM EMPLOYEEDETAILS WHERE ENAME LIKE '%TA'


SELECT *FROM EMPLOYEEDETAILS

SELECT (4+3)*5
SELECT 'PURVI'AS NAME,'RISE' AS DEPARTMENT