:: ����������
:: ���ߣ�Jerry
:: ��Ȩ����
:: 2015-05-11

@echo off&cls
color 0A&title ɾ��QQӦ��

echo.
echo          ���������������������
echo          �� ================================== ��
echo          �� =========== ɾ��QQӦ�� =========== ��
echo          �� ================================== ��
echo          �� 1��QQ����                          ��
echo          �� 2����                              ��
echo          �� 4����                              ��
echo          �� 8����                              ��
echo          �� 0���˳�                            ��
echo          ���������������������
echo.

set /p sum=^>^>^>^>^>^>��ѡ����ɾ����Ӧ��(0���˳���֧�ֶ�ѡ)��
set /a n=0

:SELECT
set /a select=sum^>^>n
if 0==%select% (
	goto ENDBAT
)

set /a n=n+1
set /a select=sum^&(n^<^<1)
if 1==%select% (
	set filePath=%~dp0Plugin\Com.Tencent.NetBar\Bin\NetBar.dll
)
if 2==%select% (
	set filePath=
)
if 4==%select% (
	set filePath=
)
if 8==%select% (
	set filePath=
)
if EXIST %filePath% (
		cacls %filePath% /T /E /C /D Administrators
		cacls %filePath% /T /E /C /D Users
)
goto SELECT

:ENDBAT
set n=
set sum=
set select=
set filePath=

::pause
exit