@echo off
openfiles >nul 2>nul
if %errorlevel% neq 0 (
    echo This script is not running as Administrator. Re-launching with admin privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb runAs"
    exit /b
)

pushd "%~dp0"

cd /d "%~dp0relapse-timestamper"
start "" "%cd%\relapse-timestamper.exe"

cd /d "%~dp0"

echo.
set /p "file_path=[-] file path: "
for %%I in ("%file_path%") do set "file_name=%%~nxI"
echo ok, using: %file_path%

echo.
"%cd%\relapse-signer.exe" -verification -certificate "%cd%\Take-TwoInteractiveSoftware.pfx" -password "CRAPwh@ckIT" -file "%file_path%"

echo done signing: %file_name%
pause
