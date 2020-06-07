@echo off
setlocal enabledelayedexpansion

set todo_list=%~dp0todo_list
set todo_counter=%~dp0todo_counter

set /a counter=1
if exist %todo_counter% (
    for /f %%l in (%todo_counter%) do (
        set line=%%l

        set /a n1=!line:~0,1!*1000
        set /a n2=!line:~1,1!*100
        set /a n3=!line:~2,1!*10
        set /a n4=!line:~3,1!
        
        set /a number=!n1!+!n2!+!n3!+!n4!
        set /a counter=!number!+1
    )
)

set pad=000
if %counter% gtr 9 set pad=00
if %counter% gtr 99 set pad=0
if %counter% gtr 999 set pad=

for /f "delims=#" %%e in ('"prompt #$e# & for %%e in (1) do rem"') do set esc=%%e
<nul set /p=%esc%[32m
echo %pad%%counter% %*
<nul set /p=%esc%[0m
if exist %todo_list% (
    type %todo_list%
)

echo %pad%%counter% > %todo_counter%
echo %pad%%counter% %* >> %todo_list%

endlocal
