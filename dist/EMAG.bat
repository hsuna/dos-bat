:: ����������
:: ���ߣ�Jerry
:: ��Ȩ����
:: 2014-04-21

@echo off
cls

color 0A
title ��Ϸ��ȫ

echo.
echo          �������������������������
echo          �� ========================================== ��
echo          �� ===========�X�T�T�T�T�T�T�T�T�[=========== ��
echo          �� ===========�U�X�T�T�T�T�T�T�[�U=========== ��
echo          �� ===========�U�U  ��Ϸ��ȫ  �U�U=========== ��
echo          �� ===========�U�^�T�T�T�T�T�T�a�U=========== ��
echo          �� ===========�^�T�T�T�T�T�T�T�T�a=========== ��
echo          �� ========================================== ��
echo          �� 1��Warcraft III(ħ��3)                     ��
echo          �� 2��Battle.net(ս��)                        ��
echo          �� 3��Platform(ħ�޶�սƽ̨)                  ��
echo          �� 4��Virtuanes(��׻�)                       ��
echo          �� 5��Winkawaks(ȭ��)                         ��
echo          �� 6��Fire Emblem(����ѫ��)                   ��
echo          �� 7��Child Of Light                          ��
echo          �� 8��PAL4(�ɽ�4)                             ��
echo          �� 0���˳�                                    ��
echo          �������������������������
echo.

:RESET
::ѡ����Ϸ
set /p selectNum=^>^>^>^>^>^>��ѡ����Ϸ(0���˳�)��

if 1==%selectNum% (
	start F:Games\Warcra~1\war3.exe
	goto ENDBAT
)
if 2==%selectNum% (
	start F:\Games\Battle.net\Battle~1.exe
	goto ENDBAT
)
if 3==%selectNum% (
	start F:\Games\ħ�����Թٷ���սƽ̨\Platform.exe
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
	echo "����������������룡"
	echo.
	goto RESET
)

:ENDBAT
exit