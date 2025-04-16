--DATA MANIPULATION LANGUAGE
--INSERT, UPDATE, DELETE
CREATE DATABASE DML
USE DML

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

select *from 
/*UPDATE ALL METHODS*/
--Update Method 1
Update EMPLOYEEDETAILS Set EAGE = 22 WHERE EID=1

--Update Method 2
Update EMPLOYEEDETAILS Set EAGE = 18 WHERE EAGE IN(1,5,7,9)

--Update Method 3
Update EMPLOYEEDETAILS Set SALARY = 25000 

/*DELETE ALL METHOD*/
--Delete Method 1
DELETE FROM EMPLOYEEDETAILS WHERE EID=5

--Delete Method 2
DELETE FROM  EMPLOYEEDETAILS WHERE EAGE IS NULL

--Delete Method 3
DELETE FROM EMPLOYEEDETAILS --WE CAN PARTICULAR RECORD CAN DELETE 

/*SELECT statement (SELECT,
FROM, WHERE, ORDER BY,
GROUP BY, HAVING, JOINs)*/

--HOW TO WRITE QUERY

/*sequence for query:
select 
from
join
on
where
group by
Having*/

/*WHERE CLAUSES*/

SELECT *FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'QA'

SELECT *FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'DA' OR DEPARTMENT = 'QA'

SELECT EID,ENAME AS FIRSTNAME FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'DA' OR DEPARTMENT = 'QA'

SELECT *FROM EMPLOYEEDETAILS
WHERE (DEPARTMENT = 'DA' AND EAGE= '22') OR CITY = 'SURAT'

SELECT *FROM EMPLOYEEDETAILS
WHERE (DEPARTMENT = 'DA' OR EAGE= '22') AND CITY = 'SURAT'

SELECT *FROM EMPLOYEEDETAILS WHERE SALARY <> 20000 --NOT EQUAL TO 20000

SELECT *FROM EMPLOYEEDETAILS WHERE SALARY BETWEEN 25000 AND 30000

/*ORDER BY CLAUSE*/
SELECT *FROM EMPLOYEEDETAILS
ORDER BY SALARY

SELECT *FROM EMPLOYEEDETAILS
ORDER BY SALARY DESC

SELECT *FROM EMPLOYEEDETAILS
ORDER BY SALARY,ENAME

SELECT *FROM EMPLOYEEDETAILS
ORDER BY SALARY DESC ,EAGE ASC--it's not possible

/*GROUP BY AND HAVING CLAUSE*/

--1)Find the department with an average salary greater than 20,000
SELECT DEPARTMENT,AVG(SALARY)
FROM EMPLOYEEDETAILS 
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 20000

--2)list the cities where the average employee age is greater than 20
select CITY,AVG(EAGE)
FROM EMPLOYEEDETAILS
GROUP BY CITY
HAVING AVG(EAGE) > 20

--3)find the departments with more than 5 employees
select DEPARTMENT, count(*)
from EMPLOYEEDETAILS
GROUP BY DEPARTMENT
HAVING COUNT(*) > 5

--4)List the cities where the total salary of all employees exceeds 300000
select CITY,SUM(SALARY)
FROM EMPLOYEEDETAILS
GROUP BY CITY
HAVING SUM(SALARY) > 30000

--5)find the departments where the average age of employees is between 20 and 25
select department 
from EMPLOYEEDETAILS
group by DEPARTMENT
having avg(eage) between 20 and 25

/*JOINS IN SQL*/
--Joins
create table student(
id int,
Sname varchar(20),
course_id int)

create table course(
course_id int,
course_name varchar(20),
course_fees int)

insert into student values
( 1, 'Bhesh',50),
(2, 'Gay',40),
(3,'Horse',10),
(4,'Bakari',80)

insert into course values
(50, 'Data-science',25000),
(40,'Full-stack',10000),
(10,'Android',20000),
(70,'Devops',50000)

--default constraint
create table test(id int,name varchar(20),city varchar(20))
insert test(id,name) values (1,'DA')
select *from test
alter table test
add constraint df_city default 'surat' for city

--isnull function
select ISNULL(s.sname,'name correction') as studentname from student s
join course c
on s.course_id=c.course_id

--cartesion product /cross join
select *from student,course

select * from student
select * from course

select s.name,c.name from student s
join course c
on s.course_id=c.course_id

--INNER JOIN
select * from student
inner join course
on student.course_id = course.course_id

--LEFT JOIN
select * from student
left join course
on student.course_id = course.course_id

--RIGHT JOIN
select * from student
right join course
on student.course_id = course.course_id

--FULL JOIN
select * from student
full join course
on student.course_id = course.course_id

select * from student
right join course
on student.course_id = course.course_id
where student.course_id is null

select * from student
left join course
on student.course_id = course.course_id
where course.course_id is null

--Equi join (using where keyword) & only equality operator
select * from student ,course
where student.course_id = course.course_id

--non Equi join (except equality operator)
select * from student ,course
where student.course_id > course.course_id

