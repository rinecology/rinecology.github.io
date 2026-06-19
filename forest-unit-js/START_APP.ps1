# Forest Unit Analysis Tool - Web App Launcher
# Double-click to run (or right-click -> Run with PowerShell)

Write-Host "============================================" -ForegroundColor Green
Write-Host "Forest Unit Analysis Tool - Web App" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Starting local web server..." -ForegroundColor Yellow
Write-Host ""

# Check for Python
$pythonExists = Get-Command python -ErrorAction SilentlyContinue

if ($pythonExists) {
    Write-Host "Using Python HTTP Server..." -ForegroundColor Cyan
    Write-Host "Opening browser at: http://localhost:8000/index.html" -ForegroundColor Green
    Write-Host ""
    Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""
    
    # Open browser to index.html
    Start-Process "http://localhost:8000/index.html"
    
    # Start server
    python -m http.server 8000
}
else {
    # Check for npx
    $npxExists = Get-Command npx -ErrorAction SilentlyContinue
    
    if ($npxExists) {
        Write-Host "Using npx serve..." -ForegroundColor Cyan
        Write-Host "Browser will open automatically to the app" -ForegroundColor Green
        Write-Host ""
        Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
        Write-Host "============================================" -ForegroundColor Green
        Write-Host ""
        
        # npx serve with single page app support
        npx serve -l 8000 -s
    }
    else {
        Write-Host "ERROR: Neither Python nor Node.js found!" -ForegroundColor Red
        Write-Host ""
        Write-Host "Please install one of the following:" -ForegroundColor Yellow
        Write-Host "  - Python 3: https://www.python.org/downloads/" -ForegroundColor Cyan
        Write-Host "  - Node.js: https://nodejs.org/" -ForegroundColor Cyan
        Write-Host ""
        Read-Host "Press Enter to exit"
    }
}
