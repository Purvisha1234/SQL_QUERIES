create table employee(
eid int,
ename varchar(20),
dname varchar(20),
city varchar(50))

/*insert */
create procedure sp_getdetail
@eid int,
@ename varchar(50),
@dname varchar(50)
as
begin
	insert into employee(eid,ename,dname)
	values(@eid,@ename,@dname)
end

execute sp_getdetail 1,'purvi','DE'

/*update*/
alter procedure sp_getdetail
@eid int,
@name varchar(20)
as
begin 
	update employee set  ename=@name
	where @eid=eid
end

execute sp_getdetail 1,'janvi'

/*delete*/
create procedure deletename
@ename varchar,
@eid int
as
begin
      delete from employee
	  where eid=@eid
end

execute  deletename 'janvi',1
select *from employee