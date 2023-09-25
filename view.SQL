--1)
create table tblEmployee(
id int primary key,
name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmendId int)

create table tblDepartment(
DeptId int primary key,
DeptName nvarchar(20))

insert into tblDepartment values(1,'IT')
insert into tblDepartment values(2,'Payroll')
insert into tblDepartment values(3,'HR')
insert into tblDepartment values(4,'Admin')

insert into tblEmployee values(1,'John',5000,'Male',3)
insert into tblEmployee values(2,'Mike',3400,'Male',2)
insert into tblEmployee values(3,'Pam',6000,'Female',1)
insert into tblEmployee values(4,'Todd',4800,'Male',4)
insert into tblEmployee values(5,'Sara',3200,'Female',1)
insert into tblEmployee values(6,'Ben',4800,'Male',3)

select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmendId = tblDepartment.DeptId

create View vWEmployeesByDepartment
as
select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmendId = tblDepartment.DeptId

select * from vWEmployeesByDepartment

create View vWEmployeesCountByDepartament
as
select DeptName, count(Id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmendId = tblDepartment.DeptId
group by DeptName
--2)
create table tblEmployee(
id int primary key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartamentId int)

insert into tblEmployee values(1,'John',5000,'Male',3)
insert into tblEmployee values(2,'Mike',3400,'Male',2)
insert into tblEmployee values(3,'Pam',6000,'Female',1)
insert into tblEmployee values(4,'Todd',4800,'Male',4)
insert into tblEmployee values(5,'Sara',3200,'Female',1)
insert into tblEmployee values(6,'Ban',4800,'Male',3)

create view vWEployeesDataExceptSalary
as
select Id,Name,Gender,DepartamentId
from tblEmployee

select * from vWEployeesDataExceptSalary

update vWEployeesDataExceptSalary
set Name = 'Mikey' where Id=2
select * from vWEployeesDataExceptSalary

delete from vWEployeesDataExceptSalary where Id=2
insert into vWEployeesDataExceptSalary values(2,'Mikey','Male',2)

create table tblDepartment(
DeptId int primary key,
DeptName nvarchar(20))

insert into tblDepartment values(1,'IT')
insert into tblDepartment values(2,'Payroll')
insert into tblDepartment values(3,'HR')
insert into tblDepartment values(4,'Admin')

create View vwEmployeeDetailsByDepartment
as
select Id,Name,Salary,Gender,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartamentId = tblDepartment.DeptId

select * from vwEmployeeDetailsByDepartment

update vwEmployeeDetailsByDepartment
set DeptName='IT' where Name = 'John'
