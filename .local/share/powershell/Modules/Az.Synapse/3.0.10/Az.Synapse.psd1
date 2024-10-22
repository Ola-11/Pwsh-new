#
# Module manifest for module 'Az.Synapse'
#
# Generated by: Microsoft Corporation
#
# Generated on: 8/29/2024
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Az.Synapse.psm1'

# Version number of this module.
ModuleVersion = '3.0.10'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = '89eceb4f-9916-4ec5-8499-d5cca97a9cae'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Azure PowerShell - Azure Synapse Analytics in Windows PowerShell and PowerShell Core.

For more information on Azure Synapse Analytics, please visit the following: https://azure.microsoft.com/en-us/services/synapse-analytics/'

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
RequiredAssemblies = 'Azure.Analytics.Synapse.AccessControl.dll', 
               'Azure.Analytics.Synapse.Artifacts.dll', 
               'Azure.Analytics.Synapse.ManagedPrivateEndpoints.dll', 
               'Azure.Analytics.Synapse.Spark.dll', 
               'Microsoft.Azure.Management.Synapse.dll', 
               'Microsoft.DataTransfer.Gateway.Encryption.dll', 
               'Synapse.Autorest/bin/Az.Synapse.private.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 'Synapse.Autorest\Az.Synapse.format.ps1xml', 
               'Synapse.format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('Az.Synapse.psm1', 'Synapse.Autorest/Az.Synapse.psm1')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Add-AzSynapseKustoPoolLanguageExtension', 'Get-AzSynapseKustoPool', 
               'Get-AzSynapseKustoPoolAttachedDatabaseConfiguration', 
               'Get-AzSynapseKustoPoolDatabase', 
               'Get-AzSynapseKustoPoolDatabasePrincipalAssignment', 
               'Get-AzSynapseKustoPoolDataConnection', 
               'Get-AzSynapseKustoPoolFollowerDatabase', 
               'Get-AzSynapseKustoPoolLanguageExtension', 
               'Get-AzSynapseKustoPoolPrincipalAssignment', 
               'Get-AzSynapseKustoPoolSku', 
               'Invoke-AzSynapseDetachKustoPoolFollowerDatabase', 
               'New-AzSynapseKustoPool', 
               'New-AzSynapseKustoPoolAttachedDatabaseConfiguration', 
               'New-AzSynapseKustoPoolDatabase', 
               'New-AzSynapseKustoPoolDatabasePrincipalAssignment', 
               'New-AzSynapseKustoPoolDataConnection', 
               'New-AzSynapseKustoPoolPrincipalAssignment', 
               'Remove-AzSynapseKustoPool', 
               'Remove-AzSynapseKustoPoolAttachedDatabaseConfiguration', 
               'Remove-AzSynapseKustoPoolDatabase', 
               'Remove-AzSynapseKustoPoolDatabasePrincipalAssignment', 
               'Remove-AzSynapseKustoPoolDataConnection', 
               'Remove-AzSynapseKustoPoolLanguageExtension', 
               'Remove-AzSynapseKustoPoolPrincipalAssignment', 
               'Start-AzSynapseKustoPool', 'Stop-AzSynapseKustoPool', 
               'Update-AzSynapseKustoPool', 'Update-AzSynapseKustoPoolDatabase', 
               'Update-AzSynapseKustoPoolDataConnection'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = 'Add-AzSynapseDataFlowDebugSessionPackage', 
               'Add-AzSynapseTriggerSubscription', 
               'Clear-AzSynapseSqlPoolVulnerabilityAssessmentRuleBaseline', 
               'Convert-AzSynapseSqlPoolVulnerabilityAssessmentScan', 
               'Disable-AzSynapseActiveDirectoryOnlyAuthentication', 
               'Disable-AzSynapseSqlAdvancedDataSecurity', 
               'Disable-AzSynapseSqlPoolSensitivityRecommendation', 
               'Enable-AzSynapseActiveDirectoryOnlyAuthentication', 
               'Enable-AzSynapseSqlAdvancedDataSecurity', 
               'Enable-AzSynapseSqlPoolSensitivityRecommendation', 
               'Enable-AzSynapseWorkspace', 'Export-AzSynapseKqlScript', 
               'Export-AzSynapseNotebook', 'Export-AzSynapseSparkConfiguration', 
               'Export-AzSynapseSqlScript', 
               'Get-AzSynapseActiveDirectoryOnlyAuthentication', 
               'Get-AzSynapseActivityRun', 'Get-AzSynapseDataFlow', 
               'Get-AzSynapseDataFlowDebugSession', 'Get-AzSynapseDataset', 
               'Get-AzSynapseDroppedSqlPool', 'Get-AzSynapseFirewallRule', 
               'Get-AzSynapseIntegrationRuntime', 
               'Get-AzSynapseIntegrationRuntimeKey', 
               'Get-AzSynapseIntegrationRuntimeMetric', 
               'Get-AzSynapseIntegrationRuntimeNode', 'Get-AzSynapseKqlScript', 
               'Get-AzSynapseLinkConnection', 
               'Get-AzSynapseLinkConnectionDetailedStatus', 
               'Get-AzSynapseLinkConnectionLinkTable', 
               'Get-AzSynapseLinkConnectionLinkTableStatus', 
               'Get-AzSynapseLinkedService', 
               'Get-AzSynapseManagedIdentitySqlControlSetting', 
               'Get-AzSynapseManagedPrivateEndpoint', 'Get-AzSynapseNotebook', 
               'Get-AzSynapsePipeline', 'Get-AzSynapsePipelineRun', 
               'Get-AzSynapseRoleAssignment', 'Get-AzSynapseRoleDefinition', 
               'Get-AzSynapseRoleScope', 'Get-AzSynapseSparkConfiguration', 
               'Get-AzSynapseSparkJob', 'Get-AzSynapseSparkJobDefinition', 
               'Get-AzSynapseSparkPool', 'Get-AzSynapseSparkSession', 
               'Get-AzSynapseSparkStatement', 
               'Get-AzSynapseSqlActiveDirectoryAdministrator', 
               'Get-AzSynapseSqlAdvancedDataSecurityPolicy', 
               'Get-AzSynapseSqlAdvancedThreatProtectionSetting', 
               'Get-AzSynapseSqlAuditSetting', 'Get-AzSynapseSqlDatabase', 
               'Get-AzSynapseSqlPool', 
               'Get-AzSynapseSqlPoolAdvancedThreatProtectionSetting', 
               'Get-AzSynapseSqlPoolAuditSetting', 'Get-AzSynapseSqlPoolGeoBackup', 
               'Get-AzSynapseSqlPoolRestorePoint', 
               'Get-AzSynapseSqlPoolSensitivityClassification', 
               'Get-AzSynapseSqlPoolSensitivityRecommendation', 
               'Get-AzSynapseSqlPoolTransparentDataEncryption', 
               'Get-AzSynapseSqlPoolVulnerabilityAssessmentRuleBaseline', 
               'Get-AzSynapseSqlPoolVulnerabilityAssessmentScanRecord', 
               'Get-AzSynapseSqlPoolVulnerabilityAssessmentSetting', 
               'Get-AzSynapseSqlScript', 
               'Get-AzSynapseSqlVulnerabilityAssessmentSetting', 
               'Get-AzSynapseTrigger', 'Get-AzSynapseTriggerRun', 
               'Get-AzSynapseTriggerSubscriptionStatus', 'Get-AzSynapseWorkspace', 
               'Get-AzSynapseWorkspaceKey', 'Get-AzSynapseWorkspacePackage', 
               'Invoke-AzSynapseDataFlowDebugSessionCommand', 
               'Invoke-AzSynapseIntegrationRuntimeUpgrade', 
               'Invoke-AzSynapsePipeline', 'Invoke-AzSynapseSparkStatement', 
               'Invoke-AzSynapseTriggerRun', 'New-AzSynapseFirewallRule', 
               'New-AzSynapseGitRepositoryConfig', 
               'New-AzSynapseIntegrationRuntimeKey', 'New-AzSynapseKqlScript', 
               'New-AzSynapseLinkedServiceEncryptedCredential', 
               'New-AzSynapseManagedPrivateEndpoint', 
               'New-AzSynapseManagedVirtualNetworkConfig', 
               'New-AzSynapseRoleAssignment', 'New-AzSynapseSparkConfiguration', 
               'New-AzSynapseSparkPool', 'New-AzSynapseSqlDatabase', 
               'New-AzSynapseSqlPool', 'New-AzSynapseSqlPoolRestorePoint', 
               'New-AzSynapseWorkspace', 'New-AzSynapseWorkspaceKey', 
               'New-AzSynapseWorkspacePackage', 'Remove-AzSynapseDataFlow', 
               'Remove-AzSynapseDataset', 'Remove-AzSynapseFirewallRule', 
               'Remove-AzSynapseIntegrationRuntime', 
               'Remove-AzSynapseIntegrationRuntimeNode', 
               'Remove-AzSynapseKqlScript', 'Remove-AzSynapseLinkConnection', 
               'Remove-AzSynapseLinkedService', 
               'Remove-AzSynapseManagedPrivateEndpoint', 
               'Remove-AzSynapseNotebook', 'Remove-AzSynapsePipeline', 
               'Remove-AzSynapseRoleAssignment', 
               'Remove-AzSynapseSparkConfiguration', 
               'Remove-AzSynapseSparkJobDefinition', 'Remove-AzSynapseSparkPool', 
               'Remove-AzSynapseSqlActiveDirectoryAdministrator', 
               'Remove-AzSynapseSqlDatabase', 'Remove-AzSynapseSqlPool', 
               'Remove-AzSynapseSqlPoolRestorePoint', 
               'Remove-AzSynapseSqlPoolSensitivityClassification', 
               'Remove-AzSynapseSqlScript', 'Remove-AzSynapseTrigger', 
               'Remove-AzSynapseTriggerSubscription', 'Remove-AzSynapseWorkspace', 
               'Remove-AzSynapseWorkspaceKey', 'Remove-AzSynapseWorkspacePackage', 
               'Reset-AzSynapseSparkSessionTimeout', 
               'Reset-AzSynapseSqlAdvancedThreatProtectionSetting', 
               'Reset-AzSynapseSqlAuditSetting', 
               'Reset-AzSynapseSqlPoolAdvancedThreatProtectionSetting', 
               'Reset-AzSynapseSqlPoolAuditSetting', 
               'Reset-AzSynapseSqlPoolVulnerabilityAssessmentSetting', 
               'Reset-AzSynapseSqlVulnerabilityAssessmentSetting', 
               'Restore-AzSynapseSqlPool', 'Resume-AzSynapseSqlPool', 
               'Set-AzSynapseDataFlow', 'Set-AzSynapseDataset', 
               'Set-AzSynapseIntegrationRuntime', 'Set-AzSynapseLinkConnection', 
               'Set-AzSynapseLinkConnectionLinkTable', 
               'Set-AzSynapseLinkedService', 
               'Set-AzSynapseManagedIdentitySqlControlSetting', 
               'Set-AzSynapseNotebook', 'Set-AzSynapsePipeline', 
               'Set-AzSynapseSparkJobDefinition', 
               'Set-AzSynapseSqlActiveDirectoryAdministrator', 
               'Set-AzSynapseSqlAuditSetting', 'Set-AzSynapseSqlPoolAuditSetting', 
               'Set-AzSynapseSqlPoolSensitivityClassification', 
               'Set-AzSynapseSqlPoolTransparentDataEncryption', 
               'Set-AzSynapseSqlPoolVulnerabilityAssessmentRuleBaseline', 
               'Set-AzSynapseSqlScript', 'Set-AzSynapseTrigger', 
               'Start-AzSynapseDataFlowDebugSession', 
               'Start-AzSynapseIntegrationRuntime', 
               'Start-AzSynapseLinkConnection', 'Start-AzSynapseSparkSession', 
               'Start-AzSynapseSqlPoolVulnerabilityAssessmentScan', 
               'Start-AzSynapseTrigger', 'Stop-AzSynapseDataFlowDebugSession', 
               'Stop-AzSynapseIntegrationRuntime', 'Stop-AzSynapseLinkConnection', 
               'Stop-AzSynapsePipelineRun', 'Stop-AzSynapseSparkJob', 
               'Stop-AzSynapseSparkSession', 'Stop-AzSynapseSparkStatement', 
               'Stop-AzSynapseTrigger', 'Stop-AzSynapseTriggerRun', 
               'Submit-AzSynapseSparkJob', 'Suspend-AzSynapseSqlPool', 
               'Sync-AzSynapseIntegrationRuntimeCredential', 
               'Test-AzSynapseSparkPool', 'Test-AzSynapseSqlDatabase', 
               'Test-AzSynapseSqlPool', 'Test-AzSynapseWorkspace', 
               'Update-AzSynapseFirewallRule', 
               'Update-AzSynapseIntegrationRuntime', 
               'Update-AzSynapseIntegrationRuntimeNode', 
               'Update-AzSynapseLinkConnectionLandingZoneCredential', 
               'Update-AzSynapseManagedVirtualNetworkConfig', 
               'Update-AzSynapseSparkPool', 
               'Update-AzSynapseSqlAdvancedThreatProtectionSetting', 
               'Update-AzSynapseSqlDatabase', 'Update-AzSynapseSqlPool', 
               'Update-AzSynapseSqlPoolAdvancedThreatProtectionSetting', 
               'Update-AzSynapseSqlPoolVulnerabilityAssessmentSetting', 
               'Update-AzSynapseSqlVulnerabilityAssessmentSetting', 
               'Update-AzSynapseWorkspace', 'Wait-AzSynapseSparkJob'

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Clear-AzSynapseSqlAdvancedThreatProtectionSetting', 
               'Clear-AzSynapseSqlPoolAdvancedThreatProtectionSetting', 
               'Clear-AzSynapseSqlPoolVulnerabilityAssessmentSetting', 
               'Clear-AzSynapseSqlVulnerabilityAssessmentSetting', 
               'Disable-AzSynapseSqlAdvancedThreatProtection', 
               'Enable-AzSynapseSqlAdvancedThreatProtection', 
               'Get-AzSynapseSqlAudit', 'Get-AzSynapseSqlPoolAudit', 
               'Import-AzSynapseKqlScript', 'Import-AzSynapseNotebook', 
               'Import-AzSynapseSparkConfiguration', 'Import-AzSynapseSqlScript', 
               'New-AzSynapseDataFlow', 'New-AzSynapseDataset', 
               'New-AzSynapseLinkConnection', 'New-AzSynapseLinkedService', 
               'New-AzSynapseNotebook', 'New-AzSynapsePipeline', 
               'New-AzSynapseSparkJobDefinition', 'New-AzSynapseSqlScript', 
               'New-AzSynapseTrigger', 'Remove-AzSynapseSqlAudit', 
               'Remove-AzSynapseSqlPoolAudit', 'Set-AzSynapseKqlScript', 
               'Set-AzSynapseManagedPrivateEndpoint', 
               'Set-AzSynapseSparkConfiguration', 'Set-AzSynapseSqlAudit', 
               'Set-AzSynapseSqlPoolAudit'

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
        Tags = 'Azure','ResourceManager','ARM','Synapse','Analytics'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/azps-license'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Fixed secrets exposure in example documentation.'

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
# MIIoLQYJKoZIhvcNAQcCoIIoHjCCKBoCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA7kklw9D9d+Jck
# 4cz3QMV1Rtl9vuwHp+NwBDILu55h3qCCDXYwggX0MIID3KADAgECAhMzAAADrzBA
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
# /Xmfwb1tbWrJUnMTDXpQzTGCGg0wghoJAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAOvMEAOTKNNBUEAAAAAA68wDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIKTc1yiSXOQ9xCxwLfSmakn5
# se30S5Fro5CHFA8pfq7CMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAl5HpSnIqdt6R/aBBqElNaxHRycsHk2rOVWkQJzYjJrsqSX7E50cVv8NT
# vMEfFDDCBo3eC3wYMPYDY/SMoDENs1Ct0uvKTA79MxWhiETu+RP5tQEBHGUGsI4i
# V5M9vyYahylknpemVsmykkGQG7FSA617RpUmc1bt/YinPUxfNsqRZ+GmiaI/MJwL
# xqHhLaDh6JCnV027L3AiPc9VQXH3t8Pf0Efn5adIlCH6YrAMn08xmO1skn60QNEk
# ajBSx6vFef3rOTR3hBPYGl0KEZQNPUWSM1kJRvDdrWWq9Bbx6FBcEHKyg5qjm3rA
# v685A9hNWt0uqEGB+EhHxxYP0igWhqGCF5cwgheTBgorBgEEAYI3AwMBMYIXgzCC
# F38GCSqGSIb3DQEHAqCCF3AwghdsAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFSBgsq
# hkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCCQpyvHCWqcWEa9YdpYAKWk2xuW4dz3NZaSsN6D+5QvCwIGZr4lXx/D
# GBMyMDI0MDgyOTAzMzEwNy43MDVaMASAAgH0oIHRpIHOMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046MzcwMy0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wg
# ghHtMIIHIDCCBQigAwIBAgITMwAAAeqaJHLVWT9hYwABAAAB6jANBgkqhkiG9w0B
# AQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMzEyMDYxODQ1
# MzBaFw0yNTAzMDUxODQ1MzBaMIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25z
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046MzcwMy0wNUUwLUQ5NDcxJTAjBgNV
# BAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQC1C1/xSD8gB9X7Ludoo2rWb2ksqaF65QtJkbQpmsc6
# G4bg5MOv6WP/uJ4XOJvKX/c1t0ej4oWBqdGD6VbjXX4T0KfylTulrzKtgxnxZh7q
# 1uD0Dy/w5G0DJDPb6oxQrz6vMV2Z3y9ZxjfZqBnDfqGon/4VDHnZhdas22svSC5G
# HywsQ2J90MM7L4ecY8TnLI85kXXTVESb09txL2tHMYrB+KHCy08ds36an7IcOGfR
# mhHbFoPa5om9YGpVKS8xeT7EAwW7WbXL/lo5p9KRRIjAlsBBHD1TdGBucrGC3TQX
# STp9s7DjkvvNFuUa0BKsz6UiCLxJGQSZhd2iOJTEfJ1fxYk2nY6SCKsV+VmtV5ai
# PzY/sWoFY542+zzrAPr4elrvr9uB6ci/Kci//EOERZEUTBPXME/ia+t8jrT2y3ug
# 15MSCVuhOsNrmuZFwaRCrRED0yz4V9wlMTGHIJW55iNM3HPVJJ19vOSvrCP9lsEc
# EwWZIQ1FCyPOnkM1fs7880dahAa5UmPqMk5WEKxzDPVp081X5RQ6HGVUz6ZdgQ0j
# cT59EG+CKDPRD6mx8ovzIpS/r/wEHPKt5kOhYrjyQHXc9KHKTWfXpAVj1Syqt5X4
# nr+Mpeubv+N/PjQEPr0iYJDjSzJrqILhBs5pytb6vyR8HUVMp+mAA4rXjOw42vkH
# fQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFCuBRSWiUebpF0BU1MTIcosFblleMB8G
# A1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYwVKBSoFCG
# Tmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUy
# MFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcBAQRgMF4w
# XAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY2Vy
# dHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3J0MAwG
# A1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQD
# AgeAMA0GCSqGSIb3DQEBCwUAA4ICAQAog61WXj9+/nxVbX3G37KgvyoNAnuu2w3H
# oWZj3H0YCeQ3b9KSZThVThW4iFcHrKnhFMBbXJX4uQI53kOWSaWCaV3xCznpRt3c
# 4/gSn3dvO/1GP3MJkpJfgo56CgS9zLOiP31kfmpUdPqekZb4ivMR6LoPb5HNlq0W
# bBpzFbtsTjNrTyfqqcqAwc6r99Df2UQTqDa0vzwpA8CxiAg2KlbPyMwBOPcr9hJT
# 8sGpX/ZhLDh11dZcbUAzXHo1RJorSSftVa9hLWnzxGzEGafPUwLmoETihOGLqIQl
# Cpvr94Hiak0Gq0wY6lduUQjk/lxZ4EzAw/cGMek8J3QdiNS8u9ujYh1B7NLr6t3I
# glfScDV3bdVWet1itTUoKVRLIivRDwAT7dRH13Cq32j2JG5BYu/XitRE8cdzaJmD
# VBzYhlPl9QXvC+6qR8I6NIN/9914bTq/S4g6FF4f1dixUxE4qlfUPMixGr0Ft4/S
# 0P4fwmhs+WHRn62PB4j3zCHixKJCsRn9IR3ExBQKQdMi5auiqB6xQBADUf+F7hSK
# ZfbA8sFSFreLSqhvj+qUQF84NcxuaxpbJWVpsO18IL4Qbt45Cz/QMa7EmMGNn7a8
# MM3uTQOlQy0u6c/jq111i1JqMjayTceQZNMBMM5EMc5Dr5m3T4bDj9WTNLgP8SFe
# 3EqTaWVMOTCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZI
# hvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
# DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24x
# MjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eSAy
# MDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoIC
# AQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg4r25Phdg
# M/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aORmsHFPPF
# dvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41JmTamDu6
# GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5LFGc6XBp
# Dco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL64NF50Zu
# yjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9QZpGdc3E
# XzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj0XOmTTd0
# lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqEUUbi0b1q
# GFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0kZSU2LlQ
# +QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435UsSFF5PA
# PBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB3TCCAdkw
# EgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTEmr6CkTxG
# NSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwGA1UdIARV
# MFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNVHSUEDDAK
# BggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMC
# AYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvX
# zpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20v
# cGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYI
# KwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDANBgkqhkiG
# 9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4sQaTlz0x
# M7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th542DYunKmC
# VgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRXud2f8449
# xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBewVIVCs/wM
# nosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0DLzskYDS
# PeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB62FD+CljdQDzHVG2d
# Y3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFrDZ+kKNxn
# GSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFhbHP+Crvs
# QWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7ntdAoGokL
# jzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+oDEzfbzL
# 6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6FwZvKhggNQ
# MIICOAIBATCB+aGB0aSBzjCByzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEn
# MCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjM3MDMtMDVFMC1EOTQ3MSUwIwYDVQQD
# ExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQCJ
# 2x7cQfjpRskJ8UGIctOCkmEkj6CBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6nnGIjAiGA8yMDI0MDgyODE1NTIw
# MloYDzIwMjQwODI5MTU1MjAyWjB3MD0GCisGAQQBhFkKBAExLzAtMAoCBQDqecYi
# AgEAMAoCAQACAhGDAgH/MAcCAQACAhNbMAoCBQDqexeiAgEAMDYGCisGAQQBhFkK
# BAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJ
# KoZIhvcNAQELBQADggEBAEHfobgGuFkkivILCYshJufoO9D14ThCf5sd3CU1g1a1
# 4AAvFmOZdy0wZOVHHPcgcvrB+afZGDVAJQzMHCdK11ePvZgj1w5XPwPdlH7cDTQG
# DGucNP2TKdjyFSyHT3Usohus3YkfA9SnGmVG2k1uf8Qe5CzUON2I40xCcDFX2bpV
# ea6wpDlPXcWljM/Cc+Uyro3yyZSmBJCllk8+QfShJ+whAm+PiOuj+it3JSLp94QN
# P6ZK3iHM6jwyviRq3G4F5+CJ/e0pOumUJtDqB5IkiHvwbmiTFVX7TqDXEeUxiuYV
# tYZ2QxnVjMlVlRbOXCjFXAUdv7I/jywvV+wbVSDA7QsxggQNMIIECQIBATCBkzB8
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1N
# aWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAeqaJHLVWT9hYwABAAAB
# 6jANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEE
# MC8GCSqGSIb3DQEJBDEiBCADv1u5SKW2plJwVdaER+XymV3MXICbCaTWs3Ho6okb
# 5DCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EICmPodXjZDR4iwg0ltLANXBh
# 5G1uKqKIvq8sjKekuGZ4MIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAHqmiRy1Vk/YWMAAQAAAeowIgQgzgXLiqDGidJ65P9HNYVrMD56
# Dnntjh/i6scArx6pFFIwDQYJKoZIhvcNAQELBQAEggIAa4tYlX9nA8A2+he5Fwu6
# 6qdXmqrCA+jM23IVM5tb7eT9pAEd1ATy9B73IKQLKwenmxWgTXmTxrNNcZS9pX0z
# e+NSN83JgFBNNSF41DiXfJT+3MYSUQ2XzOYag+tGbPJ22LC18wRpFH1cbq6yvylj
# ZLtqrCAGe+GTxjgbbVCU29aYYCwaj2omGqFmVwe7pmcRJW8yszk+zRaeHr1vzzz1
# M3g1t1HfzqBoULxOJrGSL0Lhs0AJHYIJBgDZBQDVQAfPFjXoegDPkqma7FcVRvvI
# 0ghbvCboDi1GBGZq0Mc09Omflojx+oG5dIZL4nCfhJsgSrpjs5msQqdPt3eff+cP
# aB5LmUanI5NizQRYEmTIDWTLbbqfNSJl15fKF4Bpqwx/U/OwRS8TWXDgLNI9spXh
# r2jQc5J4hSt7CgPwYZWERBtRI1UFIyGiSXWikAqmMBOfxnvSGgsoeInTTwRAIHY1
# PYAyt7yuzKp/329y3jla5Ec3OUyk6AiG8QALeDm/vMekQBxzMMWPiyvgkyVYeObF
# 3fb8ntwqDFnh/o/MqbHL/T8DtrK75yHl7f4CLJWfED40NnNFKTA+Qx+eFBLggrUi
# Z3tgBid9wfVdbElMxb32RatgS93Rj2sKYAYEy46UNtrbq3nDXFnE+bH4aDaXTczH
# nwk+dFooo+D3SyhX+qjqjVM=
# SIG # End signature block
