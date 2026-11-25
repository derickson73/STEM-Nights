@echo off
REM Double-click to start the offline STEM Night server.
REM Edit the path below if pxt-arcade lives somewhere else on this laptop.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\Start-StemNight.ps1" -PxtArcade "%USERPROFILE%\Documents\GitHub\pxt-arcade" %*
pause
