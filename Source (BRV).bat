@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Portable apps\BatteryHealthViewer.exe
REM BFCPEICON=C:\Users\Kamil Haroon\Desktop\Battery report viewer\NEW icon.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=BatteryReportViewer -Kamil Haroon
REM BFCPEVERDESC=A tool to quickly view battery report
REM BFCPEVERCOMPANY=Kamil Haroon
REM BFCPEVERCOPYRIGHT=Open-Source
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=30
REM BFCPEWINDOWWIDTH=120
REM BFCPEWTITLE=Window Title
REM BFCPEOPTIONEND
@echo off
color 0A
title Battery Report

:: Resize the CMD window
mode con: cols=60 lines=18

echo.
echo  =========================================
echo               Battery Report   
echo  =========================================
echo.

:: Output path
set "report=%USERPROFILE%\Documents\battery-report.html"

echo   - Generating report...
powercfg /batteryreport /output "%report%" >nul 2>&1

if errorlevel 1 (
    echo   - ERROR: Run this script as Administrator.
    exit /b 1
)

echo   - Opening in browser...
start "" "%report%"

exit /b
