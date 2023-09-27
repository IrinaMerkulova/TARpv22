--1)DDL Trigger SQL serveris
create trigger trMyFirstTrigger
on database
for create_table
as
begin
print 'New table created'
end

create table Test4(Id int)


alter trigger trMyFirstTrigger
on database
for create_table,alter_table,drop_table
as
begin
print 'A table has just been created, modified or deleted'
end

alter trigger trMyFirstTrigger
on database
for create_table,alter_table,drop_table
as
begin
rollback
print 'You cannot create, alter or drop a table'
end

disable trigger trMyFirstTrigger on database
drop trigger trMyFirstTrigger on database

create trigger trRenameTable
on database
for rename
as
begin
print 'You just renaimed something'
end

select * from NewTestTable

sp_rename 'NewTestTable.Id','NewId'

---------------------

--2)Server-Scoped DDL triggerid
create trigger tr_DatabaseScopeTrigger
on database
for create_table,alter_table,drop_table
as
begin
rollback
print 'You cannot create, alter or drop a table in the current database'
end

create trigger tr_ServerScopeTrigger
on all server
for create_table,alter_table,drop_table
as
begin
rollback
print 'You cannot create, alter or drop a table in the current database'
end

create table test(Id int)

disable trigger tr_ServerScopeTrigger on all server
enable trigger tr_ServerScopeTrigger on all server
drop trigger tr_DatabaseScopeTrigger on all server

---------------------

--3)SQL serveri trigeri täitmise järjekord
create trigger tr_DatabaseScopeTrigger
on database
for create_table
as
begin
print 'Database Scope Trigger'
end
go

create trigger tr_ServerScopeTrigger
on all server
for create_table
as
begin
print 'Server Scope Trigger'
end
go

exec sp_settriggerorder
@triggername='tr_DatabaseScopeTrigger', -- Name of the trigger
@order='none', -- Value can be First, Last or None. When set to None, trigger is fired in random order
@stmttype='create_table', -- SQL statment that fires the trigger. Can be INSERT, UPDATE, DELETE or any DDL event
@namespace='database' -- Scope of the trigger. Value can be DATABASE, SERVER or NULL
go

---------------------

--4)Logon trigger SQL serveris
create trigger tr_LogonAuditTriggers
on all server
for logon
as
begin
declare	@LoginName nvarchar(100)
set @LoginName = original_login()
if (select count(*) from sym.dm_exe_sessions
where is_user_process=1
and original_login_name=@LoginName) > 3
begin
print 'Fourth onnection of' + @LoginName + 'blocked'
rollback
end
end

execute sp_readerrorlog
