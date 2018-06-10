@echo off&title 多文件夹文件排序重命名处理

set /a sortindex=1
set /a dirindex=-3
set /a dirlength=3
set namestr=tmp

set /p runorno=是否执行？？

echo     多文件夹文件排序重命名处理>RenameLog.txt
echo --------------%~dp0-------------->>RenameLog.txt
echo ------------------------------------>>RenameLog.txt
echo dirindex=%dirindex%   dirlength=%dirlength% >>RenameLog.txt
echo.>>RenameLog.txt

setlocal ENABLEDELAYEDEXPANSION
for /f "tokens=*" %%i in ('dir /ad /b /s "%~dp0"') do (
	set /a n=%sortindex%
	for /f "tokens=*" %%j in ('dir /a-d /b /s "%%i\*.*"') do (
		if "%%~xj" neq ".bat" (
			if !n! lss 10 (
				set tmpstr=00!n!
			) else if !n! lss 100 (
				set tmpstr=0!n!
			) else (
				set tmpstr=!n!
			)
			set dirName=%%~nxi
			set fileName=%%~nj
			set fileName=%namestr%!dirName:~%dirindex%,%dirlength%!_!tmpstr!%%~xj
			rename "%%j" !fileName!
			set tmpstr=%%~nxi\%%~nxj --^> !fileName!
			title !tmpstr!&echo !tmpstr!
			echo !tmpstr!>>RenameLog.txt
			set /a n=!n!+1
		)
	)
	echo.>>RenameLog.txt
)
echo -------------------End------------------->>RenameLog.txt
set n=
set tmpstr=
set dirName=
set fileName=
setlocal DISABLEDELAYEDEXPANSION
::rename %%s !fileName!
set sortindex=
set dirindex=
set dirlength=
set namestr=
set runorno=
pause
::start RenameLog.txt
