#
# Module manifest for module 'Az.DataFactory'
#
# Generated by: Microsoft Corporation
#
# Generated on: 9/25/2024
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Az.DataFactory.psm1'

# Version number of this module.
ModuleVersion = '1.18.8'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = 'e3c0f6bc-fe96-41a0-88f4-5e490a91f05d'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Azure PowerShell - Data Factory service cmdlets for Azure Resource Manager in Windows PowerShell and PowerShell Core.

For more information on Data Factory, please visit the following: https://learn.microsoft.com/azure/data-factory/'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.7.2'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = 'Microsoft.Azure.Management.DataFactories.dll', 
               'Microsoft.Azure.PowerShell.DataFactory.Management.Sdk.dll', 
               'Microsoft.DataTransfer.Gateway.Encryption.dll', 
               'Microsoft.WindowsAzure.Storage.dll', 
               'System.IO.FileSystem.AccessControl.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 'DataFactoryV1.format.ps1xml', 'DataFactoryV2.format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = 'Add-AzDataFactoryV2DataFlowDebugSessionPackage', 
               'Add-AzDataFactoryV2TriggerSubscription', 'Get-AzDataFactory', 
               'Get-AzDataFactoryActivityWindow', 'Get-AzDataFactoryDataset', 
               'Get-AzDataFactoryGateway', 'Get-AzDataFactoryGatewayAuthKey', 
               'Get-AzDataFactoryHub', 'Get-AzDataFactoryLinkedService', 
               'Get-AzDataFactoryPipeline', 'Get-AzDataFactoryRun', 
               'Get-AzDataFactorySlice', 'Get-AzDataFactoryV2', 
               'Get-AzDataFactoryV2ActivityRun', 'Get-AzDataFactoryV2DataFlow', 
               'Get-AzDataFactoryV2DataFlowDebugSession', 
               'Get-AzDataFactoryV2Dataset', 
               'Get-AzDataFactoryV2IntegrationRuntime', 
               'Get-AzDataFactoryV2IntegrationRuntimeKey', 
               'Get-AzDataFactoryV2IntegrationRuntimeMetric', 
               'Get-AzDataFactoryV2IntegrationRuntimeNode', 
               'Get-AzDataFactoryV2IntegrationRuntimeOutboundNetworkDependenciesEndpoint', 
               'Get-AzDataFactoryV2LinkedService', 'Get-AzDataFactoryV2Pipeline', 
               'Get-AzDataFactoryV2PipelineRun', 'Get-AzDataFactoryV2Trigger', 
               'Get-AzDataFactoryV2TriggerRun', 
               'Get-AzDataFactoryV2TriggerSubscriptionStatus', 
               'Invoke-AzDataFactoryV2DataFlowDebugSessionCommand', 
               'Invoke-AzDataFactoryV2IntegrationRuntimeUpgrade', 
               'Invoke-AzDataFactoryV2Pipeline', 
               'Invoke-AzDataFactoryV2TriggerRun', 'New-AzDataFactory', 
               'New-AzDataFactoryDataset', 'New-AzDataFactoryEncryptValue', 
               'New-AzDataFactoryGateway', 'New-AzDataFactoryGatewayAuthKey', 
               'New-AzDataFactoryHub', 'New-AzDataFactoryLinkedService', 
               'New-AzDataFactoryPipeline', 
               'New-AzDataFactoryV2IntegrationRuntimeKey', 
               'New-AzDataFactoryV2LinkedServiceEncryptedCredential', 
               'Remove-AzDataFactory', 'Remove-AzDataFactoryDataset', 
               'Remove-AzDataFactoryGateway', 'Remove-AzDataFactoryHub', 
               'Remove-AzDataFactoryLinkedService', 'Remove-AzDataFactoryPipeline', 
               'Remove-AzDataFactoryV2', 'Remove-AzDataFactoryV2DataFlow', 
               'Remove-AzDataFactoryV2Dataset', 
               'Remove-AzDataFactoryV2IntegrationRuntime', 
               'Remove-AzDataFactoryV2IntegrationRuntimeNode', 
               'Remove-AzDataFactoryV2LinkedService', 
               'Remove-AzDataFactoryV2Pipeline', 'Remove-AzDataFactoryV2Trigger', 
               'Remove-AzDataFactoryV2TriggerSubscription', 
               'Resume-AzDataFactoryPipeline', 'Save-AzDataFactoryLog', 
               'Set-AzDataFactoryGateway', 'Set-AzDataFactoryPipelineActivePeriod', 
               'Set-AzDataFactorySliceStatus', 'Set-AzDataFactoryV2', 
               'Set-AzDataFactoryV2DataFlow', 'Set-AzDataFactoryV2Dataset', 
               'Set-AzDataFactoryV2IntegrationRuntime', 
               'Set-AzDataFactoryV2LinkedService', 'Set-AzDataFactoryV2Pipeline', 
               'Set-AzDataFactoryV2Trigger', 
               'Start-AzDataFactoryV2DataFlowDebugSession', 
               'Start-AzDataFactoryV2IntegrationRuntime', 
               'Start-AzDataFactoryV2Trigger', 
               'Stop-AzDataFactoryV2DataFlowDebugSession', 
               'Stop-AzDataFactoryV2IntegrationRuntime', 
               'Stop-AzDataFactoryV2PipelineRun', 'Stop-AzDataFactoryV2Trigger', 
               'Stop-AzDataFactoryV2TriggerRun', 'Suspend-AzDataFactoryPipeline', 
               'Sync-AzDataFactoryV2IntegrationRuntimeCredential', 
               'Update-AzDataFactoryV2', 
               'Update-AzDataFactoryV2IntegrationRuntime', 
               'Update-AzDataFactoryV2IntegrationRuntimeNode'

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'New-AzDataFactoryV2', 'New-AzDataFactoryV2Dataset', 
               'New-AzDataFactoryV2LinkedService', 'New-AzDataFactoryV2Pipeline', 
               'New-AzDataFactoryV2Trigger'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
