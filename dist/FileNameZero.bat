@echo off&title �����ļ���������
for /R "%~dp0" %%s in (*) do ( 
	if "%%~xs" neq ".bat" (
		echo %%~ns0%%~xs
		
	)
) 
::rename %%s %%~ns0%%~xs
pause