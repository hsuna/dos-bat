@echo off&title ����Ŀ¼
cls&ping 0 -n "3">nul
for /f "delims=" %%a in ('dir /ad/s/b') do (
    dir /a-d/s/b "%%~a\*" >nul 2>nul
    if errorlevel 1 (
        echo ���ļ���: ��%%~a��Ϊ��
    )
)
pause
exit