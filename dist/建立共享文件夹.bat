:: ���������ļ��в����ɹ���ӳ��ű�
:: С�㹤����
:: author Jerry
:: 2014-3-23

@echo off

cls
color 3F
title ���������ļ���

echo.
echo            ������������������������
echo            ��             ���������ļ���               ��
echo            ��                                          ��
echo            ��    �ù�����ѡ��ĳ���ļ���������������  ��
echo            �� �����û�ͨ��Guest��ݷ��ʸ��ļ�����ѡ��  ��
echo            �� ������                                   ��
echo            ��                                          ��
echo            �� 1���Զ���װ(�û�ΪGuest, ����Ϊ123456)   ��
echo            �� 2���û������Զ���                        ��
echo            �� 3����ȫ�Զ��尲װ                        ��
echo            �� 0���˳�                                  ��
echo            ��                                          ��
echo            ������������������������
echo.

::ѡ��װ��ʽ

set /p selectNum=^>^>^>^>^>��ѡ��װ��ʽ(Ĭ��1)��

if "%selectNum%"=="2" (
echo ѡ���û������Զ���
goto NORM
)
if "%selectNum%"=="3" (
echo ѡ����ȫ�Զ��尲װ
goto CUSTOM
)
if "%selectNum%"=="0" (
exit
)
echo ѡ���Զ���װ(�û�ΪGuest, ����Ϊ123456) 
goto AUTO

:: ���������û�

:: �Զ���װ
:AUTO

set shareName=Guest
set sharePass=123456
goto SELECTA

:: �û������Զ���
:NORM

set /p shareName=�������û���(Ĭ��share)��
if "%shareName%" == "" set shareName=share
set /p sharePass=����������(share)��
if "%sharePass%" == "" set sharePass=share
goto SELECTA

:: ��ȫ�Զ��尲װ
:CUSTOM

set /p shareName=�������û���(Ĭ��share)��
if "%shareName%" == "" set shareName=share
set /p sharePass=����������(share)��
if "%sharePass%" == "" set sharePass=share

:SELECTA

net user %shareName% /add >nul
net user %shareName% %sharePass%
net user %shareName% /active:yes
net user %shareName% /expires:never
net user %shareName% /passwordchg:no

net localgroup guests %shareName% /add >nul
net localgroup users %shareName% /delete >nul

echo -----------���������û��ɹ�������----------------
echo.

::���������ļ���

if not "%selectNum%"=="3" (
goto SELECTB
)

set /p shareFilePath=�����빲���ļ���·��(Ĭ��D:\shareFile)��
set /p shareFileName=�����빲���ļ�����(Ĭ��shareFile)��

:SELECTB

if "%shareFilePath%" == "" set shareFilePath=D:\shareFile
if "%shareFileName%" == "" set shareFileName=shareFile

md %shareFilePath% >nul
net share %shareFileName%=%shareFilePath% /grant:%shareName%,full
cacls %shareFilePath% /t /e /c /g %shareName%:F

echo -----------���������ļ���%shareFileName%�ɹ�������----------------
echo.

::�޸�ע���

echo Windows Registry Editor Version 5.00 >tmptmp.reg
echo ����-�����˻��Ĺ���Ͱ�ȫģ��Ϊ����
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>tmptmp.reg
echo "forceguest"=dword:00000000 >>tmptmp.reg
echo ����-ʹ�ÿհ�����ı����˻�ֻ������п���̨��¼Ϊ����
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >>tmptmp.reg
echo "limitblankpassworduse"=dword:00000000 >>tmptmp.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Lsa] >>tmptmp.reg
echo "limitblankpassworduse"=dword:00000000 >>tmptmp.reg
regedit /s tmptmp.reg
del /q /f tmptmp.reg >nul

echo -----------�޸�ע���ɹ�������----------------
echo.

::�޸������Ȩ��

