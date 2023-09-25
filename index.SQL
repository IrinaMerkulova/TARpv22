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
FirstName nvarchar(50),
LastName nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50))

insert into tblEmployee values(1,'Mike','Sandoz',4500,'Male','New York')
insert into tblEmployee values(2,'Sara','Menco',6500,'Female','London')
insert into tblEmployee values(3,'John','Barber',2500,'Female','Sydney')
insert into tblEmployee values(4,'Pam','Grove',3500,'Female','Toronto')
insert into tblEmployee values(5,'James','Mirch',7500,'Female','London')
select * from tblEmployee

create nonclustered index IX_tblEmployee_Salary
on tblEmployee(Salary ASC)

select * from tblEmployee where Salary > 4000 and Salary < 8000

delete from tblEmployee where Salary = 2500
update tblEmployee set Salary = 9000 where Salary = 7500
select * from tblEmployee

select * from tblEmployee order by Salary

select * from tblEmployee order by Salary Desc

select Salary, count(Salary) as Total
from tblEmployee
group by Salary
