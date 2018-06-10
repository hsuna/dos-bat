@echo off 
set /p length=输入文件名长度：(默认10)
if "%length%" == "" (
	set length=10
) else (
	set /a length=%length%
	if "%length%" == "0" set length=10
)
setlocal ENABLEDELAYEDEXPANSION
set fileName=""
for /R %~dp0 %%s in (*) do ( 
	if "%%~nxs" neq "Rename.bat" (
		set fileName=%%~ns
		set fileName=!fileName:~0,%length%!%%~xs
		echo !fileName!
		rename %%s !fileName!
	)
) 
set fileName=
setlocal DISABLEDELAYEDEXPANSION
set length=
pause 