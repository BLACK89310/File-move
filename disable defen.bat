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
