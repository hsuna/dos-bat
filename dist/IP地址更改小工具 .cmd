
@echo off 
cls&color 0A 

echo IP��ַ����С���� 
set IP=192.168.100.104
set MASK=255.255.255.0 
set GATEWAY=192.168.100.254
set NAME="��������" 
set DNS=202.96.128.86
set DNS2=114.114.114.114


echo. 
echo �Զ�����IP �밴 1 
echo. 
echo �ֶ�����IP �밴 2 

set /p KEY= [����ѡ���ǣ�] 
if %KEY% == 1 goto ONE 
if %KEY% == 2 goto TWO 

:TWO 
ECHO ��ѡ�����ֹ��޸����á� 
ECHO. 
echo Ĭ��IP��ַ��%IP%���س�����Ĭ�ϵ�ַ 
set /p IP= [������IP��ַ:] 
echo. 
echo Ĭ��MASK��%MASK%���س�����Ĭ��ֵ 
set /p MASK= [������ �������� ��ַ:] 
echo. 
echo Ĭ��GATEWAY��%GATEWAY%���س�����Ĭ��ֵ 
set /p GATEWAY= [������ ���� ��ַ:] 
echo. 
echo Ĭ��DNS��%DNS%���س�����Ĭ��ֵ 
set /p DNS= [������ DNS ��ַ:] 
echo. 
echo Ĭ�ϱ���DNS��%DNS2%���س�����Ĭ��ֵ 
set /p DNS2= [������ ����DNS ��ַ:] 
echo. 

:ONE 
echo �����Զ�����IP...... 
netsh interface ip set address %NAME% static %IP% %MASK% %GATEWAY% >nul
netsh interface ip add dns %NAME% %DNS% index=1 >nul 
netsh interface ip add dns %NAME% %DNS2% index=2 >nul 
echo IP��ַ/��������/����/DNS������� 
pause 