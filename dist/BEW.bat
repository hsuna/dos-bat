:: ����������
:: ���ߣ�Jerry
:: ��Ȩ����
:: 2014-04-21

@echo off
cls

color 0A
title ��վ��ȫ

echo.
echo          �������������������������
echo          �� ========================================== ��
echo          �� ===========�X�T�T�T�T�T�T�T�T�[=========== ��
echo          �� ===========�U�X�T�T�T�T�T�T�[�U=========== ��
echo          �� ===========�U�U  ��վ��ȫ  �U�U=========== ��
echo          �� ===========�U�^�T�T�T�T�T�T�a�U=========== ��
echo          �� ===========�^�T�T�T�T�T�T�T�T�a=========== ��
echo          �� ========================================== ��
echo          �� 1���Ա���                                  ��
echo          �� 2��ǰ������                                ��
echo          �� 3��������Ƹ                                ��
echo          �� 4������                                    ��
echo          �� 5��а���С��                              ��
echo          �� 6������                                    ��
echo          �� 7��Child Of Light                          ��
echo          �� 0���˳�                                    ��
echo          �������������������������
echo.

::�л�����ǰ·��
C:
cd "Program Files (x86)\Google\Chrome\Application"

:RESET
::ѡ����վ
set /p selectNum=^>^>^>^>^>^>��ѡ����վ(0���˳�)��

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
	echo "����������������룡"
	echo.
	goto RESET
)

:ENDBAT
exit