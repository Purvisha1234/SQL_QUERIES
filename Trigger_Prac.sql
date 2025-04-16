create database Triggerprac
use Triggerprac
/*trigger has three operation:1.insert,2.update,3.delete
types of trigger:1.after /for trigger
                 2.instead of trigger

syntax:
create[or alter] trigger
[schema_name]trigger_name
on{table|view}
[with<option>[,...n]]
{for|alter|instead of}
{[insert],[update],[delete]}
[not for replication]
as{sql_statement[;][,...n]}

[with encryption]

*/

--Triggers
--drop trigger <tablename>
--disable trigger <triggername > on <tablename>
--enable trigger <triggername > on <tablename>

--log every time a new customer is added to the customers table 
CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)


CREATE TABLE tblEmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
)
--inserting command
CREATE TRIGGER tr_tblEMployee_ForInsert
ON tblEmployee
FOR INSERT
AS
BEGIN
 Declare @Id int
 Select @Id = Id from inserted
 
 insert into tblEmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
END

disable trigger tr_tblEMployee_ForInsert on tblEmployee
enable trigger tr_tblEMployee_ForInsert on tblEmployee


Insert into tblEmployee values (7,'Tan', 2300, 'Female', 3)

CREATE TRIGGER tr_tblEMployee_ForDelete
ON tblEmployee
FOR DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted
 
 insert into tblEmployeeAudit 
 values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' + Cast(Getdate() as nvarchar(20)))
END

delete from tblEmployee where id=7
select *from tblEmployee
select *from tblEmployeeAudit

--to prevent the stockQuantity in a product table from becoming negative
create table Produc
(id int,
stockQuantity int,
Pname varchar(50))
INSERT INTO Produc (id, stockQuantity, Pname)
VALUES 
    (1, 100, 'Laptop'),
    (2, 50, 'Smartphone'),
    (3, 200, 'Headphones'),
    (4, 30, 'Monitor'),
    (5, 150, 'Keyboard');

create trigger preventNegativeStock
ON Produc
after UPDATE
AS
BEGIN
 if EXISTS (select 1 from inserted where StockQuantity<0)
 begin
 raiserror ('stockquantity can not be negative.',16,1);
 rollback transaction 
 end
 end

 update produc set stockQuantity=8 where id=4
 select *from Produc
 /*TRIGGER ASSIGNMENT*/
 /*1.Create a Trigger for Logging of Deleted Employees.*/
 CREATE TABLE employeedeletelog(
    employeeid int,
    deletedate datetime
	);

 create trigger tr_logdeleteemployeee
 on employee
 after delete
 as
 begin
    insert into employeedeletelog(employeeid,deletedate)
	select employeeid,GETDATE()
	from deleted;
	end;

delete from employee where employeeid=1

/*2.Create a Trigger for Updating Employee's Last Modified Date on Update.*/
create trigger tr_employeeupdatemodified
on employee
after update
as
begin 
     update employee
	 set lastmodified = GETDATE()
	 FROM inserted i
	 where employee.employeeid = i.employeeid;
end;



/*3. Trigger to keep log of department IDs that have been deleted.*/
create table departmentdeletelog(
  departmentid int,
  deletedate datetime
  );

create trigger tr_departmentdeletelog
on departments
after delete
as
begin
    insert into departmentdeletelog (departmentid,deletedate)
	select departmentid, GETDATE()
	FROM deleted;
end;


/*4. Create Trigger to prevent duplicate email addresses from being entered in the
Employees table.*/
employee table.
create trigger tr_uniqueemployeeemail
on employee
after insert, update
as
begin
    if exists(select 1 from inserted i
	    join employee e on i.email=e.email
		where i.employeeid<>e.employeeid
	begin
	     raiserror('email address already exists.',16,1);
		 rollback transaction;
		 end;
 end;

/*5. Create a Trigger if a column named Status is not provided during an insert, set its
default value to 'Pending'.*/
default value to 'pending'

create trigger tr_setdefaultstatus
instead of insert
on orders
as
begin
     insert into orders(orderid,status)
	 select orderid,isnull(status,'pending')
	 from inserted;
end;


create table emp(
emp_id int,
ename varchar(50),
salary decimal(10,2),
dob date,
experience int,
record_datetime datetime)

INSERT INTO emp (emp_id, ename, salary, dob, experience, record_datetime)  
VALUES  
(1, 'John Doe', 60000.50, '1990-05-15', 10, '2025-03-21 10:30:00'),  
(2, 'Jane Smith', 75000.75, '1985-08-22', 15, '2025-03-21 10:35:00'),  
(3, 'Robert Brown', 50000.00, '1995-02-10', 5, '2025-03-21 10:40:00'),  
(4, 'Emily Davis', 85000.25, '1982-11-30', 18, '2025-03-21 10:45:00'),  
(5, 'Michael Johnson', 92000.90, '1980-07-19', 20, '2025-03-21 10:50:00');  

select *from emp

CREATE TRIGGER tr_after_insert  --before trigger
ON emp  
AFTER INSERT  
AS  
BEGIN  
    DECLARE @e_dob DATE, @age INT, @experience INT;  

    -- Retrieve values from the inserted table (assuming only one row is inserted at a time)
    SELECT @e_dob = dob, @experience = experience FROM inserted;  

    -- Calculate age
    SET @age = YEAR(GETDATE()) - YEAR(@e_dob);  

    -- Check conditions
    IF @age > 25  
    BEGIN  
        PRINT 'Not eligible: age is greater than 25';  
        ROLLBACK;  
    END  
    ELSE IF @experience < 5  
    BEGIN  
        PRINT 'Not eligible: experience is less than 5';  
        ROLLBACK;  
    END  
    ELSE  
    BEGIN  
        PRINT 'Employee details inserted successfully';  
    END  
END;
insert into emp(ename,salary,dob,experience,record_datetime)
values('purvi',20000,'2025-01-03',5,getdate())
select *from emp

create table employeehistory(
id int,
ename varchar(20),
old_value varchar(100),
new_value varchar(100),
record_datetime datetime)

INSERT INTO employeehistory (id, ename, old_value, new_value, record_datetime)
VALUES 
(1, 'John Doe', '50000', '55000', '2025-03-01 10:30:00'),
(2, 'Jane Smith', 'HR Manager', 'Senior HR Manager', '2025-03-10 14:20:00'),
(3, 'Alice Brown', 'New York', 'Los Angeles', '2025-03-15 09:45:00'),
(4, 'Mike Johnson', '2020-05-01', '2025-03-01', '2025-03-20 13:10:00'),
(5, 'Emily Davis', 'Project A', 'Project B', '2025-03-21 08:55:00');

create trigger tr_after_update on emp
after update
as
declare @eid int,@ename varchar(50),@old_ename varchar(50),@salary decimal(10,2),@old_salary decimal(10,2)
select @eid=eid,@ename=ename,@salary=salary from inserted
select @old_name=ename,@old_salary=salary from deleted

if update(ename)
begin
insert into employeehistory(id,ename,old_values,new_value,record_datetime)
values(@eid,'emp_name',@old_name,@ename,getdate())
end
if update(salary)
begin
insert into employeehistory(id,field_name,old_value,new_value,record_datetime)
values(@eid,'emp_sal',@old_salary,@salary,getdate()

create procedure procedurename
declare variablename datatype
as
begin
	select
end