@echo off
setlocal

set todo_list=%~dp0todo_list
set tmp_file=%~dp0tmp_file

if not exist %todo_list% goto :eof

for /f "delims=#" %%e in ('"prompt #$e# & for %%e in (1) do rem"') do set esc=%%e
<nul set /p=%esc%[31m
findstr "%*" %todo_list%
<nul set /p=%esc%[0m

findstr /v "%*" %todo_list% > %tmp_file%
type %tmp_file%
move /y %tmp_file% %todo_list% > nul

endlocal