echo [version] >sec.inf
echo signature = "$CHICAGO$" >>sec.inf
echo [Privilege Rights] >>sec.inf
::ȥ�����ܾ����ص�¼��Ȩ��
::echo SeInteractiveLogonRight = >>sec.inf
::ȥ�����ܾ������¼��Ȩ��
echo SeDenyNetworkLogonRight = >>sec.inf
secedit /configure /db sec.sdb /cfg sec.inf /log sec.log /quiet
del /q /f sec.* >nul

echo -----------�޸������Ȩ�޳ɹ�������----------------
echo.

cls
echo.
echo ==================================
echo          ���ñ�������IP
echo ==================================
echo.
::ѡ����Ip
set selectIp=127.0.0.1
ipconfig|find "IPv4" >tmptmp.txt
setlocal ENABLEDELAYEDEXPANSION
set n=1
for /f "delims=" %%a in (tmptmp.txt) do (
echo   !n!��!%%a!
set /a n=!n!+1
)

echo.
set /p selectNum=^>^>^>^>^>��ѡ�񱾻��Ĺ���Ip(Ĭ��Ϊ127.0.0.1)��
set n=1
for /f "delims=" %%a in (tmptmp.txt) do (
if "!n!"=="%selectNum%" set selectIp=!%%a!&goto SELECTIP
set /a n=!n!+1
)

:SELECTIP

::ȥ���ַ���ǰ��ո�
:INTERCEPT_LEFT
if "%selectIp:~0,1%"==" " set "selectIp=%selectIp:~1%"&goto INTERCEPT_LEFT
:INTERCEPT_RIGHT
if "%selectIp:~-1%"==" " set "selectIp=%selectIp:~0,-1%"&goto INTERCEPT_RIGHT

del /q /f tmptmp.txt >nul
set n=
setlocal DISABLEDELAYEDEXPANSION

echo -----------ѡ����IP�ɹ�������----------------
echo.

::����ӳ���ݽ����ű�

echo ��������ӳ���ݽ����ű�
cd %~dp0
echo :: ����ӳ���ݽű�>creatShareLink.bat
echo :: С�㹤����>>creatShareLink.bat
echo :: author Jerry>>creatShareLink.bat
echo :: 2014-4-18>>creatShareLink.bat
echo.>>creatShareLink.bat
echo @echo off >>creatShareLink.bat
echo.>>creatShareLink.bat
echo cls>>creatShareLink.bat
echo color 3F>>creatShareLink.bat
echo title ����ӳ���ݽű�>>creatShareLink.bat
echo. >>creatShareLink.bat
echo cd %%^~d0>>creatShareLink.bat
echo cd %%^~dp0>>creatShareLink.bat
echo echo [InternetShortcut]^>shareLink.url >>creatShareLink.bat
echo echo URL=\\%selectIp%\^>^>shareLink.url >>creatShareLink.bat
echo echo IconIndex=0^>^>shareLink.url >>creatShareLink.bat
echo echo IconFile=%~f2^>^>shareLink.url >>creatShareLink.bat
move creatShareLink.bat %shareFilePath%

echo -----------����ӳ���ݽű��ɹ�������---------------------
echo.
echo --------ʹ��creatShareLink.bat�ļ��ڵ��Դ�������----------
echo.

::����������Ϣ

echo ���ڵ���������Ϣ
echo ����������Ϣ,�����ǵ�ɾ������~ >settingInfo.txt
echo ����Ҫ�޸����룬�뵽���������-^>������-^>���������-^>ϵͳ����-^>�����û�����-^>�û������޸�~ >>settingInfo.txt
echo. >>settingInfo.txt
echo �����û�����%shareName% >>settingInfo.txt
echo �������룺%sharePass% >>settingInfo.txt
echo �����ļ���·����%shareFilePath% >>settingInfo.txt
echo �����ļ�������%shareFileName% >>settingInfo.txt
move settingInfo.txt %shareFilePath%

echo -----------����������Ϣ�ɹ�������---------------------
echo.

explorer %shareFilePath%

::pause >nul

set selectIp=
set selectNum=
set shareName=
set sharePass=
set shareFilePath=
set shareFileName=