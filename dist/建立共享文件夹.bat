:: 建立共享文件夹并生成共享映射脚本
:: 小巽工作室
:: author Jerry
:: 2014-3-23

@echo off

cls
color 3F
title 建立共享文件夹

echo.
echo            ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★
echo            ☆             建立共享文件夹               ☆
echo            ★                                          ★
echo            ☆    该功能是选择某个文件建立共享，让其他  ☆
echo            ★ 网络用户通过Guest身份访问该文件，请选择  ★
echo            ☆ 操作：                                   ☆
echo            ★                                          ★
echo            ☆ 1、自动安装(用户为Guest, 密码为123456)   ☆
echo            ★ 2、用户密码自定义                        ★
echo            ☆ 3、完全自定义安装                        ☆
echo            ★ 0、退出                                  ★
echo            ☆                                          ☆
echo            ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★
echo.

::选择安装方式

set /p selectNum=^>^>^>^>^>请选择安装方式(默认1)：

if "%selectNum%"=="2" (
echo 选择：用户密码自定义
goto NORM
)
if "%selectNum%"=="3" (
echo 选择：完全自定义安装
goto CUSTOM
)
if "%selectNum%"=="0" (
exit
)
echo 选择：自动安装(用户为Guest, 密码为123456) 
goto AUTO

:: 创建共享用户

:: 自动安装
:AUTO

set shareName=Guest
set sharePass=123456
goto SELECTA

:: 用户密码自定义
:NORM

set /p shareName=请输入用户名(默认share)：
if "%shareName%" == "" set shareName=share
set /p sharePass=请输入密码(share)：
if "%sharePass%" == "" set sharePass=share
goto SELECTA

:: 完全自定义安装
:CUSTOM

set /p shareName=请输入用户名(默认share)：
if "%shareName%" == "" set shareName=share
set /p sharePass=请输入密码(share)：
if "%sharePass%" == "" set sharePass=share

:SELECTA

net user %shareName% /add >nul
net user %shareName% %sharePass%
net user %shareName% /active:yes
net user %shareName% /expires:never
net user %shareName% /passwordchg:no

net localgroup guests %shareName% /add >nul
net localgroup users %shareName% /delete >nul

echo -----------创建共享用户成功！！！----------------
echo.

::创建共享文件夹

if not "%selectNum%"=="3" (
goto SELECTB
)

set /p shareFilePath=请输入共享文件夹路径(默认D:\shareFile)：
set /p shareFileName=请输入共享文件夹名(默认shareFile)：

:SELECTB

if "%shareFilePath%" == "" set shareFilePath=D:\shareFile
if "%shareFileName%" == "" set shareFileName=shareFile

md %shareFilePath% >nul
net share %shareFileName%=%shareFilePath% /grant:%shareName%,full
cacls %shareFilePath% /t /e /c /g %shareName%:F

echo -----------创建共享文件夹%shareFileName%成功！！！----------------
echo.

::修改注册表

echo Windows Registry Editor Version 5.00 >tmptmp.reg
echo 设置-本地账户的共享和安全模型为经典
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>tmptmp.reg
echo "forceguest"=dword:00000000 >>tmptmp.reg
echo 设置-使用空白密码的本地账户只允许进行控制台登录为禁用
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>tmptmp.reg
echo "limitblankpassworduse"=dword:00000000 >>tmptmp.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa] >>tmptmp.reg
echo "limitblankpassworduse"=dword:00000000 >>tmptmp.reg
regedit /s tmptmp.reg
del /q /f tmptmp.reg >nul

echo -----------修改注册表成功！！！----------------
echo.

::修改组策略权限

echo [version] >sec.inf
echo signature = "$CHICAGO$" >>sec.inf
echo [Privilege Rights] >>sec.inf
::去掉“拒绝本地登录”权限
::echo SeInteractiveLogonRight = >>sec.inf
::去掉“拒绝网络登录”权限
echo SeDenyNetworkLogonRight = >>sec.inf
secedit /configure /db sec.sdb /cfg sec.inf /log sec.log /quiet
del /q /f sec.* >nul

echo -----------修改组策略权限成功！！！----------------
echo.

cls
echo.
echo ==================================
echo          设置本机共享IP
echo ==================================
echo.
::选择共享Ip
set selectIp=127.0.0.1
ipconfig|find "IPv4" >tmptmp.txt
setlocal ENABLEDELAYEDEXPANSION
set n=1
for /f "delims=" %%a in (tmptmp.txt) do (
echo   !n!、!%%a!
set /a n=!n!+1
)

echo.
set /p selectNum=^>^>^>^>^>请选择本机的共享Ip(默认为127.0.0.1)：
set n=1
for /f "delims=" %%a in (tmptmp.txt) do (
if "!n!"=="%selectNum%" set selectIp=!%%a!&goto SELECTIP
set /a n=!n!+1
)

:SELECTIP

::去除字符串前后空格
:INTERCEPT_LEFT
if "%selectIp:~0,1%"==" " set "selectIp=%selectIp:~1%"&goto INTERCEPT_LEFT
:INTERCEPT_RIGHT
if "%selectIp:~-1%"==" " set "selectIp=%selectIp:~0,-1%"&goto INTERCEPT_RIGHT

del /q /f tmptmp.txt >nul
set n=
setlocal DISABLEDELAYEDEXPANSION

echo -----------选择共享IP成功！！！----------------
echo.

::生成映射快捷建立脚本

echo 正在生成映射快捷建立脚本
cd %~dp0
echo :: 建立映射快捷脚本>creatShareLink.bat
echo :: 小巽工作室>>creatShareLink.bat
echo :: author Jerry>>creatShareLink.bat
echo :: 2014-4-18>>creatShareLink.bat
echo.>>creatShareLink.bat
echo @echo off >>creatShareLink.bat
echo.>>creatShareLink.bat
echo cls>>creatShareLink.bat
echo color 3F>>creatShareLink.bat
echo title 建立映射快捷脚本>>creatShareLink.bat
echo. >>creatShareLink.bat
echo cd %%^~d0>>creatShareLink.bat
echo cd %%^~dp0>>creatShareLink.bat
echo echo [InternetShortcut]^>shareLink.url >>creatShareLink.bat
echo echo URL=\\%selectIp%\^>^>shareLink.url >>creatShareLink.bat
echo echo IconIndex=0^>^>shareLink.url >>creatShareLink.bat
echo echo IconFile=%~f2^>^>shareLink.url >>creatShareLink.bat
move creatShareLink.bat %shareFilePath%

echo -----------创建映射快捷脚本成功！！！---------------------
echo.
echo --------使用creatShareLink.bat文件在电脑创建链接----------
echo.

::导出设置信息

echo 正在导出设置信息
echo 共享设置信息,看完后记得删除掉它~ >settingInfo.txt
echo 如需要修改密码，请到（控制面板-^>管理工具-^>计算机管理-^>系统工具-^>本地用户和组-^>用户）下修改~ >>settingInfo.txt
echo. >>settingInfo.txt
echo 共享用户名：%shareName% >>settingInfo.txt
echo 共享密码：%sharePass% >>settingInfo.txt
echo 共享文件夹路径：%shareFilePath% >>settingInfo.txt
echo 共享文件夹名：%shareFileName% >>settingInfo.txt
move settingInfo.txt %shareFilePath%

echo -----------导出设置信息成功！！！---------------------
echo.

explorer %shareFilePath%

::pause >nul

set selectIp=
set selectNum=
set shareName=
set sharePass=
set shareFilePath=
set shareFileName=