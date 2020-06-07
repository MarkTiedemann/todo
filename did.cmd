@echo off
setlocal

if not exist "%~dp0todo" goto :eof

for /f "delims=#" %%e in ('"prompt #$e# & for %%e in (1) do rem"') do set esc=%%e
<nul set /p=%esc%[31m
findstr "%*" "%~dp0todo"
<nul set /p=%esc%[0m

findstr /v "%*" "%~dp0todo" > "%~dp0tmp"
type "%~dp0tmp"
move /y "%~dp0tmp" "%~dp0todo" > nul

endlocal
