:: 巽蓝工作室
:: 作者：Jerry
:: 版权所有
:: 2015-03-02

@echo off
cls

color 0A
title 删除通知区域没用的图标

::删除HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify下的IconStreams和PastIconsStream
echo Windows Registry Editor Version 5.00 >tmp.reg 
echo [HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify] >>tmp.reg 
echo "IconStreams"=- >>tmp.reg 
echo "PastIconsStream"=- >>tmp.reg 
regedit /s tmp.reg
del /q /f tmp.reg >nul

::重启任务管理器explorer.exe进程
tskill explorer