:: ����������
:: ���ߣ�Jerry
:: ��Ȩ����
:: 2014-12-10

@echo off
cls

color 0A
title �ػ�����

echo.
echo          �������������������
echo          �� ============================== ��
echo          �� =====�X�T�T�T�T�T�T�T�T�[===== ��
echo          �� =====�U�X�T�T�T�T�T�T�[�U===== ��
echo          �� =====�U�U  �ػ�����  �U�U===== ��
echo          �� =====�U�^�T�T�T�T�T�T�a�U===== ��
echo          �� =====�^�T�T�T�T�T�T�T�T�a===== ��
echo          �� ============================== ��
echo          �� 1���ػ������                  ��
echo          �� 2�����������                  ��
echo          �� 3�����߼����                  ��
echo          �� 4����ʱ�����                  ��
echo          �� 9��ȡ����ʱ�����              ��
echo          �� 0���˳�                        ��
echo          �������������������
echo.

:RESET
::ѡ���������
set /p selectNum=^>^>^>^>^>^>��ѡ�����(0���˳�)��

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
	echo "����������������룡"
	echo.
	goto RESET
)

:SETTIME
echo.
set /p tiameNum=^>^>^>^>^>^>������ر�ʱ��^(��λ^/��^)��
shutdown /s /t %tiameNum%
goto ENDBAT

:ENDBAT
exit