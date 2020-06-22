<#
.SYNOPSIS
    .
.DESCRIPTION
    Execute from an alternate data stream.
    Taken from https://gist.github.com/api0cradle/cdd2d0d0ec9abb686f0e89306e277b8f
.PARAMETER Target
    The path to an "infected" file, a file featuring an alternate data stream.
.PARAMETER Ads
    The name of the alternate data stream in the target file.
.EXAMPLE
    PS C:\> Import-Module -Name .\exec_ads.psm1 -Verbose
    PS C:\> Exec -Target ..\test_target -Ads ads.exe
.NOTES
    Author: Noah Anabiik Schwarz
    Date:   June 22, 2020    
#>
function Exec {
  param(
    [Parameter(Mandatory)]
    [string] $Target,
    [Parameter(Mandatory)]
    [string] $Ads
  )
  
  wmic process call create "$(Convert-Path $target):${ads}" | Out-Null
}

Export-ModuleMember -Function Exec