
@echo off 
cls&color 0A 

echo IP地址更改小工具 
set IP=192.168.100.104
set MASK=255.255.255.0 
set GATEWAY=192.168.100.254
set NAME="本地连接" 
set DNS=202.96.128.86
set DNS2=114.114.114.114


echo. 
echo 自动更改IP 请按 1 
echo. 
echo 手动更改IP 请按 2 

set /p KEY= [您的选择是：] 
if %KEY% == 1 goto ONE 
if %KEY% == 2 goto TWO 

:TWO 
ECHO 您选择了手工修改设置。 
ECHO. 
echo 默认IP地址是%IP%，回车输入默认地址 
set /p IP= [请输入IP地址:] 
echo. 
echo 默认MASK是%MASK%，回车输入默认值 
set /p MASK= [请输入 子网掩码 地址:] 
echo. 
echo 默认GATEWAY是%GATEWAY%，回车输入默认值 
set /p GATEWAY= [请输入 网关 地址:] 
echo. 
echo 默认DNS是%DNS%，回车输入默认值 
set /p DNS= [请输入 DNS 地址:] 
echo. 
echo 默认备用DNS是%DNS2%，回车输入默认值 
set /p DNS2= [请输入 备用DNS 地址:] 
echo. 

:ONE 
echo 正在自动更改IP...... 
netsh interface ip set address %NAME% static %IP% %MASK% %GATEWAY% >nul
netsh interface ip add dns %NAME% %DNS% index=1 >nul 
netsh interface ip add dns %NAME% %DNS2% index=2 >nul 
echo IP地址/子网掩码/网关/DNS设置完成 
pause 