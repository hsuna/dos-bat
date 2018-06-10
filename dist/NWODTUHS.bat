:: 巽蓝工作室
:: 作者：Jerry
:: 版权所有
:: 2014-12-10

@echo off
cls

color 0A
title 关机命令

echo.
echo          ★☆★☆★☆★☆★☆★☆★☆★☆★☆
echo          ☆ ============================== ★
echo          ★ =====╔════════╗===== ☆
echo          ☆ =====║╔══════╗║===== ★
echo          ★ =====║║  关机命令  ║║===== ☆
echo          ☆ =====║╚══════╝║===== ★
echo          ★ =====╚════════╝===== ☆
echo          ☆ ============================== ★
echo          ★ 1、关机计算机                  ☆
echo          ☆ 2、重启计算机                  ★
echo          ★ 3、休眠计算机                  ☆
echo          ☆ 4、定时计算机                  ★
echo          ★ 9、取消定时计算机              ☆
echo          ☆ 0、退出                        ★
echo          ★☆★☆★☆★☆★☆★☆★☆★☆★☆
echo.

:RESET
::选择操作类型
set /p selectNum=^>^>^>^>^>^>请选择操作(0则退出)：

if 1==%selectNum% (
	shutdown /s
	goto ENDBAT
)
if 2==%selectNum% (
	shutdown /r
	goto ENDBAT
)
if 3==%selectNum% (
	shutdown /h
	goto ENDBAT
)
if 4==%selectNum% (
    goto SETTIME
)
if 5==%selectNum% (
	shutdown /a
	goto ENDBAT
)
if 0==%selectNum% (
	goto ENDBAT
) else ( 
	echo "输入错误！请重新输入！"
	echo.
	goto RESET
)

:SETTIME
echo.
set /p tiameNum=^>^>^>^>^>^>请输入关闭时间^(单位^/秒^)：
shutdown /s /t %tiameNum%
goto ENDBAT

:ENDBAT
exit