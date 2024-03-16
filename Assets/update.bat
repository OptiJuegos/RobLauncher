@echo off
del "RobLauncher.bat"
"%CD%\Assets\wget.exe" -q --show-progress --connect-timeout=15 --tries=3 -P "%CD%" "https://raw.githubusercontent.com/OptiJuegos/RobLauncher/main/RobLauncher.bat"