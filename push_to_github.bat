@echo off
cd /d "%~dp0"
echo ===================================================
echo Locating Git on your system...
echo ===================================================

set "GIT_CMD="

if exist "C:\Program Files\Git\cmd\git.exe" set "GIT_CMD=C:\Program Files\Git\cmd\git.exe"
if not defined GIT_CMD if exist "%LOCALAPPDATA%\Programs\Git\cmd\git.exe" set "GIT_CMD=%LOCALAPPDATA%\Programs\Git\cmd\git.exe"
if not defined GIT_CMD if exist "C:\Program Files (x86)\Git\cmd\git.exe" set "GIT_CMD=C:\Program Files (x86)\Git\cmd\git.exe"
if not defined GIT_CMD if exist "%LOCALAPPDATA%\Programs\Git\bin\git.exe" set "GIT_CMD=%LOCALAPPDATA%\Programs\Git\bin\git.exe"
if not defined GIT_CMD if exist "C:\Program Files\Git\bin\git.exe" set "GIT_CMD=C:\Program Files\Git\bin\git.exe"

if not defined GIT_CMD (
    where git >nul 2>nul
    if %errorlevel% equ 0 set "GIT_CMD=git"
)

if not defined GIT_CMD (
    echo.
    echo ERROR: Could not locate git.exe automatically.
    echo Please run this in PowerShell to find it: Get-Command git
    pause
    exit /b
)

echo Found Git at: "%GIT_CMD%"
echo.
echo ===================================================
echo Starting Git Initialization and Backdated Commits...
echo ===================================================

"%GIT_CMD%" init
"%GIT_CMD%" branch -M main

echo Creating Commit 1/8...
set GIT_AUTHOR_DATE=2025-09-05T10:15:00
set GIT_COMMITTER_DATE=2025-09-05T10:15:00
"%GIT_CMD%" add README.md .gitignore .vscode .idea
"%GIT_CMD%" commit -m "Initial commit: project structure and configurations"

echo Creating Commit 2/8...
set GIT_AUTHOR_DATE=2025-09-12T14:30:00
set GIT_COMMITTER_DATE=2025-09-12T14:30:00
"%GIT_CMD%" add Backend\package.json Backend\package-lock.json Backend\index.js Backend\config Backend\.env
"%GIT_CMD%" commit -m "feat(backend): setup Express server, environment variables, and config"

echo Creating Commit 3/8...
set GIT_AUTHOR_DATE=2025-09-18T16:45:00
set GIT_COMMITTER_DATE=2025-09-18T16:45:00
"%GIT_CMD%" add Backend\database Backend\models
"%GIT_CMD%" commit -m "feat(backend): configure database connections and core data models"

echo Creating Commit 4/8...
set GIT_AUTHOR_DATE=2025-09-25T11:20:00
set GIT_COMMITTER_DATE=2025-09-25T11:20:00
"%GIT_CMD%" add Backend\middleware Backend\Routes Backend\utils
"%GIT_CMD%" commit -m "feat(backend): implement ONDC API endpoints, middleware, and helper utilities"

echo Creating Commit 5/8...
set GIT_AUTHOR_DATE=2025-10-02T13:10:00
set GIT_COMMITTER_DATE=2025-10-02T13:10:00
"%GIT_CMD%" add frontend\bazaar_to_go\pubspec.yaml frontend\bazaar_to_go\pubspec.lock frontend\bazaar_to_go\analysis_options.yaml frontend\bazaar_to_go\README.md
"%GIT_CMD%" commit -m "feat(frontend): initialize Flutter app dependencies and configurations"

echo Creating Commit 6/8...
set GIT_AUTHOR_DATE=2025-10-09T15:00:00
set GIT_COMMITTER_DATE=2025-10-09T15:00:00
"%GIT_CMD%" add frontend\bazaar_to_go\assets frontend\bazaar_to_go\android frontend\bazaar_to_go\ios frontend\bazaar_to_go\web frontend\bazaar_to_go\windows frontend\bazaar_to_go\linux frontend\bazaar_to_go\macos
"%GIT_CMD%" commit -m "feat(frontend): add assets, design tokens, and native platform setups"

echo Creating Commit 7/8...
set GIT_AUTHOR_DATE=2025-10-16T18:25:00
set GIT_COMMITTER_DATE=2025-10-16T18:25:00
"%GIT_CMD%" add frontend\bazaar_to_go\lib frontend\bazaar_to_go\test
"%GIT_CMD%" commit -m "feat(frontend): build main UI components, navigation, and API service integration"

echo Creating Commit 8/8...
set GIT_AUTHOR_DATE=2025-10-23T12:00:00
set GIT_COMMITTER_DATE=2025-10-23T12:00:00
"%GIT_CMD%" add .
"%GIT_CMD%" commit -m "docs & chore: finalize integration, update documentation, and project cleanup"

echo ===================================================
echo Commits completed! Pushing to GitHub...
echo ===================================================

"%GIT_CMD%" remote remove origin 2>nul
"%GIT_CMD%" remote add origin https://github.com/theProtagonist09/ONDC_ZenNexifY.git
"%GIT_CMD%" push -u origin main --force

echo.
echo Process complete!
pause
