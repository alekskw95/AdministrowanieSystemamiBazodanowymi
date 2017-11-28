--Lab4_kopie_zapasowe.pdf

--Zadanie 1
----recorvery model na simple (wyklikane i wygenerowane):
USE [master]
GO
ALTER DATABASE [demoDB] SET RECOVERY SIMPLE WITH NO_WAIT
GO
-----
BACKUP DATABASE demoDB
TO DISK = 'F:\bazaPamiec\demoDB_Full.bak'  <- u mnie to jest dysk F, na którym mam utworzony folder bazaPamiec

select * from msdb.dbo.backupset
select * from msdb.dbo.backupfile
select * from msdb.dbo.backupmediaset
select * from msdb.dbo.backupmediafamily

Poniższe nie do końca wiem czy dobre kolumny:

select p.backup_set_id, p.backup_start_date, p.backup_finish_date,
m.physical_device_name,
p.collation_name, p.type, p.backup_size
from msdb.dbo.backupset p join msdb.dbo.backupmediafamily m
on p.media_set_id=m.media_set_id

--Zadanie 2  (wykonało się bez błędu / nie wiem czy o to dokładnie chodzi??)
BACKUP DATABASE demoDB
TO DISK = 'F:\bazaPamiec\demoDB_Full.bak'
WITH NOINIT

BACKUP DATABASE demoDB
TO DISK = 'F:\bazaPamiec\demoDB_Full.bak'
WITH INIT

select * from msdb.dbo.backupset
select * from msdb.dbo.backupfile
select * from msdb.dbo.backupmediaset
select * from msdb.dbo.backupmediafamily

select p.backup_set_id, p.backup_start_date, p.backup_finish_date,
m.physical_device_name,
p.collation_name, p.type, p.backup_size
from msdb.dbo.backupset p join msdb.dbo.backupmediafamily m
on p.media_set_id=m.media_set_id

--Zadanie 3  Wykonaj kopie róznicową bazy msdb do nowego pliku danych. 
BACKUP DATABASE demoDB
TO DISK = 'F:\bazaPamiec\KRoznicowa\demoDB_Full.bak',
DISK = 'F:\bazaPamiec\KRoznicowa\demoDB2_Full.bak'
WITH DIFFERENTIAL, FORMAT,
MEDIANAME = 'demoDBDiff'

Dla msdb (przejśc na inne new query):
BACKUP DATABASE msdb
TO DISK = 'C:\bazyKopie\msdb_Full.bak'

BACKUP DATABASE msdb
TO DISK = 'C:\bazyKopie\msdb_Full.bak',
DISK = 'C:\bazyKopie\msdb2_Full.bak'
WITH DIFFERENTIAL, FORMAT,
MEDIANAME = 'msdbDiff'

--Zadanie 4 Wykonaj pełną i różnicową kopie bazy master do tego samego pliku
--pełna--
BACKUP DATABASE master
TO DISK = 'F:\bazaPamiec\KpelnaroznMASTER\master_Full.bak'
--różnicowa-- wyrzuca błąd (nie jest to pewne na 100% ale możliwe że tak ma być)
BACKUP DATABASE master
TO DISK = 'F:\bazaPamiec\KpelnaroznMASTER\masterR_Full.bak',
DISK = 'F:\bazaPamiec\KpelnaroznMASTER\master2R_Full.bak'
WITH DIFFERENTIAL, FORMAT,
MEDIANAME = 'masterDiff'

--Zadanie 5 Wykonaj kopie logu stworzonej przez siebie bazy. Czy jest możliwe? Jakie dwa warunki muszą być
-- spełnione w celu umożliwienia wykonania kopii logu transakcyjnego?
USE [master]
GO
ALTER DATABASE [demoDB] SET RECOVERY FULL WITH NO_WAIT
GO

BACKUP LOG demoDB   (??)
TO DISK = 'F:\bazaPamiec\KopiaLogu\demoDB_Log.bak'
WITH MEDIANAME = 'demoDBLog'

