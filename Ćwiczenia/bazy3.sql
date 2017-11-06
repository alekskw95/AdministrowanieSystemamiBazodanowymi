https://docs.microsoft.com/en-us/sql/relational-databases/databases/move-system-databases

Zad 1

SELECT name,physical_name
FROM sys.master_files
WHERE database_id=DB_ID('demoDB')

ALTER DATABASE demoDB MODIFY FILE ( NAME = 'demoDB' , 
FILENAME = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\demoDB.mdf' )

ALTER DATABASE demoDB MODIFY FILE ( NAME = 'demoDB_log' , 
FILENAME = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\demoDB.mdf' )

Zad 2

Zad 3
zatrzymac baze w manager... przeniesc recznie wlaczyc
ALTER DATABASE msdb MODIFY FILE ( NAME = 'MSDBData' , 
FILENAME = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\nowabazazajecia\MSDBData.mdf' )

ALTER DATABASE msdb MODIFY FILE ( NAME = 'MSDBLog' , 
FILENAME = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\nowabazazajecia\MSDBLog.ldf' )

Zad 4
jak 3
ALTER DATABASE model MODIFY FILE ( NAME = 'modeldev' , 
FILENAME = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\nowabazazajecia\model.mdf' )

ALTER DATABASE model MODIFY FILE ( NAME = 'modellog' , 
FILENAME = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\nowabazazajecia\modellog.ldf' )


cmd jako administrator i wkleic

Zad 5
ALTER DATABASE tempdb MODIFY FILE ( NAME = 'tempdev' , 
FILENAME = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\nowabazazajecia\tempdb.mdf' )

ALTER DATABASE tempdb MODIFY FILE ( NAME = 'templog' , 
FILENAME = 'D:\Programy\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\nowabazazajecia\templog.ldf' )

