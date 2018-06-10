@echo off&title 批量文件名排序处理

set /p start=输入开始索引(默认100)：
set /p length=输入截取长度(默认10)：
if "%start%" == "" (
	set /a start=100
) else (
	set /a start=%start%
)
if "%length%" == "" (
	set /a length=10
) else (
	set /a length=%length%
	if "%length%" == "0" set length=10
)
set /a end=%length%*10+%start%

set fileDir=""
set /a n=%start%

:CREAT
set /a e=%n%+%length%-1
set fileDir=vol_%n%-%e%
if NOT EXIST %fileDir% (
	echo 创建了%fileDir%文件夹
	md %fileDir%
)
set /a n=%n%+%length% 
	
if %n% lss %end% goto CREAT

set n=
set e=
set fileDir=
set start=
set length=
set end=
pause