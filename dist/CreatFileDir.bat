@echo off&title �����ļ���������

set /p start=���뿪ʼ����(Ĭ��100)��
set /p length=�����ȡ����(Ĭ��10)��
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
	echo ������%fileDir%�ļ���
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