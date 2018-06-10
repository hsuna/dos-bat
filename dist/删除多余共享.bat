:: 巽蓝工作室
:: 作者：Jerry
:: 版权所有
:: 2015-05-03

@echo off
cls

color 0A
title 删除多余共享

net share C$ /DELETE
net share D$ /DELETE
net share E$ /DELETE
net share F$ /DELETE
net share ADMIN$ /DELETE

net share

pause