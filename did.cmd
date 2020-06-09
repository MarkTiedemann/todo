@echo off
setlocal enabledelayedexpansion

set todo_list=%~dp0todo_list
set temp_file=%~dp0temp_file

if not exist %todo_list% (
	goto :eof
)

if exist %temp_file% (
	del %temp_file%
)
copy nul %temp_file% > nul

for /f "delims=#" %%e in ('"prompt #$e# & for %%e in (1) do rem"') do (
	set esc=%%e
)

for /f "tokens=*" %%l in (%todo_list%) do (
	echo %%l | findstr /v "%*" >> %temp_file%
	if !errorlevel! equ 1 (
		echo %esc%[31m%%l%esc%[0m
	) else (
		echo %%l
	)
)
echo.

move /y %temp_file% %todo_list% > nul
