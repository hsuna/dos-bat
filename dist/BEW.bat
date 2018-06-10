:: 巽蓝工作室
:: 作者：Jerry
:: 版权所有
:: 2014-04-21

@echo off
cls

color 0A
title 网站大全

echo.
echo          ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
echo          ☆ ========================================== ★
echo          ★ ===========╔════════╗=========== ☆
echo          ☆ ===========║╔══════╗║=========== ★
echo          ★ ===========║║  网站大全  ║║=========== ☆
echo          ☆ ===========║╚══════╝║=========== ★
echo          ★ ===========╚════════╝=========== ☆
echo          ☆ ========================================== ★
echo          ★ 1、淘宝网                                  ☆
echo          ☆ 2、前程无忧                                ★
echo          ★ 3、智联招聘                                ☆
echo          ☆ 4、网盘                                    ★
echo          ★ 5、邪恶的小调                              ☆
echo          ☆ 6、斗鱼                                    ★
echo          ★ 7、Child Of Light                          ☆
echo          ☆ 0、退出                                    ★
echo          ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
echo.

::切换到当前路径
C:
cd "Program Files (x86)\Google\Chrome\Application"

:RESET
::选择网站
set /p selectNum=^>^>^>^>^>^>请选择网站(0则退出)：

if 1==%selectNum% (
	start chrome.exe "www.taobao.com"
	goto ENDBAT
)
if 2==%selectNum% (
	start chrome.exe "my.51job.com/my/68026606/My_Pmc.php"
	goto ENDBAT
)
if 3==%selectNum% (
	start chrome.exe "www.zhaopin.com"
	goto ENDBAT
)
if 4==%selectNum% (
	start chrome.exe "http://pan.baidu.com/disk/home#from=share_pan_logo"
	goto ENDBAT
)
if 5==%selectNum% (
	start chrome.exe "i.youku.com/u/UMTE0NDEzOTky"
	goto ENDBAT
)
if 6==%selectNum% (
	start chrome.exe "www.douyutv.com"
	goto ENDBAT
)
if 7==%selectNum% (
	start chrome.exe "www.baidu.com"
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