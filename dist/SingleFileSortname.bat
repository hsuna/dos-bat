@echo off&title �ļ���������������

set /p index=�����ȡ����(Ĭ��1)��
set /p length=�����ȡ����(Ĭ��3)��
if "%index%" == "" (
	set index=1
) else (
	set /a index=%index%
)
if "%length%" == "" (
	set length=3
) else (
	set /a length=%length%
	if "%length%" == "0" set length=3
)

setlocal ENABLEDELAYEDEXPANSION
set fileName=""
set /a n=%index%
set strn=!n!
for /R "%~dp0" %%s in (*) do ( 
	if "%%~xs" neq ".bat" (
		set fileName=%%~ns
		if !n! lss 10 (
			set strn=00!n!
		) else if !n! lss 100 (
			set strn=0!n!
		) else (
			set strn=!n!
		)
		set fileName=!fileName:~,-%length%!!strn!%%~xs
		echo %%~nxs --^> !fileName!
		rename %%s !fileName!
		set /a n=!n!+1
	)
) 
set n=
set strn=
set fileName=
setlocal DISABLEDELAYEDEXPANSION
::rename %%s !fileName!
set index=
set length=
pause