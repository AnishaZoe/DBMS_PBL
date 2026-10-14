@echo off
title Push DBMS Project to AnishaZoe/DBMS_PBL
color 0A
cd /d "%~dp0"

echo =========================================================
echo   Pushing DBMS Project to https://github.com/AnishaZoe/DBMS_PBL
echo =========================================================
echo.

git remote remove anisha >nul 2>&1
git remote add anisha https://github.com/AnishaZoe/DBMS_PBL.git
git remote set-url anisha https://github.com/AnishaZoe/DBMS_PBL.git

echo Uploading main branch...
git push -u anisha main

if %ERRORLEVEL% equ 0 (
    echo.
    echo =========================================================
    echo  [SUCCESS] All files successfully pushed to AnishaZoe/DBMS_PBL!
    echo =========================================================
) else (
    echo.
    echo =========================================================
    echo  If a GitHub sign-in window popped up, please complete the sign-in.
    echo =========================================================
)

echo.
pause
