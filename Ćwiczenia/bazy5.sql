--Lab5_Odtwarzanie_baz.pdf

--Zad 1.
CREATE TABLE osoby(
id int primary key,
imie varchar(40),
nazwisko varchar(60)
)
--Zad 2.
insert into osoby values(1,'Jan','Nowak')
insert into osoby values(2,'Ewa','Lis')
--a)
backup database dataDB to disk = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBFull.bak'
--b)
insert into osoby values(3,'Katarzyna','Nowak')
backup database dataDB to disk='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBDiff.bak' with differential
--c)
insert into osoby values(4,'Ola','Kopeæ')
backup log dataDB to disk = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBLog.trn'
--d)
--sqlservermanager11.msc
--D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\
--e)
--Uruchomione
--f)
backup log dataDB to disk = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBLogOgonek.trn' 
WITH CONTINUE_AFTER_ERROR
--g)
restore database dataDB from disk ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBFull.bak' with norecovery
restore database dataDB from disk ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBDiff.bak' with norecovery
restore database dataDB from disk ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBLog.trn' with norecovery
restore database dataDB from disk ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBLogOgonek.trn' with norecovery
--h)
restore database dataDB with recovery
select * from osoby

--Zad 3.
restore database dataDB from disk ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBFull.bak' with replace, norecovery
restore database dataDB from disk ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBDiff.bak' with replace, norecovery
restore database dataDB with recovery
select * from osoby

--Zad 4.
insert into osoby values(5,'kooo','tttt')
insert into osoby values(6,'Ewa','Lis')
--a)
backup database dataDB to disk = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBFull.bak'
--b)
insert into osoby values(3,'Katarzyna','Nowak')
backup database dataDB to disk='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBDiff.bak' with differential
--c)
insert into osoby values(4,'Ola','Kopeæ')
backup log dataDB to disk = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBLog.trn'
--d)
--sqlservermanager11.msc
--D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\
--e)
--Uruchomione
--f)
backup log dataDB to disk = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBLogOgonek.trn' 
WITH CONTINUE_AFTER_ERROR
--g)
restore database dataDB from disk ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBFull.bak' with norecovery
restore database dataDB from disk ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBDiff.bak' with norecovery
restore database dataDB from disk ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBLog.trn' with norecovery
restore database dataDB from disk ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataDBLogOgonek.trn' with norecovery
--h)
restore database dataDB with recovery
select * from osoby