@echo off
echo Enabling all Windows Defender protection...

:: Enable Real-time Protection
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false"

:: Enable Cloud-Delivered Protection
powershell -Command "Set-MpPreference -DisableBlockAtFirstSeen $false"

:: Enable Potentially Unwanted App (PUA) Protection
powershell -Command "Set-MpPreference -PUAProtection $true"

:: Enable Automatic Sample Submission
powershell -Command "Set-MpPreference -SubmitSamplesConsent SendSafeSamples"

:: Enable Microsoft Defender Antivirus
powershell -Command "Set-MpPreference -DisableBehaviorMonitoring $false"
powershell -Command "Set-MpPreference -DisableIntrusionPreventionSystem $false"
powershell -Command "Set-MpPreference -DisableScriptScanning $false"


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
