--Lab5_Odtwarzanie_baz.pdf

zad 1
create table osoby(
id int primary key, 
imie varchar(40), 
nazwisko varchar(60))

zad 2

insert into osoby values(1,'Jan','Nowak');
insert into osoby values(2,'Ewa','Lis');
a)
BACKUP DATABASE datadb TO DISK='C:\bazyKopie\datadb_Full.bak'

b)
insert into osoby values(3,'Anna','Nowak');
BACKUP DATABASE datadb TO DISK = 'C:\bazyKopie\dataDiff.bak' WITH DIFFERENTIAL

c)
insert into osoby values(4,'Gosia','Kozidrak');
BACKUP log datadb TO DISK = 'C:\bazyKopie\dataLog.trn' 

d,e,f)
baza prawy przycisk tasks bacupadd kopiuj ścieżke i uruchamiamy wstecz i data 
sqlservermanager11.msc //wersja 2014 ma 12
D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\
 BACKUP log datadb TO DISK = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataLogOgonek.trn' with 
continue_after_error

g)
RESTORE DATABASE datadb FROM DISK ='C:\bazyKopie\datadb_Full.bak' WITH NORECOVERY
RESTORE DATABASE datadb FROM DISK ='C:\bazyKopie\dataDiff.bak' WITH NORECOVERY
RESTORE log datadb FROM DISK ='C:\bazyKopie\dataLog.trn' WITH NORECOVERY
RESTORE log datadb FROM DISK ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataLogOgonek.trn' WITH NORECOVERY

h)
restore database datadb with recovery

3)
  select * from datadb.dbo.osoby
  
RESTORE DATABASE datadb FROM DISK ='C:\bazyKopie\datadb_Full.bak' WITH NORECOVERY, replace
RESTORE DATABASE datadb FROM DISK ='C:\bazyKopie\dataDiff.bak' WITH NORECOVERY, replace

restore database datadb with recovery

select * from datadb.dbo.osoby

4)zmienic na moja baze z master na gorze

insert into osoby values(4,'Anna','Kazimierczak');
insert into osoby values(5,'Dariusz','Krysiak');

BACKUP DATABASE datadb TO DISK='C:\bazyKopie2\datadb_Full.bak'

insert into osoby values(6,'Katarzyna','Maciejewska');
BACKUP DATABASE datadb TO DISK = 'C:\bazyKopie2\dataDiff.bak' WITH DIFFERENTIAL

insert into osoby values(7,'Gosia','Modrzejewska');
BACKUP log datadb TO DISK = 'C:\bazyKopie2\dataLog.trn' 

insert into osoby values(8,'Barbara','Szatan');
--usun poprzedni ogonek
BACKUP log datadb TO DISK = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataLogOgonek.trn' with continue_after_error


RESTORE DATABASE datadb FROM DISK ='C:\bazyKopie2\datadb_Full.bak' with standby='C:\bazyKopie2\standby.bak', replace
RESTORE DATABASE datadb FROM DISK ='C:\bazyKopie2\dataDiff.bak' WITH standby='C:\bazyKopie2\standby.bak'
RESTORE log datadb FROM DISK ='C:\bazyKopie2\dataLog.trn' WITH standby='C:\bazyKopie2\standby.bak'
RESTORE log datadb FROM DISK ='D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\dataLogOgonek.trn' WITH standby='C:\bazyKopie2\standby.bak'

po kazdym new query select * from osoby i dopiero nastepne restore pozwala to zobaczyc co sie oddtworzylo

restore database datadb with recovery
select * from datadb.dbo.osoby

5)
BACKUP DATABASE model TO DISK='C:\model\model_Full.bak'


