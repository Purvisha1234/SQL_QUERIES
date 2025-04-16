CREATE DATABASE FUNCPRAC
USE FUNCPRAC
--Functions(lower,upper,length,month,year,format etc..)
create table emp1(
eid int,
ename varchar(150),
did int)

insert into emp1 values
(1,'purvi',101),
(2,'urvi',102),
(3,'janvi',103),
(4,'khushi',104),
(5,'dev',105)
select *from emp1

select 
upper(ename)
from emp1

select 
lower(ename)
from emp1

select
len(ename)
from emp1

select
left(ename,2)
from emp1

select
left(ename,2)+
right(ename,1)
from emp1

select
left(ename,2)+'.'+
right(ename,1)+'@'+'outlook.com'
from emp1

select 
month(hiredate) as MonthName,
year(hiredate) as yearname
from emp1

select 
format(hiredate,'MM-YYYY') --'mm/yyyy
FROM emp1

select
datename(month,hiredate) + ' ' +
cast (year(hiredate) as varchar(4))
from emp1

select * from employeedetails
select DEPARTMENT,CITY FROM employeedetails