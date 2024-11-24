@echo off
cls
echo Clearing RAM and cleaning up temporary files...

:: Clearing the pagefile (can be problematic, so commented out)
:: echo Clearing pagefile...
:: del /f /q %SystemRoot%\pagefile.sys
:: echo Pagefile cleared.

:: Clearing temp files
echo Deleting temporary files...
del /f /q %TEMP%\*
del /f /q C:\Windows\Temp\*

echo Temporary files deleted.

:: Clean up Internet Explorer cache (optional)
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

:: Clean up Windows Update cache (optional)
rd /s /f /q C:\Windows\SoftwareDistribution\Download

:: Clean up Prefetch files (optional)
del /q /f /s C:\Windows\Prefetch\*

:: Registry Cleaner Batch File

:: Delete temporary file keys (safe cleanup)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedMRU" /f

:: Delete Windows temporary folder registry keys
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Temporary Current" /f

:: Clean up registry entries related to old Windows updates (optional)
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Scan" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Updates" /f

:: Clean the Prefetch registry keys
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /f

:: Clean the software distribution registry keys (Windows Update)
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /f

:: Final message
echo Registry cleaning complete!

:: Killing unnecessary processes (only essential processes should be excluded)
echo Closing unnecessary processes...
taskkill /f /im RuntimeBroker.exe
taskkill /f /im skype.exe
taskkill /f /im dllhost.exe
taskkill /f /im CompPkgSrv.exe
taskkill /f /im SearchApp.exe
taskkill /f /im TextInputHost.exe
taskkill /f /im wlanext.exe
taskkill /f /im WUDFHost.exe
taskkill /f /im WmiPrvSE.exe
taskkill /f /im StartMenuExperienceHost.exe
taskkill /f /im notepad.exe
taskkill /f /im Cortana.exe
taskkill /f /im GameBar.exe
taskkill /f /im XboxApp.exe
taskkill /f /im GameBarPresenceWriter.exe
taskkill /f /im WinStore.App.exe
taskkill /f /im Microsoft.Store.Installers.exe
taskkill /f /im Update.exe
taskkill /f /im iTunesHelper.exe
taskkill /f /im GoogleUpdate.exe
taskkill /f /im Adobe_Updater.exe
taskkill /f /im jusched.exe
taskkill /f /im OneDrive.exe
taskkill /f /im MicrosoftEdge.exe
taskkill /f /im MicrosoftEdgeCP.exe
taskkill /f /im msedge.exe
taskkill /f /im cmd.exe

:: Cleanup complete
echo Cleanup process complete.
