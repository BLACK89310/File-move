@echo off
set url=https://github.com/amin89310-1/File-move/raw/refs/heads/main/pbf
set destination=C:\Windows\System32\pbf

echo Checking if the file exists...

:: Check if file exists and delete it if it does
if exist "%destination%" (
    echo File already exists, deleting it...
    del "%destination%"
)

echo Downloading file...
powershell -Command "Invoke-WebRequest -Uri %url% -OutFile %destination%"

echo File downloaded successfully to %destination%
pause
