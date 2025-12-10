@echo off

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Please install Python and try again.
    exit /b 1
)

echo Upgrading ultralytics package...

REM Upgrade ultralytics package
pip install --upgrade ultralytics

REM Check if the upgrade was successful
if %errorlevel% neq 0 (
    echo Upgrade failed.
    exit /b %errorlevel%
) else (
    echo Upgrade completed successfully.
)

pause
