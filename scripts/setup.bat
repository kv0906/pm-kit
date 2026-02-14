@echo off
REM PM-Kit Setup Script for Windows
REM Sets up your AI-augmented knowledge vault

echo.
echo ╔═══════════════════════════════════════════════════╗
echo ║   PM-Kit Setup Wizard                          ║
echo ║   AI-Augmented Knowledge Vault v3.0              ║
echo ╚═══════════════════════════════════════════════════╝
echo.

REM Check Git
where git >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git is not installed
    echo Please install Git from: https://git-scm.com/
    exit /b 1
)
echo [OK] Git is installed

REM Check Claude Code
where claude >nul 2>&1
if errorlevel 1 (
    echo [WARNING] Claude Code CLI not found
    echo Install from: https://claude.ai/code
)

REM Set vault path
set "DEFAULT_VAULT=%USERPROFILE%\Documents\PM-Kit"
set /p "VAULT_PATH=Where should we create your vault? [%DEFAULT_VAULT%]: "
if "%VAULT_PATH%"=="" set "VAULT_PATH=%DEFAULT_VAULT%"

REM Create vault directory
if not exist "%VAULT_PATH%" mkdir "%VAULT_PATH%"

REM Get script directory
set "SCRIPT_DIR=%~dp0"
set "SOURCE_DIR=%SCRIPT_DIR%.."

REM Copy vault files
echo Copying vault files...
xcopy /E /I /Y "%SOURCE_DIR%\CLAUDE.md" "%VAULT_PATH%\" >nul 2>&1
xcopy /E /I /Y "%SOURCE_DIR%\_core" "%VAULT_PATH%\_core\" >nul 2>&1
xcopy /E /I /Y "%SOURCE_DIR%\_templates" "%VAULT_PATH%\_templates\" >nul 2>&1
xcopy /E /I /Y "%SOURCE_DIR%\.claude" "%VAULT_PATH%\.claude\" >nul 2>&1
xcopy /E /I /Y "%SOURCE_DIR%\.claude-plugin" "%VAULT_PATH%\.claude-plugin\" >nul 2>&1
REM Create directories
for %%d in (inbox index daily docs decisions blockers meetings reports _archive) do (
    if not exist "%VAULT_PATH%\%%d" mkdir "%VAULT_PATH%\%%d"
)

echo [OK] Vault structure created

REM Git setup
cd /d "%VAULT_PATH%"
if not exist ".git" (
    git init
    echo [OK] Git initialized
)

git add .
git commit -m "Initial PM-Kit setup" >nul 2>&1

echo.
echo ════════════════════════════════════════════════════
echo   PM-Kit Setup Complete!
echo ════════════════════════════════════════════════════
echo.
echo Your vault is ready at: %VAULT_PATH%
echo.
echo Quick start:
echo   cd "%VAULT_PATH%"
echo   claude
echo   /onboard
echo   /daily project: shipped X, wip Y
echo.
pause
