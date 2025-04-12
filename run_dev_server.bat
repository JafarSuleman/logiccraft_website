@echo off
echo LogicCraft Website - Development Server
echo ---------------------------------

REM Check if flutter is installed
where flutter >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Flutter is not installed or not in PATH.
    echo Please install Flutter from https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

echo Starting Flutter Web Development Server...
echo.
echo Your website will be available at: http://localhost:8080
echo.
echo Press Ctrl+C to stop the server.
echo.

flutter run -d web-server --web-port 8080

pause 