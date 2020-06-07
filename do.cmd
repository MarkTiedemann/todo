@echo off
setlocal enabledelayedexpansion

set /a ticket=1
if exist "%~dp0ticket" (
    for /f %%l in (%~dp0ticket) do (
        set line=%%l

        set /a n1=!line:~0,1!*1000
        set /a n2=!line:~1,1!*100
        set /a n3=!line:~2,1!*10
        set /a n4=!line:~3,1!
        
        set /a number=!n1!+!n2!+!n3!+!n4!
        set /a ticket=!number!+1
    )
)

set pad=000
if %ticket% gtr 9 set pad=00
if %ticket% gtr 99 set pad=0
if %ticket% gtr 999 set pad=

for /f "delims=#" %%e in ('"prompt #$e# & for %%e in (1) do rem"') do set esc=%%e
<nul set /p=%esc%[32m
echo %pad%%ticket% %*
<nul set /p=%esc%[0m
if exist "%~dp0todo" (
    type "%~dp0todo"
)

echo %pad%%ticket% > "%~dp0ticket"
echo %pad%%ticket% %* >> "%~dp0todo"

endlocal
