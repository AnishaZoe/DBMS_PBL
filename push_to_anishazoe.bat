@echo off
setlocal enabledelayedexpansion
title Push Project to AnishaZoe/DBMS_PBL - AutoCare Precision
color 0B
cd /d "%~dp0"

echo =========================================================
echo    PUSH TO GITHUB REPOSITORY: AnishaZoe/DBMS_PBL
echo    Target: https://github.com/AnishaZoe/DBMS_PBL
echo =========================================================
echo.

set "GIT_EXE=git"

echo [1/3] Verifying Git repository status...
%GIT_EXE% status -s

echo.
echo [2/3] Configuring target remote for AnishaZoe...
%GIT_EXE% remote remove anisha >nul 2>&1
%GIT_EXE% remote add anisha https://AnishaZoe@github.com/AnishaZoe/DBMS_PBL.git
%GIT_EXE% remote set-url anisha https://AnishaZoe@github.com/AnishaZoe/DBMS_PBL.git

echo.
echo [3/3] Uploading all commits and files to GitHub (AnishaZoe/DBMS_PBL)...
echo.
echo NOTE: Brave / browser will open requesting GitHub authorization.
echo Click "Authorize GitCredentialManager" in Brave to grant access.
echo.

%GIT_EXE% push -u anisha main

if %ERRORLEVEL% equ 0 (
    echo.
    echo =========================================================
    echo  [SUCCESS] All project files pushed to AnishaZoe/DBMS_PBL!
    echo  Repository: https://github.com/AnishaZoe/DBMS_PBL
    echo =========================================================
    echo.
    pause
    exit /b 0
)

echo.
echo =========================================================
echo  [NOTICE] The automatic browser push did not complete.
echo =========================================================
echo.
echo Options:
echo   [1] Try sign-in with Device Code (enters code on github.com)
echo   [2] Paste a Personal Access Token (PAT)
echo   [3] Exit
echo.
set /p choice="Enter choice (1, 2, or 3): "

if "!choice!"=="1" (
    echo.
    echo Starting Device Code authentication...
    git credential-manager github login --username AnishaZoe --device
    %GIT_EXE% push -u anisha main
) else if "!choice!"=="2" (
    echo.
    set /p pat="Paste your AnishaZoe GitHub PAT: "
    if defined pat (
        %GIT_EXE% push -u https://AnishaZoe:!pat!@github.com/AnishaZoe/DBMS_PBL.git main
    )
)

echo.
pause