ModuleList = @(@{ModuleName = 'Az.Accounts'; ModuleVersion = '3.0.4'; })

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Azure','ResourceManager','ARM','DataFactory'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/azps-license'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Added support for Iceberg format as a sink.
* Enabled sslMode and useSystemTrustStore options for MariaDB.'

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}


# SIG # Begin signature block
# MIIoRgYJKoZIhvcNAQcCoIIoNzCCKDMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDSYFqan+5gOsFN
# oGcI8Khn4RdxrMtneKN3nBl9pXWic6CCDXYwggX0MIID3KADAgECAhMzAAADrzBA
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
# /Xmfwb1tbWrJUnMTDXpQzTGCGiYwghoiAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAOvMEAOTKNNBUEAAAAAA68wDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIA2wtRXV/AFnXAAObtraiqzX
# g/jtL3/wOndOeAskQWBaMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAypv6bpIKUGh1RuupGV7WKGGwJBch0u6LLndERwMF/HxpT9IbGZFH60BC
# Uj2oMGdywv5bM1scLBqn3vrC9Xaq2CYRa2YXGzfeSP7SqJowSHyurwEY9y82EVVo
# s8KXqwIsCzjXYXJ6OJlum/xslTGs5Kj/5mkMIVTYoUlyQuqPMjX7WoJIAJFjSgVs
# Fy3Wq4/KDQOwgYa+uB9mFGTpUvaMcId9FzLvtJU0WPueloLssvOmv7Tws9YUGIIp
# ykhMx8Ti+QzVyF7Jbu2bvLWmbDY1XUdzOnTK+g9zRFwHlPhy7ZT4CIWsMiyYyL1I
# 86xSEYv0659Vpc03ySkrvwvmaEStsaGCF7AwghesBgorBgEEAYI3AwMBMYIXnDCC
# F5gGCSqGSIb3DQEHAqCCF4kwgheFAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsq
# hkiG9w0BCRABBKCCAUkEggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCDCxoNcynmbuTSbnE5YZ8iXX7b0oFDreprNHRqiswO1iAIGZutRwDKO
# GBMyMDI0MTAwODA1MzUxMS4yNDNaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJl
# bGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVT
# Tjo0MzFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# U2VydmljZaCCEf4wggcoMIIFEKADAgECAhMzAAAB+vs7RNN3M8bTAAEAAAH6MA0G
# CSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0
# MDcyNTE4MzExMVoXDTI1MTAyMjE4MzExMVowgdMxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9w
# ZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjQzMUEt
# MDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNl
# MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAyhZVBM3PZcBfEpAf7fII
# hygwYVVP64USeZbSlRR3pvJebva0LQCDW45yOrtpwIpGyDGX+EbCbHhS5Td4J0Yl
# c83ztLEbbQD7M6kqR0Xj+n82cGse/QnMH0WRZLnwggJdenpQ6UciM4nMYZvdQjyb
# A4qejOe9Y073JlXv3VIbdkQH2JGyT8oB/LsvPL/kAnJ45oQIp7Sx57RPQ/0O6qay
# J2SJrwcjA8auMdAnZKOixFlzoooh7SyycI7BENHTpkVKrRV5YelRvWNTg1pH4EC2
# KO2bxsBN23btMeTvZFieGIr+D8mf1lQQs0Ht/tMOVdah14t7Yk+xl5P4Tw3xfAGg
# Hsvsa6ugrxwmKTTX1kqXH5XCdw3TVeKCax6JV+ygM5i1NroJKwBCW11Pwi0z/ki9
# 0ZeO6XfEE9mCnJm76Qcxi3tnW/Y/3ZumKQ6X/iVIJo7Lk0Z/pATRwAINqwdvzpdt
# X2hOJib4GR8is2bpKks04GurfweWPn9z6jY7GBC+js8pSwGewrffwgAbNKm82ZDF
# vqBGQQVJwIHSXpjkS+G39eyYOG2rcILBIDlzUzMFFJbNh5tDv3GeJ3EKvC4vNSAx
# tGfaG/mQhK43YjevsB72LouU78rxtNhuMXSzaHq5fFiG3zcsYHaa4+w+YmMrhTEz
# D4SAish35BjoXP1P1Ct4Va0CAwEAAaOCAUkwggFFMB0GA1UdDgQWBBRjjHKbL5WV
# 6kd06KocQHphK9U/vzAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBf
# BgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3Bz
# L2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmww
# bAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0El
# MjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUF
# BwMIMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAuFbCorFrvodG
# +ZNJH3Y+Nz5QpUytQVObOyYFrgcGrxq6MUa4yLmxN4xWdL1kygaW5BOZ3xBlPY7V
# puf5b5eaXP7qRq61xeOrX3f64kGiSWoRi9EJawJWCzJfUQRThDL4zxI2pYc1wnPp
# 7Q695bHqwZ02eaOBudh/IfEkGe0Ofj6IS3oyZsJP1yatcm4kBqIH6db1+weM4q46
# NhAfAf070zF6F+IpUHyhtMbQg5+QHfOuyBzrt67CiMJSKcJ3nMVyfNlnv6yvttYz
# LK3wS+0QwJUibLYJMI6FGcSuRxKlq6RjOhK9L3QOjh0VCM11rHM11ZmN0euJbbBC
# VfQEufOLNkG88MFCUNE10SSbM/Og/CbTko0M5wbVvQJ6CqLKjtHSoeoAGPeeX24f
# 5cPYyTcKlbM6LoUdO2P5JSdI5s1JF/On6LiUT50adpRstZajbYEeX/N7RvSbkn0d
# jD3BvT2Of3Wf9gIeaQIHbv1J2O/P5QOPQiVo8+0AKm6M0TKOduihhKxAt/6Yyk17
# Fv3RIdjT6wiL2qRIEsgOJp3fILw4mQRPu3spRfakSoQe5N0e4HWFf8WW2ZL0+c83
# Qzh3VtEPI6Y2e2BO/eWhTYbIbHpqYDfAtAYtaYIde87ZymXG3MO2wUjhL9HvSQzj
# oquq+OoUmvfBUcB2e5L6QCHO6qTO7WowggdxMIIFWaADAgECAhMzAAAAFcXna54C
# m0mZAAAAAAAVMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZp
# Y2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0yMTA5MzAxODIyMjVaFw0zMDA5MzAxODMy
# MjVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNV
# BAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEA5OGmTOe0ciELeaLL1yR5vQ7VgtP97pwHB9KpbE51
# yMo1V/YBf2xK4OK9uT4XYDP/XE/HZveVU3Fa4n5KWv64NmeFRiMMtY0Tz3cywBAY
# 6GB9alKDRLemjkZrBxTzxXb1hlDcwUTIcVxRMTegCjhuje3XD9gmU3w5YQJ6xKr9
# cmmvHaus9ja+NSZk2pg7uhp7M62AW36MEBydUv626GIl3GoPz130/o5Tz9bshVZN
# 7928jaTjkY+yOSxRnOlwaQ3KNi1wjjHINSi947SHJMPgyY9+tVSP3PoFVZhtaDua
# Rr3tpK56KTesy+uDRedGbsoy1cCGMFxPLOJiss254o2I5JasAUq7vnGpF1tnYN74
# kpEeHT39IM9zfUGaRnXNxF803RKJ1v2lIH1+/NmeRd+2ci/bfV+AutuqfjbsNkz2
# K26oElHovwUDo9Fzpk03dJQcNIIP8BDyt0cY7afomXw/TNuvXsLz1dhzPUNOwTM5
# TI4CvEJoLhDqhFFG4tG9ahhaYQFzymeiXtcodgLiMxhy16cg8ML6EgrXY28MyTZk
# i1ugpoMhXV8wdJGUlNi5UPkLiWHzNgY1GIRH29wb0f2y1BzFa/ZcUlFdEtsluq9Q
# BXpsxREdcu+N+VLEhReTwDwV2xo3xwgVGD94q0W29R6HXtqPnhZyacaue7e3Pmri
# Lq0CAwEAAaOCAd0wggHZMBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUC
# BBYEFCqnUv5kxJq+gpE8RjUpzxD/LwTuMB0GA1UdDgQWBBSfpxVdAF5iXYP05dJl
# pxtTNRnpcjBcBgNVHSAEVTBTMFEGDCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9y
# eS5odG0wEwYDVR0lBAwwCgYIKwYBBQUHAwgwGQYJKwYBBAGCNxQCBAweCgBTAHUA
# YgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU
# 1fZWy4/oolxiaNE9lJBb186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2Ny
# bC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIw
# MTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0w
# Ni0yMy5jcnQwDQYJKoZIhvcNAQELBQADggIBAJ1VffwqreEsH2cBMSRb4Z5yS/yp
# b+pcFLY+TkdkeLEGk5c9MTO1OdfCcTY/2mRsfNB1OW27DzHkwo/7bNGhlBgi7ulm
# ZzpTTd2YurYeeNg2LpypglYAA7AFvonoaeC6Ce5732pvvinLbtg/SHUB2RjebYIM
# 9W0jVOR4U3UkV7ndn/OOPcbzaN9l9qRWqveVtihVJ9AkvUCgvxm2EhIRXT0n4ECW
# OKz3+SmJw7wXsFSFQrP8DJ6LGYnn8AtqgcKBGUIZUnWKNsIdw2FzLixre24/LAl4
# FOmRsqlb30mjdAy87JGA0j3mSj5mO0+7hvoyGtmW9I/2kQH2zsZ0/fZMcm8Qq3Uw
# xTSwethQ/gpY3UA8x1RtnWN0SCyxTkctwRQEcb9k+SS+c23Kjgm9swFXSVRk2XPX
# fx5bRAGOWhmRaw2fpCjcZxkoJLo4S5pu+yFUa2pFEUep8beuyOiJXk+d0tBMdrVX
# VAmxaQFEfnyhYWxz/gq77EFmPWn9y8FBSX5+k77L+DvktxW/tM4+pTFRhLy/AsGC
# onsXHRWJjXD+57XQKBqJC4822rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdCPSWU
# 5nR0W2rRnj7tfqAxM328y+l7vzhwRNGQ8cirOoo6CGJ/2XBjU02N7oJtpQUQwXEG
# ahC0HVUzWLOhcGbyoYIDWTCCAkECAQEwggEBoYHZpIHWMIHTMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJl
# bGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVT
# Tjo0MzFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# U2VydmljZaIjCgEBMAcGBSsOAwIaAxUA94Z+bUJn+nKwBvII6sg0Ny7aPDaggYMw
# gYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsF
# AAIFAOqu26kwIhgPMjAyNDEwMDcyMjE0MDFaGA8yMDI0MTAwODIyMTQwMVowdzA9
# BgorBgEEAYRZCgQBMS8wLTAKAgUA6q7bqQIBADAKAgEAAgJFwAIB/zAHAgEAAgIU
# DDAKAgUA6rAtKQIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAow
# CAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBCwUAA4IBAQA/YLwUAL+x
# LS0KydIvn73Q1DERcA6J9nVl+aPvPES3nQcNa3prRvrA331Ote1F+xRtJvEx15EA
# s3iqPvxyW1O2AUUVPcUojtIMW9WEmcPmR/6W25dxD+6M8o/thvfahklg1DhHQA2r
# p/BZCUNYT1rk2qeScCrE8F6WLoI0y0XsEjPL2UEYdH5sh46hhBRpHRp/LgS0Zw/4
# 2z0bjSk6dDo4fbKnankTuaIncw1S1ZfoYREZVHP2KOnwv2UczC97biimi5i3WW7+
# wAFHLX+WJ05mjaopZCJ2v1fCqrLGbuR0u491uIIdbGzTf32CEdWFNyJ9+o71sUWR
# 0yGdYPDaSVksMYIEDTCCBAkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAH6+ztE03czxtMAAQAAAfowDQYJYIZIAWUDBAIBBQCgggFKMBoG
# CSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgmBCHj6nc
# 2NUK7bVlbmknYVeBmF52jw15j7VdUja9BTowgfoGCyqGSIb3DQEJEAIvMYHqMIHn
# MIHkMIG9BCB98n8tya8+B2jjU/dpJRIwHwHHpco5ogNStYocbkOeVjCBmDCBgKR+
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB+vs7RNN3M8bTAAEA
# AAH6MCIEICUGWrHZ0jEgzq55byRcFAtgBtCQSOieELvHnIMmucR9MA0GCSqGSIb3
# DQEBCwUABIICAAgcWKFU6DK4v67bCaaiwjUllylQDv3TmsSCNWN8QG47PAPgEURZ
# dHtRaNcSxvPlvfWRFnP/Y31hU7g3MplRc8z9BSHG/Otnk6fHHkbFOOGQPtzNvgJF
# QRLuYOC03jw+QCh4Ah9LU4LLzCGw/EBzQfA0YIRUDM6U7tS6jYDzCD4GxM0+5mF+
# dfQkPs5+ttLBGH6GApebc9ASP5PRSi+iCgATgPKwmDceXdtQ1E+UvHZrCHOyInZV
# olQkMMjlpWK2bz2L56Szxu/4TnszcySfbf2xLNA7mlTicNrF6hMYvh1xMwtUtqlS
# 0g/3m4DS5aPVWClT42KIRdb9lO/J/RFKI+CXuSmU+ZS0zd7bxRvCfZHPWNW8yFFS
# CdeXmXpuEGUzcQRNOnO7Xtb6aZcd74wlTYMxN1CnO9TvUuxfQFwqOZb19t9vTKPP
# 542MO9bVwQAt2pD3HwVsnQ/EDJ2D4gvGQ+xs+Cq9PkXlMhH3fn8UgbOcZPoNObTT
# z5aJFoFhqppt3KeHNGQY5vEY4K9EUq4KXVF+KtQSQIKOSBpvk+ZjyFbiilxe50MW
# 2PbvJgSz0dqSIsmHO6ZKixffLN7fjpuRrTOiE9hsHEWVSX8gPC30G8RayLpls+8K
# hcrY7JVP6uZEM1IUmTu7gk+5J/DC2dMnqTJeCSAUj77L5hnksBGpwZ/a
# SIG # End signature block
