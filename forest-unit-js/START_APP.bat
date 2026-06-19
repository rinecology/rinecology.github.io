@echo off
echo ============================================
echo Forest Unit Analysis Tool - Web App
echo ============================================
echo.
echo Starting local web server...
echo.
echo The app will open at: http://localhost:8000
echo.
echo Press Ctrl+C to stop the server
echo ============================================
echo.

REM Try Python first
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Using Python HTTP Server...
    start http://localhost:8000/index.html
    python -m http.server 8000
) else (
    echo Python not found. Trying npx...
    where npx >nul 2>nul
    if %ERRORLEVEL% EQU 0 (
        echo Using npx serve...
        echo Browser will open automatically...
        npx serve -l 8000 -s
    ) else (
        echo.
        echo ERROR: Neither Python nor Node.js found!
        echo.
        echo Please install one of the following:
        echo   - Python 3: https://www.python.org/downloads/
        echo   - Node.js: https://nodejs.org/
        echo.
        pause
    )
)
