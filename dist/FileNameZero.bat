@echo off&title 批量文件名排序处理
for /R "%~dp0" %%s in (*) do ( 
	if "%%~xs" neq ".bat" (
		echo %%~ns0%%~xs
		
	)
) 
::rename %%s %%~ns0%%~xs
pause