--1)
create table tblEmployee(
id int primary key,
FirstName nvarchar(50),
LastName nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50))

execute sp_helpindex tblEmployee

insert into tblEmployee values(1,'Mike','Sandoz',4500,'Male','New York')
insert into tblEmployee values(1,'John','Menco',2500,'Male','London')

drop index tblEmployee.PK_tblEmplo_3213E83F1C57FE8E

create unique nonclustered index UIX_tblEmployee_FirstName_LastName
on tblEmployee(FirstName, LastName)
execute sp_helpindex tblEmployee

alter table tblEmployee 
add constraint UQ_tblEmployee_City 
unique nonclustered (City)
execute sp_helpindex tblEmployee
--2)
CREATE TABLE tblEmployee
(
id int PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
Salary INT,
Gender NVARCHAR(10),
City NVARCHAR(50)
)

EXECUTE sp_helpindex tblEmployee

INSERT INTO tblEmployee VALUES(1,'Mike','Sandoz',4500,'Male','New York')
INSERT INTO tblEmployee VALUES(1,'John','Menco',2500,'Male','London')
SELECT * FROM tblEmployee

DROP INDEX tblEmployee.PK__tblEmplo__3213E83FFAA32E21

CREATE UNIQUE NONCLUSTERED INDEX UIX_tblEmployee_FirstName_LastName
ON tblEmployee(FirstName, LastName)
EXECUTE sp_helpindex tblEmployee

ALTER TABLE tblEmployee
ADD CONSTRAINT UQ_tblEmployee_City
UNIQUE NONCLUSTERED (City)

EXECUTE SP_HELPCONSTRAINT tblEmployee

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY
--3
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
