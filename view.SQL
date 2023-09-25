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
--3)
create table tblProduct(
ProductId int primary key,
Name nvarchar(20),
UnitPrice int)

insert into tblProduct values(1,'Books',20)
insert into tblProduct values(2,'Pens',14)
insert into tblProduct values(3,'Pencils',11)
insert into tblProduct values(4,'Clips',10)

alter table tblProductSales(
ProductId int,
QuantitySold int)

insert into tblProductSales values(1,10)
insert into tblProductSales values(3,23)
insert into tblProductSales values(4,21)
insert into tblProductSales values(2,12)
insert into tblProductSales values(1,13)
insert into tblProductSales values(3,12)
insert into tblProductSales values(4,13)
insert into tblProductSales values(1,11)
insert into tblProductSales values(2,12)
insert into tblProductSales values(1,14)

create view vWTotalSalesByProduct
with SchemaBinding
as
select Name,
sum(isnull((Quantity * UnitPrice),0)) as TotalSales,
count_big(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
group by Name

create unique clustered index UXI_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)
--4)
create table tblEmployee(
Id int primary key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartamentId int)

insert into tblEmployee values(1,'John',5000,'Male',3)
insert into tblEmployee values(2,'Mike',3400,'Male',2)
insert into tblEmployee values(3,'Pam',6000,'Female',1)
insert into tblEmployee values(4,'Todd',4800,'Male',4)
insert into tblEmployee values(5,'Sara',3200,'Female',1)
insert into tblEmployee values(6,'Ben',4800,'Male',3)

-- Error : Cannot pass Parameters to Views 
Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from  tblEmployee
where Gender = @Gender

Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)

Select * from dbo.fnEmployeeDetails('Male')

Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id

Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable
