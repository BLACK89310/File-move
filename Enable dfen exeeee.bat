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



    taskkill /f /im pnrpsvc.exe
