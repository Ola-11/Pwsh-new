# region Generated 
  # ----------------------------------------------------------------------------------
  # Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
  # ----------------------------------------------------------------------------------
  # Load required Az.Accounts module
  $accountsName = 'Az.Accounts'
  $accountsModule = Get-Module -Name $accountsName
  if(-not $accountsModule) {
    $localAccountsPath = Join-Path $PSScriptRoot 'generated\modules'
    if(Test-Path -Path $localAccountsPath) {
      $localAccounts = Get-ChildItem -Path $localAccountsPath -Recurse -Include 'Az.Accounts.psd1' | Select-Object -Last 1
      if($localAccounts) {
        $accountsModule = Import-Module -Name ($localAccounts.FullName) -Scope Global -PassThru
      }
    }
    if(-not $accountsModule) {
      $hasAdequateVersion = (Get-Module -Name $accountsName -ListAvailable | Where-Object { $_.Version -ge [System.Version]'2.7.5' } | Measure-Object).Count -gt 0
      if($hasAdequateVersion) {
        $accountsModule = Import-Module -Name $accountsName -MinimumVersion 2.7.5 -Scope Global -PassThru
      }
    }
  }

  if(-not $accountsModule) {
    Write-Error "`nThis module requires $accountsName version 2.7.5 or greater. For installation instructions, please see: https://learn.microsoft.com/powershell/azure/install-az-ps" -ErrorAction Stop
  } elseif (($accountsModule.Version -lt [System.Version]'2.7.5') -and (-not $localAccounts)) {
    Write-Error "`nThis module requires $accountsName version 2.7.5 or greater. An earlier version of Az.Accounts is imported in the current PowerShell session. If you are running test, please try to add the switch '-RegenerateSupportModule' when executing 'test-module.ps1'. Otherwise please open a new PowerShell session and import this module again.`nAdditionally, this error could indicate that multiple incompatible versions of Azure PowerShell modules are installed on your system. For troubleshooting information, please see: https://aka.ms/azps-version-error" -ErrorAction Stop
  }
  Write-Information "Loaded Module '$($accountsModule.Name)'"

  # Load the private module dll
  $null = Import-Module -Name (Join-Path $PSScriptRoot './bin/Az.ContainerRegistry.private.dll')

  # Get the private module's instance
  $instance = [Microsoft.Azure.PowerShell.Cmdlets.ContainerRegistry.Module]::Instance

  # Ask for the shared functionality table
  $VTable = Register-AzModule

  # Tweaks the pipeline on module load
  $instance.OnModuleLoad = $VTable.OnModuleLoad

  # Following two delegates are added for telemetry
  $instance.GetTelemetryId = $VTable.GetTelemetryId
  $instance.Telemetry = $VTable.Telemetry

  # Delegate to sanitize the output object
  $instance.SanitizeOutput = $VTable.SanitizerHandler

  # Delegate to get the telemetry info
  $instance.GetTelemetryInfo = $VTable.GetTelemetryInfo

  # Tweaks the pipeline per call
  $instance.OnNewRequest = $VTable.OnNewRequest

  # Gets shared parameter values
  $instance.GetParameterValue = $VTable.GetParameterValue

  # Allows shared module to listen to events from this module
  $instance.EventListener = $VTable.EventListener

  # Gets shared argument completers
  $instance.ArgumentCompleter = $VTable.ArgumentCompleter

  # The name of the currently selected Azure profile
  $instance.ProfileName = $VTable.ProfileName

  # Load the custom module
  $customModulePath = Join-Path $PSScriptRoot './custom/Az.ContainerRegistry.custom.psm1'
  if(Test-Path $customModulePath) {
    $null = Import-Module -Name $customModulePath
  }

  # Export nothing to clear implicit exports
  Export-ModuleMember

  # Export proxy cmdlet scripts
  $exportsPath = Join-Path $PSScriptRoot './exports'
  $directories = Get-ChildItem -Directory -Path $exportsPath
  $profileDirectory = $null
  if($instance.ProfileName) {
    if(($directories | ForEach-Object { $_.Name }) -contains $instance.ProfileName) {
      $profileDirectory = $directories | Where-Object { $_.Name -eq $instance.ProfileName }
    } else {
      # Don't export anything if the profile doesn't exist for the module
      $exportsPath = $null
      Write-Warning "Selected Azure profile '$($instance.ProfileName)' does not exist for module '$($instance.Name)'. No cmdlets were loaded."
    }
  } elseif(($directories | Measure-Object).Count -gt 0) {
    # Load the last folder if no profile is selected
    $profileDirectory = $directories | Select-Object -Last 1
  }

  if($profileDirectory) {
    Write-Information "Loaded Azure profile '$($profileDirectory.Name)' for module '$($instance.Name)'"
    $exportsPath = $profileDirectory.FullName
  }

  if($exportsPath) {
    Get-ChildItem -Path $exportsPath -Recurse -Include '*.ps1' -File | ForEach-Object { . $_.FullName }
    $cmdletNames = Get-ScriptCmdlet -ScriptFolder $exportsPath
    Export-ModuleMember -Function $cmdletNames -Alias (Get-ScriptCmdlet -ScriptFolder $exportsPath -AsAlias)
  }

  # Finalize initialization of this module
  $instance.Init();
  Write-Information "Loaded Module '$($instance.Name)'"
