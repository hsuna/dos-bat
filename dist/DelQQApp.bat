:: 巽蓝工作室
:: 作者：Jerry
:: 版权所有
:: 2015-05-11

@echo off&cls
color 0A&title 删除QQ应用

echo.
echo          ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
echo          ☆ ================================== ★
echo          ★ =========== 删除QQ应用 =========== ☆
echo          ☆ ================================== ★
echo          ★ 1、QQ网吧                          ☆
echo          ☆ 2、无                              ★
echo          ★ 4、无                              ☆
echo          ☆ 8、无                              ★
echo          ★ 0、退出                            ☆
echo          ☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★
echo.

set /p sum=^>^>^>^>^>^>请选择需删除的应用(0则退出，支持多选)：
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