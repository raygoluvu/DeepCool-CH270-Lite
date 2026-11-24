@echo off
chcp 65001 >nul
echo ========================================================
echo  九州風神 CH270 數顯獨立驅動 - 一鍵編譯腳本
echo ========================================================
echo.

set CSC=C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe

if not exist "%CSC%" (
    echo [錯誤] 未在系統中偵測到 .NET Framework 4.0+ 編譯器！
    pause
    exit /b 1
)

echo [1/2] 正在編譯控制面板 UI (CH270.exe)...
"%CSC%" /target:winexe /optimize+ /out:CH270.exe CH270.cs
if %errorlevel% neq 0 (
    echo [錯誤] CH270.exe 編譯失敗！
    pause
    exit /b %errorlevel%
)
echo [完成] CH270.exe 編譯成功！

echo [2/2] 正在編譯背景數顯推送服務 (CH270.Service.exe)...
"%CSC%" /target:winexe /optimize+ /out:CH270.Service.exe CH270.Service.cs
if %errorlevel% neq 0 (
    echo [錯誤] CH270.Service.exe 編譯失敗！
    pause
    exit /b %errorlevel%
)
echo [完成] CH270.Service.exe 編譯成功！

echo.
echo ========================================================
echo  所有元件編譯完成！可直接雙擊 CH270.exe 執行！
echo ========================================================
pause