Wyrzuca błąd:
BACKUP LOG cannot be performed because there is no current database backup.
BACKUP LOG is terminating abnormally.

Rozwiazanie najpierw pełen backup a później log:
1) Usunąć poprzedni jezeli jest z nazwa taka samą w pełnym, któy wykonany był w jakimś poprzednim zadaniu i znajodwałby
się w tym samym folderze.

BACKUP DATABASE dataDB
TO DISK = 'C:\bazyKopie\dataDB_Full.bak'

BACKUP LOG dataDB  
TO DISK = 'C:\bazyKopie\dataDB_Log.trn'
WITH MEDIANAME = 'dataDBLog'

2)
BACKUP DATABASE dataDB
TO DISK = 'C:\bazyKopie\dataDBlog_Full.bak'

BACKUP LOG dataDB  
TO DISK = 'C:\bazyKopie\dataDBlog_Log.trn'
WITH MEDIANAME = 'dataDBLog'

-- Zadanie 6 Wykonaj kopię kopii dowolnej bazy jednym poleceniem do dwóch plików danych (opcje mirror,
-- format). Zapisz backup na dysk D oraz jego kopię na dysku C w wybranym katalogu. Zapewnij, że konto
-- na którym pracuje MS SQL Server ma uprawnienia do tego folderu.
(? - na moim laptopie pokazuje -> opcja mirror nie jest dostepna w tym wydaniu sql server)
BACKUP DATABASE demoDB
TO DISK = 'D:\bazaPamiec\BackupMirror\demoDB_Full.bak',
DISK = 'D:\bazaPamiec\BackupMirror\demoDB2_Full.bak'
MIRROR TO DISK = 'F:\bazaPamiec\KopiaMirror\demoDBM_Full.bak',
DISK = 'F:\bazaPamiec\KopiaMirror\demoDBM2_Full.bak'
WITH FORMAT

W sali komputerowej nie wyrzuca błędu:
BACKUP DATABASE demoDB
TO DISK = 'C:\bazyKopie\demoDB_Full.bak',
DISK = 'C:\bazyKopie\demoDB2_Full.bak'
MIRROR TO DISK = 'C:\bazyKopie2\demoDBM_Full.bak',
DISK = 'C:\bazyKopie2\demoDBM2_Full.bak'
WITH FORMAT

--**********************************FORMAT*************************
BACKUP DATABASE demoDB
TO DISK = 'F:\bazaPamiec\KopiaFormat\demoDB_Full.bak'
WITH INIT

BACKUP DATABASE demoDB
TO DISK = 'F:\bazaPamiec\KopiaFormat\demoDB_Full.bak',
DISK = 'F:\bazaPamiec\KopiaFormat\demoDB2_Full.bak'
WITH INIT

BACKUP DATABASE demoDB
TO DISK = 'F:\bazaPamiec\KopiaFormat\demoDB_Full.bak',
DISK = 'F:\bazaPamiec\KopiaFormat\demoDB2_Full.bak'
WITH INIT, FORMAT,
MEDIANAME = 'demoMedia'
--***********************************************************

-- Zadanie 7  Do dowolnej bazy dodaj drugą grupę plików. Dodaj do nowej grupy plików plik danych i stwórz w nim
-- tabelę. Wypełnij danymi tabelę (w pętli) tak aby plik osiągnął duży rozmiar. Wykonaj pełną kopię
-- zapasową tylko nowo utworzonej grupy plików. Następnie wykonaj do odrębnego pliku skompresowaną
-- kopię zapasową tylko tej grupy plików. Porównaj rozmiary kopii nieskropresowanej i skompresowanej.




-- Zadanie 8 Wykonaj różnicową pełną kopię zapasową stworzonej w punkcie 7 grupy plików. Kopia ta powinna się
-- znajdować w tym samym pliku danych co kopia skompresowana. Czy jest możliwe wykonanie takiej kopii?






