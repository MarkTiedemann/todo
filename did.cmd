@echo off
setlocal

set todo_list=%~dp0todo_list
set temp_file=%~dp0temp_file

if not exist %todo_list% goto :eof

findstr /v "%*" %todo_list% > %temp_file%
type %temp_file%

for /f "delims=#" %%e in ('"prompt #$e# & for %%e in (1) do rem"') do set esc=%%e
<nul set /p=%esc%[31m
findstr "%*" %todo_list%
<nul set /p=%esc%[0m

move /y %temp_file% %todo_list% > nul

endlocal
