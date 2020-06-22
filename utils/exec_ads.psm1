<#
.SYNOPSIS
    Execute from an alternate data stream.
.DESCRIPTION
    The Exec function instantiates a process from an alternate data stream of a 
    host file. It uses the deprecated Windows Management Instrumentation (WMI) 
    Command-Line Utility (Wmic.exe). 
    See https://gist.github.com/api0cradle/cdd2d0d0ec9abb686f0e89306e277b8f
.PARAMETER File
    The path to a host file, a file featuring an alternate data stream.
.PARAMETER Ads
    The name of the alternate data stream in the host file.
.PARAMETER WorkingDirectory
    An optional working directory for the new process. Defaults to $pwd.
.EXAMPLE
    PS C:\> Import-Module -Name .\exec_ads.psm1 -Verbose
    PS C:\> Exec -File ..\test_target -Ads ads.exe
.NOTES
    Author: Noah Anabiik Schwarz
    Date:   June 22, 2020    
#>
function Exec {
  param(
    [Parameter(Mandatory)]
    [string] $File,
    [Parameter(Mandatory)]
    [string] $Ads,
    [string] $WorkingDirectory="$pwd"
  )
  
  $target = "$(Convert-Path $File):${Ads}"
  
  $wd = "$(Convert-Path $WorkingDirectory)"
  
  $wmicStdOut = wmic process call create $target,$wd
  
  $pid = $($wmicStdOut | Select-String -Pattern '([0-9]{3,})').Matches.Groups[0].Value

  return $pid
}

Export-ModuleMember -Function Exec