CREATE DATABASE INDEXPRAC
USE INDEXPRAC

CREATE TABLE employees(
id int,
ename varchar(150),
department varchar(150),
salary money,
did int,
joiningdate date)
--index example
select * from employees

--clustered index
create clustered index idx_employeeid
on id;

--single column index
create index index_salary
on employees(salary);

select * from employees where salary>10000;

--create unique index
create unique index idx_unique_name
on employee (name);

--inserting value
insert into employees values
(0,'john','HR',40000,25,'2023-06-11');

--composite index
create index idx_dept_salary
on employees (department, salary);

--alter index
exec sp_rename 'employees.idx_unique_name', 'idx_employee_Uname'

--show all the index 
exec sp_helpindex 'Employees'