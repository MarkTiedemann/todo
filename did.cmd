@echo off
if exist "%~dp0todo" (
    findstr "%*" "%~dp0todo"
    findstr /v "%*" "%~dp0todo" > "%~dp0tmp"
    move /y "%~dp0tmp" "%~dp0todo" > nul
)
