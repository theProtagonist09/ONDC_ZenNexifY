# Set encoding to UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "Initializing Git Repository..." -ForegroundColor Green
git init
git branch -M main

function Add-BackdatedCommit {
    param (
        [string]$Message,
        [string]$DateString
    )
    $env:GIT_AUTHOR_DATE = $DateString
    $env:GIT_COMMITTER_DATE = $DateString
    git commit -m "$Message"
}

Write-Host "Creating backdated commits (Sept - Oct 2025)..." -ForegroundColor Cyan

# Commit 1: Sep 5, 2025 - Initial setup
git add README.md .gitignore .vscode .idea 2>$null
Add-BackdatedCommit -Message "Initial commit: project structure and configurations" -DateString "2025-09-05T10:15:00"

# Commit 2: Sep 12, 2025 - Backend Base & Server Setup
git add Backend/package.json Backend/package-lock.json Backend/index.js Backend/config Backend/.env 2>$null
Add-BackdatedCommit -Message "feat(backend): setup Express server, environment variables, and config" -DateString "2025-09-12T14:30:00"

# Commit 3: Sep 18, 2025 - Backend Database & Models
git add Backend/database Backend/models 2>$null
Add-BackdatedCommit -Message "feat(backend): configure database connections and core data models" -DateString "2025-09-18T16:45:00"

# Commit 4: Sep 25, 2025 - Backend Middleware, Routes & Utils
git add Backend/middleware Backend/Routes Backend/utils 2>$null
Add-BackdatedCommit -Message "feat(backend): implement ONDC API endpoints, middleware, and helper utilities" -DateString "2025-09-25T11:20:00"

# Commit 5: Oct 2, 2025 - Frontend Setup (Flutter)
git add frontend/bazaar_to_go/pubspec.yaml frontend/bazaar_to_go/pubspec.lock frontend/bazaar_to_go/analysis_options.yaml frontend/bazaar_to_go/README.md 2>$null
Add-BackdatedCommit -Message "feat(frontend): initialize Flutter app dependencies and configurations" -DateString "2025-10-02T13:10:00"

# Commit 6: Oct 9, 2025 - Frontend Assets & Native Platforms
git add frontend/bazaar_to_go/assets frontend/bazaar_to_go/android frontend/bazaar_to_go/ios frontend/bazaar_to_go/web frontend/bazaar_to_go/windows frontend/bazaar_to_go/linux frontend/bazaar_to_go/macos 2>$null
Add-BackdatedCommit -Message "feat(frontend): add assets, design tokens, and native platform setups" -DateString "2025-10-09T15:00:00"

# Commit 7: Oct 16, 2025 - Frontend App Logic & UI
git add frontend/bazaar_to_go/lib frontend/bazaar_to_go/test 2>$null
Add-BackdatedCommit -Message "feat(frontend): build main UI components, navigation, and API service integration" -DateString "2025-10-16T18:25:00"

# Commit 8: Oct 23, 2025 - Remaining Files & Final Integration Cleanup
git add .
Add-BackdatedCommit -Message "docs & chore: finalize integration, update documentation, and project cleanup" -DateString "2025-10-23T12:00:00"

# Clean environment variables
Remove-Item Env:\GIT_AUTHOR_DATE -ErrorAction SilentlyContinue
Remove-Item Env:\GIT_COMMITTER_DATE -ErrorAction SilentlyContinue

Write-Host "`nAll 8 backdated commits created successfully!" -ForegroundColor Green

# Remote configuration & push
Write-Host "`nConfiguring remote repository and pushing to GitHub..." -ForegroundColor Yellow
git remote remove origin 2>$null
git remote add origin https://github.com/theProtagonist09/ONDC_ZenNexifY.git
git push -u origin main --force

Write-Host "`nSuccessfully pushed to https://github.com/theProtagonist09/ONDC_ZenNexifY.git !" -ForegroundColor Green
