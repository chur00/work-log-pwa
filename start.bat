@echo off
chcp 65001 >nul
echo ============================================
echo   日常工作记录 PWA 本地服务器
echo ============================================
echo.
echo 使用方法：
echo   1. 确保手机和电脑连接同一个 WiFi
echo   2. 浏览器打开以下任一地址
echo.
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    set ip=%%a
    goto :found
)
:found
set ip=%ip:~1%
echo   桌面端: http://localhost:8080
echo   手机端: http://%ip%:8080
echo.
echo 按 Ctrl+C 停止服务器
echo ============================================
echo.
python -m http.server 8080
