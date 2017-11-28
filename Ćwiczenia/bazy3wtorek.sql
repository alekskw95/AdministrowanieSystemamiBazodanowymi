--Lab3_przenoszenie_baz.pdf

--Zadanie 1
ALTER DATABASE demoDB1 SET OFFLINE WITH ROLLBACK IMMEDIATE

ALTER DATABASE demoDB1 MODIFY FILE (NAME=demoDB1,FILENAME= 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Lokalizacja\demoDB1.mdf')
ALTER DATABASE demoDB1 MODIFY FILE (NAME=demoDB1_log,FILENAME= 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Lokalizacja\demoDB1_log.ldf')

ALTER DATABASE demoDB1 SET ONLINE WITH ROLLBACK IMMEDIATE

SELECT name,physical_name,state_desc
FROM sys.master_files
WHERE database_id=DB_ID('demoDB1')

--Zadanie 2

----
-dc:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\master.mdf;-ec:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\Log\ERRORLOG;
-lc:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\mastlog.ldf
----

a) zmienić lokalizacje w tym co powyżej
b) zatrzymać
c) przenieść
d) włączyć

Następnie kliknąc prawym na bazę (na calym serwerze) i wybrać new query, następnie:
----
SELECT name,physical_name,state_desc
FROM sys.master_files
WHERE database_id=DB_ID()
-----
SELECT name,physical_name,state_desc
FROM sys.master_files
WHERE database_id=DB_ID('master')

---Zadanie 4
Przejść do konsoli cmd.
cd ..
cd..
cd windows
cd system32
net stop mssqlserver

NET START MSSQLSERVER /f /T3608

Zad 3 -> 34 MSDB


