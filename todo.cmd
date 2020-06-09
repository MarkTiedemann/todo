@echo off
setlocal

set todo_list=%~dp0todo_list
if exist %todo_list% (
	type %todo_list% 
)
