@echo off
set PGPASSWORD=12345
set dbName=prueba02
set serverName=localhost
set userName=postgres
set port=5432
set destination=c:\test\

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YYYY=%dt:~0,4%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%"
set "Min=%dt:~10,2%"
set "Sec=%dt:~12,2%"
set fileName=BackupPG-%dbName% d-%YYYY%-%MM%-%DD% t-%HH%-%Min%-%Sec%
set route=%destination%%fileName%

pg_dump --host %serverName% --port %port% --username %userName% --format custom --file "%route%" %dbName%