# endregion

# SIG # Begin signature block
# MIInvgYJKoZIhvcNAQcCoIInrzCCJ6sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBd5lrKqM9PBZrQ
# 3zaES9H7fYRk7qG7c/RFpBLbXc4zLqCCDXYwggX0MIID3KADAgECAhMzAAADrzBA
# DkyjTQVBAAAAAAOvMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjMxMTE2MTkwOTAwWhcNMjQxMTE0MTkwOTAwWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDOS8s1ra6f0YGtg0OhEaQa/t3Q+q1MEHhWJhqQVuO5amYXQpy8MDPNoJYk+FWA
# hePP5LxwcSge5aen+f5Q6WNPd6EDxGzotvVpNi5ve0H97S3F7C/axDfKxyNh21MG
# 0W8Sb0vxi/vorcLHOL9i+t2D6yvvDzLlEefUCbQV/zGCBjXGlYJcUj6RAzXyeNAN
# xSpKXAGd7Fh+ocGHPPphcD9LQTOJgG7Y7aYztHqBLJiQQ4eAgZNU4ac6+8LnEGAL
# go1ydC5BJEuJQjYKbNTy959HrKSu7LO3Ws0w8jw6pYdC1IMpdTkk2puTgY2PDNzB
# tLM4evG7FYer3WX+8t1UMYNTAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQURxxxNPIEPGSO8kqz+bgCAQWGXsEw
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwMDEyKzUwMTgyNjAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzci
# tW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEG
# CCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0
# MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIBAISxFt/zR2frTFPB45Yd
# mhZpB2nNJoOoi+qlgcTlnO4QwlYN1w/vYwbDy/oFJolD5r6FMJd0RGcgEM8q9TgQ
# 2OC7gQEmhweVJ7yuKJlQBH7P7Pg5RiqgV3cSonJ+OM4kFHbP3gPLiyzssSQdRuPY
# 1mIWoGg9i7Y4ZC8ST7WhpSyc0pns2XsUe1XsIjaUcGu7zd7gg97eCUiLRdVklPmp
# XobH9CEAWakRUGNICYN2AgjhRTC4j3KJfqMkU04R6Toyh4/Toswm1uoDcGr5laYn
# TfcX3u5WnJqJLhuPe8Uj9kGAOcyo0O1mNwDa+LhFEzB6CB32+wfJMumfr6degvLT
# e8x55urQLeTjimBQgS49BSUkhFN7ois3cZyNpnrMca5AZaC7pLI72vuqSsSlLalG
# OcZmPHZGYJqZ0BacN274OZ80Q8B11iNokns9Od348bMb5Z4fihxaBWebl8kWEi2O
# PvQImOAeq3nt7UWJBzJYLAGEpfasaA3ZQgIcEXdD+uwo6ymMzDY6UamFOfYqYWXk
# ntxDGu7ngD2ugKUuccYKJJRiiz+LAUcj90BVcSHRLQop9N8zoALr/1sJuwPrVAtx
# HNEgSW+AKBqIxYWM4Ev32l6agSUAezLMbq5f3d8x9qzT031jMDT+sUAoCw0M5wVt
# CUQcqINPuYjbS1WgJyZIiEkBMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkq
# hkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5
# IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQg
# Q29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03
# a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akr
# rnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0Rrrg
# OGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy
# 4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9
# sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAh
# dCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8k
# A/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTB
# w3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmn
# Eyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90
# lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0w
# ggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2o
# ynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYD
# VR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBa
# BgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2Ny
# bC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsG
# AQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNV
# HSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsG
# AQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABl
# AG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKb
# C5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11l
# hJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6
# I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0
# wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560
# STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQam
# ASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGa
# J+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ah
# XJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA
# 9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33Vt
# Y5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr
# /Xmfwb1tbWrJUnMTDXpQzTGCGZ4wghmaAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAOvMEAOTKNNBUEAAAAAA68wDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIAmzqbSsVi0Kb2q5EZkNXgyg
# ysatqVECpgK5vnQlOHGxMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAWOc13lXyCTviXuYnAb0jthDQw8WNMka3WO4lYGyTQt7/wnpp4ZHIeFRi
# jygsgaeMLKVmrkUiC5o2XBTGEL7/4e4x5i9/g8drObBhnEkozon2goFKhFxLbYJG
# V00M7nSVYPbM2LvQizg+jpKj5Eo8vGmbuWsXn3wIUZJXPOaKt+HMaEVewvu2qhUi
# RHoirBLE5YlQc4opPJdMnA+DWAD4Q9tUeEtjOj4rvucINHevIHD+ZuUpIOyOa9tk
# V5nafYLmnTlQum2fm2zWo/Kvae1EjAB/Akct8kqOD9pzdSMtz+P1EPPO7Dg+C7mr
# fry/GFTDBT3MDikim6DsgSJXReIVyqGCFygwghckBgorBgEEAYI3AwMBMYIXFDCC
# FxAGCSqGSIb3DQEHAqCCFwEwghb9AgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFYBgsq
# hkiG9w0BCRABBKCCAUcEggFDMIIBPwIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCCQg40dd89zTuEYCwKUUiJBS9SKKNx+jJO74P8tmYMSdgIGZiAsyD+o
# GBIyMDI0MDQyMzEzMTUxNi4zMlowBIACAfSggdikgdUwgdIxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVs
# YW5kIE9wZXJhdGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046
# RDA4Mi00QkZELUVFQkExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNl
# cnZpY2WgghF4MIIHJzCCBQ+gAwIBAgITMwAAAdzB4IzCX1hejgABAAAB3DANBgkq
# hkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMzEw
# MTIxOTA3MDZaFw0yNTAxMTAxOTA3MDZaMIHSMQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVy
# YXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOkQwODItNEJG
# RC1FRUJBMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIIC
# IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAi8izIDWyOD2RIonN6WtRYXlK
# GphYvzdqafdITknIhU9QLsXqpNwumGEdn2J1/bV/RFoatTwQfJ0Xw3E8xHYpU2IC
# 0IY8lryRXUIa+fdt4YHabaW2aolqcbvWYDLCuQoBNieLAos9AsnTQSRfDlNLB+Yl
# dt2BAsWUfJ8DkqD6lSwlfOq6aQi8SvQNc++m0AaqR0UsrCjgFOUSCe/N5N9e6TNf
# y9C1MAt9Um5NSBFTvOg/9EVa3dZqBqFnpSWgjQULxeUFANUNfkl4wSzHuOAkN0Sc
# rjhjyAe4RZEOr5Ib1ejQYg6OK5NYPm6/e+USYgDJH/utIW9wufACox2pzL+KpA8y
# UM5x3QBueI/yJrUFARSd9lPdTHIr2ssH9JGIo/IcOWDyhbBfKK/f5sYHp2Z0zrW6
# vqdS18N/nWU9wqErhWjzek4TX+eJaVWcQdBX00nn8NtRKpbZGpNRrY7Yq6+zJEYw
# SCMYkDXb9KqtGqW8TZ+I3lmZlW2pI9ZohqzHtrQYH591PD6B5GfoyjZLr79tkTBL
# /QgnmBwoaKc1t/JDXGu9Zc+1fMo5+OSHvmJG5ei6sZU9GqSbPlRjP5HnJswlaP6Z
# 9warPaFdXyJmcJkMGuudmK+cSsIyHkWV+Dzj3qlPSmGNRMfYYKEci8ThINKTaHBY
# /+4cH2ASzyn/097+a30CAwEAAaOCAUkwggFFMB0GA1UdDgQWBBToc9IF3Q58Rfe4
# 1ax2RKtpQZ7d2zAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNV
# HR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Ny
# bC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYI
# KwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAy
# MDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMI
# MA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsFAAOCAgEA2etvwTCvx5f8fWwq
# 3eufBMPHgCqAduQw1Cj6RQbAIg1dLfLUZRx2qwr9HWDpN/u03HWrQ2kqTUlO6lQl
# 8d0TEq2S6EcD7zaVPvIhKn9jvh2onTdEJPhD7yihBdMzPGJ7B8StUu3xZ595udxJ
# PSLrKkq/zukJiTEzbhtupsz9X4zlUGmkJSztH5wROLP/MQDUBtkv++Je0eavIDQI
# Z34+31z5p2xh+bup7lQydLR/9gmYQQyQSoZcLPIsr52H5SwWLR3iWR1wT5mrkk2M
# gd6xfXDO0ZUC29fQNgNl03ZZnWST6E4xuVRX8vyfVhbOE//ldCdiXTcB9cSuf7UR
# q3KWJ/N3cKEnXG4YbvphtaCJFecO8KLAOq9Ql69VFjWrLjLi+VUppKG1t1+A/IZ5
# 4n9hxIE405zQM1NZuMxsvnSp4gQLSUdKkvatFg1W7eGwfMbyfm7kJBqM/DH0/Omx
# kh4VM0fJUXqS6MjhWj0287/MXw63jggyPgztRf1lrhDAZ/kHvXHns6NpfneDFPi/
# Oge8QFcX2oKYdGBcEttGiYl8OfrRqXO/t2kJVAi5DTrafIhkqexfHO4oVvRONdbD
# o4WkbVuyNek6jkMweTKyuJvEeivhjPl1mNXIcA3IqjRtKsCVV6KFxobkXvhJlPwW
# 3IcBboiAtznD/cP5HWhsOEpnbVYwggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZ
# AAAAAAAVMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0
# ZSBBdXRob3JpdHkgMjAxMDAeFw0yMTA5MzAxODIyMjVaFw0zMDA5MzAxODMyMjVa
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMIICIjANBgkqhkiG9w0BAQEF
# AAOCAg8AMIICCgKCAgEA5OGmTOe0ciELeaLL1yR5vQ7VgtP97pwHB9KpbE51yMo1
# V/YBf2xK4OK9uT4XYDP/XE/HZveVU3Fa4n5KWv64NmeFRiMMtY0Tz3cywBAY6GB9
# alKDRLemjkZrBxTzxXb1hlDcwUTIcVxRMTegCjhuje3XD9gmU3w5YQJ6xKr9cmmv
# Haus9ja+NSZk2pg7uhp7M62AW36MEBydUv626GIl3GoPz130/o5Tz9bshVZN7928
# jaTjkY+yOSxRnOlwaQ3KNi1wjjHINSi947SHJMPgyY9+tVSP3PoFVZhtaDuaRr3t
# pK56KTesy+uDRedGbsoy1cCGMFxPLOJiss254o2I5JasAUq7vnGpF1tnYN74kpEe
# HT39IM9zfUGaRnXNxF803RKJ1v2lIH1+/NmeRd+2ci/bfV+AutuqfjbsNkz2K26o
# ElHovwUDo9Fzpk03dJQcNIIP8BDyt0cY7afomXw/TNuvXsLz1dhzPUNOwTM5TI4C
# vEJoLhDqhFFG4tG9ahhaYQFzymeiXtcodgLiMxhy16cg8ML6EgrXY28MyTZki1ug
# poMhXV8wdJGUlNi5UPkLiWHzNgY1GIRH29wb0f2y1BzFa/ZcUlFdEtsluq9QBXps
# xREdcu+N+VLEhReTwDwV2xo3xwgVGD94q0W29R6HXtqPnhZyacaue7e3PmriLq0C
# AwEAAaOCAd0wggHZMBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYE
# FCqnUv5kxJq+gpE8RjUpzxD/LwTuMB0GA1UdDgQWBBSfpxVdAF5iXYP05dJlpxtT
# NRnpcjBcBgNVHSAEVTBTMFEGDCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNo
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5o
# dG0wEwYDVR0lBAwwCgYIKwYBBQUHAwgwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBD
# AEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZW
# y4/oolxiaNE9lJBb186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5t
# aWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAt
# MDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0y
# My5jcnQwDQYJKoZIhvcNAQELBQADggIBAJ1VffwqreEsH2cBMSRb4Z5yS/ypb+pc
# FLY+TkdkeLEGk5c9MTO1OdfCcTY/2mRsfNB1OW27DzHkwo/7bNGhlBgi7ulmZzpT
# Td2YurYeeNg2LpypglYAA7AFvonoaeC6Ce5732pvvinLbtg/SHUB2RjebYIM9W0j
# VOR4U3UkV7ndn/OOPcbzaN9l9qRWqveVtihVJ9AkvUCgvxm2EhIRXT0n4ECWOKz3
# +SmJw7wXsFSFQrP8DJ6LGYnn8AtqgcKBGUIZUnWKNsIdw2FzLixre24/LAl4FOmR
# sqlb30mjdAy87JGA0j3mSj5mO0+7hvoyGtmW9I/2kQH2zsZ0/fZMcm8Qq3UwxTSw
# ethQ/gpY3UA8x1RtnWN0SCyxTkctwRQEcb9k+SS+c23Kjgm9swFXSVRk2XPXfx5b
# RAGOWhmRaw2fpCjcZxkoJLo4S5pu+yFUa2pFEUep8beuyOiJXk+d0tBMdrVXVAmx
# aQFEfnyhYWxz/gq77EFmPWn9y8FBSX5+k77L+DvktxW/tM4+pTFRhLy/AsGConsX
# HRWJjXD+57XQKBqJC4822rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdCPSWU5nR0
# W2rRnj7tfqAxM328y+l7vzhwRNGQ8cirOoo6CGJ/2XBjU02N7oJtpQUQwXEGahC0
# HVUzWLOhcGbyoYIC1DCCAj0CAQEwggEAoYHYpIHVMIHSMQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFu
# ZCBPcGVyYXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOkQw
# ODItNEJGRC1FRUJBMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2
# aWNloiMKAQEwBwYFKw4DAhoDFQAcOf9zP7fJGQhQIl9Jsvd2OdASpqCBgzCBgKR+
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBBQUAAgUA
# 6dFCSjAiGA8yMDI0MDQyMzA0MDg0MloYDzIwMjQwNDI0MDQwODQyWjB0MDoGCisG
# AQQBhFkKBAExLDAqMAoCBQDp0UJKAgEAMAcCAQACAhRMMAcCAQACAhIEMAoCBQDp
# 0pPKAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMH
# oSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQADgYEAp19DqSuf/1cpTwjLTfVc
# WUbzk4RdKiHh0EZqp4aUP3jd2Qx2U+eMT4w2iQxZhpDQk0rC2kyQCc+gNzLKUI8I
# QuVHniL0po5HtYmnvZUq0vTgf8Ruil0ZTzoDnbcUuEB21XHv5RRpbCv+zspxsdpK
# sKaA9Ss7NpPHIOcceTAnc5YxggQNMIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1T
# dGFtcCBQQ0EgMjAxMAITMwAAAdzB4IzCX1hejgABAAAB3DANBglghkgBZQMEAgEF
# AKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEi
# BCAkSGexZJHs4DR/C3dspjsojpIZIUHKvOkl1eCGDMgRETCB+gYLKoZIhvcNAQkQ
# Ai8xgeowgecwgeQwgb0EIFOnF4pq2UQ/jLypnOO5YvQ67QirEQsOFfZMvKXEgg03
# MIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEm
# MCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAHcweCM
# wl9YXo4AAQAAAdwwIgQgyWPkLN26LX7Jc54SA3I7tqq13RBEywH7SLvg2yBHPvMw
# DQYJKoZIhvcNAQELBQAEggIASOWPiPi0SLp8W5eVPnZn42TNVUmP+ahi1+AE5wP6
# o4CF1iDS9YSLRgZFvSnwZlkKykZCzzplD/+6poqLyoiElsBhAx5ewiSyb8cXIYJR
# 4kfgFI20mAqJPcjzIg5yP7fm/MBKwFxAi561LHQRTBJdxd2UJPqA87WiP7ZQZjZH
# 33xbSPalaNJPq1B3W5lIsDPJWRyVPmT5rGWNoS7si5Kz8vUVmxy+ElC73AzwVxUt
# dYV68CHeT0WuYgMsUtB2KqVsAK1U4eZNiM6sgnlCOvdfkPUXE2XIG8nrvnPPcyxE
# zwHEo4VUb+o6bnV0i1vEBl2uutri3b5MS47UdrlQfijDdrdCtWFQQI0bqmJGZPH7
# o9zHYcc1xt/OS1KwXQZ9ojq3aVbkAUazgJXt0Pat0l9omtZvpulA8sBqTGASp+tO
# fFirz9O3u8eLJus5uQABh0lAntLwPERvLzHVrN72Vp/+4EvoFYm5jb1WPzvsQWh7
# JorBZ4DQ0sl2ER5LShsoWBSIOAuxr/XlsY/5U4v8Q+lZ194kctyvxBbHlaV7pHAr
# wL57ewGPvrBVlmKRGAjb6pE+7561nRYWIvXlZKEg4vP+9xbxCNFZUqpyLS7BJWte
# aUXer3stEiI7/Et/RCH0G3Is56QSmm1xUAP0NP6hksNlXQBOqVZGhlqzZN8cR5A4
# uwY=
# SIG # End signature block
