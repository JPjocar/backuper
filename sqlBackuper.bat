@echo off
set serverName=127.0.0.1
set port=1433
set userName=jocar
set userPass=12345
set dbName=prueba
set destination=c:\test\

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YYYY=%dt:~0,4%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%"
set "Min=%dt:~10,2%"
set "Sec=%dt:~12,2%"
set fileName=BackupPG-%dbName% d-%YYYY%-%MM%-%DD% t-%HH%-%Min%-%Sec%.bak

set route=%destination%%fileName%

SQLCMD -S %serverName%,%port% -U %userName% -P %userPass% -Q "BACKUP DATABASE %dbName% TO DISK = '%route%' WITH INIT, NAME = N'BackupAutomatico', STATS = 10"