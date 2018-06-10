@echo off&title 批量移动文件合并文件夹

set /a start=1
set /a diff=10
set startStr=act_

set findStr=act_
set /a findIndex=4
set /a findLength=3

set /a n=0
set /a tenPower=1

set /p runorno=是否执行？？

:POWER
set /a tenPower*=10
set /a n+=1
if %n% lss %findLength% goto POWER
set /a start+=%tenPower%

echo.>RenameLog.txt
setlocal ENABLEDELAYEDEXPANSION
for /f "tokens=*" %%i in ('dir /ad /b /s "%~dp0"') do (
	set dirName=%%~nxi
	if "!dirName:~0,%findIndex%!" equ "%findStr%" (
		set  dirNum=1!dirName:~%findIndex%,%findLength%!
		set /a starIdx=^(!dirNum!-%start%^)^%%diff%
		set /a starIdx=!dirNum!-!starIdx!
		set /a endIdx=!starIdx!+%diff%-1
		set dirName=%startStr%!starIdx:~1!-!endIdx:~1!
		if NOT EXIST !dirName! (
			md !dirName!
			echo.
			echo -----创建了!dirName!文件夹----->>RenameLog.txt
		)
		for /f "tokens=*" %%j in ('dir /a-d /b /s "%%i\*.*"') do (
			move "%%j" !dirName! >nul
			set tmpStr=%%~nxj ^>^>^>^> !dirName!
			echo !tmpStr!&title !tmpStr!
			echo !tmpStr!>>RenameLog.txt
		)
		rmdir "%%i" >nul&echo %%i目录不为空，无法删除>>RenameLog.txt
	)
)
set dirName=
set dirNum=
set starIdx=
set endIdx=
set tmpStr=
setlocal DISABLEDELAYEDEXPANSION

set start=
set diff=
set startStr=
set findStr=
set findIndex=
set findLength=
set n=
set tenPower=
set runorno=
pause

::echo !fileName!|findstr "%dirMstr%">nul
::if !errorlevel! equ 0 (