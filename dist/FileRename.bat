@echo off&title 批量文件名处理
set /p index=输入截取索引(默认0)：
set /p length=输入截取长度(默认3)：
set /p leftstr=输入左边插入文本：
set /p rightstr=输入右边边插入文本：
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