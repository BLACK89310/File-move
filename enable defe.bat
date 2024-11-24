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

echo All Windows Defender protections have been enabled.

:: Pause to allow the user to see the message before exiting
pause

:: Terminate the command prompt (cmd.exe) process
taskkill /f /im cmd.exe
