@echo off
echo.
echo  ╔══════════════════════════════════╗
echo  ║     VoxMe Studio Launcher        ║
echo  ╚══════════════════════════════════╝
echo.
echo  Starting local server...
echo  Browser will open automatically.
echo.

:: Try Python 3 first
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo  Python found. Starting server on http://localhost:8181
    start "" "http://localhost:8181/voxme-studio.html"
    python -m http.server 8181
    goto end
)

:: Try Python launcher
py --version >nul 2>&1
if %errorlevel% == 0 (
    echo  Python found. Starting server on http://localhost:8181
    start "" "http://localhost:8181/voxme-studio.html"
    py -m http.server 8181
    goto end
)

:: Try Node.js npx serve
npx --version >nul 2>&1
if %errorlevel% == 0 (
    echo  Node.js found. Starting server on http://localhost:8181
    start "" "http://localhost:8181/voxme-studio.html"
    npx serve -p 8181 .
    goto end
)

echo  ERROR: Python or Node.js not found.
echo.
echo  Please install Python from https://python.org
echo  Then double-click this file again.
echo.
pause

:end
