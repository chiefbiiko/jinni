# usage: powershell -File fetch.ps1

param([string]$remote="https://raw.githubusercontent.com/LOLBAS-Project/LOLBAS/master/README.md", [string]$local=($remote).Basename)

certutil -urlcache -split -f $remote $local