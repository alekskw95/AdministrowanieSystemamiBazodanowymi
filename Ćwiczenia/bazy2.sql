--Lab 2 

--Zad 2

ALTER DATABASE demoDB
ADD FILEGROUP FG1;

--Zad 5
--Utwórz tabelê tab1(id int identity primary key, tekst char(200))
create table tab1
(
id integer identity primary key, 
tekst char(200)
);

--Zad 6
while (1>0)
begin 
insert into tab1 values ('tekst')
continue;
end
-- zad 7 

--Zad 8 
CREATE TABLE tab2(
id int identity primary key,
tekst char(200))
on [PRIMARY];

--Zad 9 
while (1>0)
begin 
insert into tab2 values ('tekst')
continue;
end

--zad 10 
CREATE TABLE tab3(
tekst varchar(50));

-----------------------------------
insert into tab3 values('abc');
insert into tab3 values('AbC');
insert into tab3 values('aBc');


select * from tab3 where tekst='abc'

select * from tab3 where tekst COLLATE Polish_CS_AS ='abc'

insert into tab3 values('cAb'),('baZ')

select tekst  from tab3  order by tekst

select tekst  from tab3  order by tekst COLLATE Polish_CS_AS

insert into tab3 values('¹æŸ'),('êæ¿'),('exy'),('êqa')

select*from tab3 order by tekst --(CI_AS)
select tekst from tab3 order by tekst COLLATE Polish_CI_AI --(CI_AI)

select*from tab3 order by tekst --(CI_AS)
select tekst from tab3 order by tekst COLLATE Polish_CS_AI --(CS_AI)

--zad 11
database propertises -> recovery -> page_verify -> checksum

-- zad 12

alter database demoDB set offline with rollback immediate;

use 
master
go
alter database demoDB set offline with rollback immediate;

select * from demodb.dbo.tab1;

--zad 13
alter database demoDB set online with rollback immediate;

--zad 14
use master
go
alter database demoDB set read_only with rollback immediate;
--
alter table tab1 add nazwisko varchar(40);
create table tab5(id integer)

--zad 15
use master
go
alter database demoDB set read_write with rollback immediate;

--zad 16
use master
go
alter database demoDB set single_user with rollback immediate;

--zad17
use master
go
alter database demoDB set restricted_user with rollback immediate;


---------------------------------------------------------------------+
use master
go
alter database demoDB set multi_user with rollback immediate;
---------------------------------------------------------------------+
