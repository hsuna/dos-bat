:: 巽蓝工作室
:: 作者：Jerry
:: 版权所有
:: 2014-04-21

@echo off
cls

color 0A
title 游戏大全

echo.
echo          ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
echo          ☆ ========================================== ★
echo          ★ ===========╔════════╗=========== ☆
echo          ☆ ===========║╔══════╗║=========== ★
echo          ★ ===========║║  游戏大全  ║║=========== ☆
echo          ☆ ===========║╚══════╝║=========== ★
echo          ★ ===========╚════════╝=========== ☆
echo          ☆ ========================================== ★
echo          ★ 1、Warcraft III(魔兽3)                     ☆
echo          ☆ 2、Battle.net(战网)                        ★
echo          ★ 3、Platform(魔兽对战平台)                  ☆
echo          ☆ 4、Virtuanes(红白机)                       ★
echo          ★ 5、Winkawaks(拳皇)                         ☆
echo          ☆ 6、Fire Emblem(火焰勋章)                   ★
echo          ★ 7、Child Of Light                          ☆
echo          ☆ 8、PAL4(仙剑4)                             ★
echo          ★ 0、退出                                    ☆
echo          ☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★
echo.

:RESET
::选择游戏
set /p selectNum=^>^>^>^>^>^>请选择游戏(0则退出)：

if 1==%selectNum% (
	start F:Games\Warcra~1\war3.exe
	goto ENDBAT
)
if 2==%selectNum% (
	start F:\Games\Battle.net\Battle~1.exe
	goto ENDBAT
)
if 3==%selectNum% (
	start F:\Games\魔兽争霸官方对战平台\Platform.exe
	goto ENDBAT
)
if 4==%selectNum% (
	start F:Games\Virtuanes\VirtuaNES.exe
	goto ENDBAT
)
if 5==%selectNum% (
	F:
	cd Games\WINKAW~1.58C
	start WinKawaks.exe
	goto ENDBAT
)
if 6==%selectNum% (
	start F:Games\FIREEM~1\snes9x.exe
	goto ENDBAT
)
if 7==%selectNum% (
	start F:Games\CHILDO~1.HD\CHILDO~1\ChildofLight.exe
	goto ENDBAT
)
if 8==%selectNum% (
	F:
	cd Games\PAL4
	start PAL4a.exe
	goto ENDBAT
)
if 0==%selectNum% (
goto ENDBAT
) else ( 
	echo "输入错误！请重新输入！"
	echo.
	goto RESET
)

:ENDBAT
exit