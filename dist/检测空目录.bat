@echo off&title 检测空目录
cls&ping 0 -n "3">nul
for /f "delims=" %%a in ('dir /ad/s/b') do (
    dir /a-d/s/b "%%~a\*" >nul 2>nul
    if errorlevel 1 (
        echo 空文件夹: “%%~a”为空
    )
)
pause
exit