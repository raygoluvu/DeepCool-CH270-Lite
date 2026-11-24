@echo off
setlocal
echo ========================================================
echo  DeepCool CH270 Lite - Build
echo ========================================================
echo.

set CSC=C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe

if not exist "%CSC%" (
    echo [ERROR] .NET Framework 4.0+ compiler was not found.
    pause
    exit /b 1
)

echo [1/2] Building control panel (CH270.exe)...
"%CSC%" /target:winexe /optimize+ /codepage:65001 /out:CH270.exe CH270.cs
if %errorlevel% neq 0 (
    echo [ERROR] CH270.exe build failed.
    pause
    exit /b %errorlevel%
)
echo [OK] CH270.exe built successfully.

echo [2/2] Building display service (CH270.Service.exe)...
"%CSC%" /target:winexe /optimize+ /codepage:65001 /out:CH270.Service.exe CH270.Service.cs
if %errorlevel% neq 0 (
    echo [ERROR] CH270.Service.exe build failed.
    pause
    exit /b %errorlevel%
)
echo [OK] CH270.Service.exe built successfully.

echo.
echo ========================================================
echo  Build complete. Run CH270.exe to start the application.
echo ========================================================
pause
