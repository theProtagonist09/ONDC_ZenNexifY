@echo off
cd /d "%~dp0"
echo Starting Git Commit and Push Process for ONDC_ZenNexifY...
powershell -ExecutionPolicy Bypass -File "%~dp0make_commits.ps1"
echo.
echo Process complete! Press any key to close.
pause
