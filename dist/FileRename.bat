@echo off&title �����ļ�������
set /p index=�����ȡ����(Ĭ��0)��
set /p length=�����ȡ����(Ĭ��3)��
set /p leftstr=������߲����ı���
set /p rightstr=�����ұ߲߱����ı���
if "%index%" == "" (
	set /a index=0 
) else (
	set /a index=%index%
)
if "%length%" == "" (
	set /a length=3
) else (
	set /a length=%length%
	if "%length%" == "0" set length=3
)
echo index::%index%   length=%length%
setlocal ENABLEDELAYEDEXPANSION
set fileName=""
for /R "%~dp0" %%s in (*) do ( 
	if "%%~xs" neq ".bat" (
		set fileName=%%~ns
		set fileName=%leftstr%!fileName:~%index%,%length%!%rightstr%%%~xs
		echo %%~nxs --^> !fileName!
		rename "%%s" !fileName!
	)
) 
set fileName=
setlocal DISABLEDELAYEDEXPANSION
set index=
set length=
set leftstr=
set rightstr=
pause