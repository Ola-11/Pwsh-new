#
# Module manifest for module 'Az.MachineLearningServices'
#
# Generated by: Microsoft Corporation
#
# Generated on: 7/31/2024
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Az.MachineLearningServices.psm1'

# Version number of this module.
ModuleVersion = '1.1.0'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = '56293047-9014-4c88-96b7-98b69c3b687d'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Azure PowerShell: MachineLearningServices cmdlets'

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
RequiredAssemblies = 
               'MachineLearningServices.Autorest/bin/Az.MachineLearningServices.private.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 
               'MachineLearningServices.Autorest/Az.MachineLearningServices.format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('MachineLearningServices.Autorest/Az.MachineLearningServices.psm1')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Get-AzMLServiceQuota', 'Get-AzMLServiceUsage', 
               'Get-AzMLServiceVMSize', 'Get-AzMLWorkspace', 
               'Get-AzMLWorkspaceBatchDeployment', 
               'Get-AzMLWorkspaceBatchEndpoint', 'Get-AzMLWorkspaceCodeVersion', 
               'Get-AzMLWorkspaceComponentContainer', 
               'Get-AzMLWorkspaceComponentVersion', 'Get-AzMLWorkspaceCompute', 
               'Get-AzMLWorkspaceComputeKey', 'Get-AzMLWorkspaceComputeNode', 
               'Get-AzMLWorkspaceConnection', 'Get-AzMLWorkspaceDataContainer', 
               'Get-AzMLWorkspaceDatastore', 'Get-AzMLWorkspaceDatastoreSecret', 
               'Get-AzMLWorkspaceDataVersion', 
               'Get-AzMLWorkspaceEnvironmentContainer', 
               'Get-AzMLWorkspaceEnvironmentVersion', 'Get-AzMLWorkspaceFeature', 
               'Get-AzMLWorkspaceJob', 'Get-AzMLWorkspaceKey', 
               'Get-AzMLWorkspaceModelContainer', 'Get-AzMLWorkspaceModelVersion', 
               'Get-AzMLWorkspaceNotebookAccessToken', 
               'Get-AzMLWorkspaceNotebookKey', 'Get-AzMLWorkspaceOnlineDeployment', 
               'Get-AzMLWorkspaceOnlineDeploymentLog', 
               'Get-AzMLWorkspaceOnlineDeploymentSku', 
               'Get-AzMLWorkspaceOnlineEndpoint', 
               'Get-AzMLWorkspaceOnlineEndpointKey', 
               'Get-AzMLWorkspaceOnlineEndpointToken', 
               'Get-AzMLWorkspaceOutboundNetworkDependencyEndpoint', 
               'Get-AzMLWorkspaceStorageAccountKey', 
               'Invoke-AzMLWorkspaceDiagnose', 'Invoke-AzMLWorkspaceNotebook', 
               'New-AzMLWorkspace', 
               'New-AzMLWorkspaceAadAuthTypeWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceAccessKeyAuthTypeWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceAccountKeyAuthTypeWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceAksObject', 'New-AzMLWorkspaceAmlComputeObject', 
               'New-AzMLWorkspaceApiKeyAuthWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceBatchDeployment', 
               'New-AzMLWorkspaceBatchEndpoint', 'New-AzMLWorkspaceCodeVersion', 
               'New-AzMLWorkspaceCommandJobObject', 
               'New-AzMLWorkspaceComponentContainer', 
               'New-AzMLWorkspaceComponentVersion', 'New-AzMLWorkspaceCompute', 
               'New-AzMLWorkspaceComputeInstanceObject', 
               'New-AzMLWorkspaceComputeStartStopScheduleObject', 
               'New-AzMLWorkspaceConnection', 
               'New-AzMLWorkspaceCustomKeysWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceCustomModelJobInputObject', 
               'New-AzMLWorkspaceCustomModelJobOutputObject', 
               'New-AzMLWorkspaceDatabricksObject', 
               'New-AzMLWorkspaceDataContainer', 
               'New-AzMLWorkspaceDataFactoryObject', 
               'New-AzMLWorkspaceDataLakeAnalyticsObject', 
               'New-AzMLWorkspaceDataPathAssetReferenceObject', 
               'New-AzMLWorkspaceDatastore', 
               'New-AzMLWorkspaceDatastoreBlobObject', 
               'New-AzMLWorkspaceDatastoreCredentialObject', 
               'New-AzMLWorkspaceDatastoreDataLakeGen1Object', 
               'New-AzMLWorkspaceDatastoreDataLakeGen2Object', 
               'New-AzMLWorkspaceDatastoreFileObject', 
               'New-AzMLWorkspaceDatastoreKeyCredentialObject', 
               'New-AzMLWorkspaceDatastoreNoneCredentialObject', 
               'New-AzMLWorkspaceDatastoreSasCredentialObject', 
               'New-AzMLWorkspaceDatastoreServicePrincipalCredentialObject', 
               'New-AzMLWorkspaceDataVersion', 
               'New-AzMLWorkspaceEnvironmentVersion', 
               'New-AzMLWorkspaceHDInsightObject', 
               'New-AzMLWorkspaceIdAssetReferenceObject', 'New-AzMLWorkspaceJob', 
               'New-AzMLWorkspaceJobServiceObject', 
               'New-AzMLWorkspaceKubernetesObject', 
               'New-AzMLWorkspaceLiteralJobInputObject', 
               'New-AzMLWorkspaceManagedIdentityAuthTypeWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceMLFlowModelJobInputObject', 
               'New-AzMLWorkspaceMLFlowModelJobOutputObject', 
               'New-AzMLWorkspaceMLTableJobInputObject', 
               'New-AzMLWorkspaceMLTableJobOutputObject', 
               'New-AzMLWorkspaceModelContainer', 'New-AzMLWorkspaceModelVersion', 
               'New-AzMLWorkspaceNoneAuthTypeWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceOAuth2AuthTypeWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceOnlineDeployment', 
               'New-AzMLWorkspaceOnlineEndpoint', 
               'New-AzMLWorkspaceOnlineEndpointKey', 
               'New-AzMLWorkspaceOutputPathAssetReferenceObject', 
               'New-AzMLWorkspacePatAuthTypeWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspacePipelineJobObject', 
               'New-AzMLWorkspaceQuotaPropertiesObject', 
               'New-AzMLWorkspaceSasAuthTypeWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceServicePrincipalAuthTypeWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceSharedPrivateLinkResourceObject', 
               'New-AzMLWorkspaceSweepJobObject', 
               'New-AzMLWorkspaceSynapseSparkObject', 
               'New-AzMLWorkspaceTritonModelJobInputObject', 
               'New-AzMLWorkspaceTritonModelJobOutputObject', 
               'New-AzMLWorkspaceUriFileJobInputObject', 
               'New-AzMLWorkspaceUriFileJobOutputObject', 
               'New-AzMLWorkspaceUriFolderJobInputObject', 
               'New-AzMLWorkspaceUriFolderJobOutputObject', 
               'New-AzMLWorkspaceUsernamePasswordAuthTypeWorkspaceConnectionPropertiesObject', 
               'New-AzMLWorkspaceVirtualMachineObject', 'Remove-AzMLWorkspace', 
               'Remove-AzMLWorkspaceBatchDeployment', 
               'Remove-AzMLWorkspaceBatchEndpoint', 
               'Remove-AzMLWorkspaceCodeVersion', 
               'Remove-AzMLWorkspaceComponentContainer', 
               'Remove-AzMLWorkspaceComponentVersion', 
               'Remove-AzMLWorkspaceCompute', 'Remove-AzMLWorkspaceConnection', 
               'Remove-AzMLWorkspaceDataContainer', 
               'Remove-AzMLWorkspaceDatastore', 'Remove-AzMLWorkspaceDataVersion', 
               'Remove-AzMLWorkspaceEnvironmentContainer', 
               'Remove-AzMLWorkspaceEnvironmentVersion', 'Remove-AzMLWorkspaceJob', 
               'Remove-AzMLWorkspaceModelContainer', 
               'Remove-AzMLWorkspaceModelVersion', 
               'Remove-AzMLWorkspaceOnlineDeployment', 
               'Remove-AzMLWorkspaceOnlineEndpoint', 
               'Restart-AzMLWorkspaceCompute', 'Start-AzMLWorkspaceCompute', 
               'Stop-AzMLWorkspaceCompute', 'Stop-AzMLWorkspaceJob', 
               'Sync-AzMLWorkspaceKey', 'Update-AzMLServiceQuota', 
               'Update-AzMLWorkspace', 'Update-AzMLWorkspaceBatchDeployment', 
               'Update-AzMLWorkspaceBatchEndpoint', 'Update-AzMLWorkspaceCompute', 
               'Update-AzMLWorkspaceOnlineDeployment', 
               'Update-AzMLWorkspaceOnlineEndpoint'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
ModuleList = @(@{ModuleName = 'Az.Accounts'; ModuleVersion = '3.0.3'; })

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Azure','ResourceManager','ARM','PSModule','MachineLearningServices'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/azps-license'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Updated API version to 2024-04-01
* Added Kind and HubResourceId parameters for Workspace cmdlets
* Fixed batch deployment creation issue
* Fixed Connection creation issue
* Added Connection Properties object cmdlets for connection creation
    - ''New-AzMLWorkspaceAadAuthTypeWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspaceAccessKeyAuthTypeWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspaceAccountKeyAuthTypeWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspaceApiKeyAuthWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspaceCustomKeysWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspaceManagedIdentityAuthTypeWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspaceNoneAuthTypeWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspaceOAuth2AuthTypeWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspacePatAuthTypeWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspaceSasAuthTypeWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspaceServicePrincipalAuthTypeWorkspaceConnectionPropertiesObject''
    - ''New-AzMLWorkspaceUsernamePasswordAuthTypeWorkspaceConnectionPropertiesObject''
* Added Model reference object cmdlets for batch deployment creation
    - ''New-AzMLWorkspaceIdAssetReferenceObject''
    - ''New-AzMLWorkspaceDataPathAssetReferenceObject''
    - ''New-AzMLWorkspaceOutputPathAssetReferenceObject'''

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
# MIInzgYJKoZIhvcNAQcCoIInvzCCJ7sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBJgOSnYfiC1Amz
# rMT4unacK0cS6oYfOsxBNX6Q7HBId6CCDYUwggYDMIID66ADAgECAhMzAAADri01
# UchTj1UdAAAAAAOuMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjMxMTE2MTkwODU5WhcNMjQxMTE0MTkwODU5WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQD0IPymNjfDEKg+YyE6SjDvJwKW1+pieqTjAY0CnOHZ1Nj5irGjNZPMlQ4HfxXG
# yAVCZcEWE4x2sZgam872R1s0+TAelOtbqFmoW4suJHAYoTHhkznNVKpscm5fZ899
# QnReZv5WtWwbD8HAFXbPPStW2JKCqPcZ54Y6wbuWV9bKtKPImqbkMcTejTgEAj82
# 6GQc6/Th66Koka8cUIvz59e/IP04DGrh9wkq2jIFvQ8EDegw1B4KyJTIs76+hmpV
# M5SwBZjRs3liOQrierkNVo11WuujB3kBf2CbPoP9MlOyyezqkMIbTRj4OHeKlamd
# WaSFhwHLJRIQpfc8sLwOSIBBAgMBAAGjggGCMIIBfjAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUhx/vdKmXhwc4WiWXbsf0I53h8T8w
# VAYDVR0RBE0wS6RJMEcxLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEWMBQGA1UEBRMNMjMwMDEyKzUwMTgzNjAfBgNVHSMEGDAW
# gBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIw
# MTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDEx
# XzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIB
# AGrJYDUS7s8o0yNprGXRXuAnRcHKxSjFmW4wclcUTYsQZkhnbMwthWM6cAYb/h2W
# 5GNKtlmj/y/CThe3y/o0EH2h+jwfU/9eJ0fK1ZO/2WD0xi777qU+a7l8KjMPdwjY
# 0tk9bYEGEZfYPRHy1AGPQVuZlG4i5ymJDsMrcIcqV8pxzsw/yk/O4y/nlOjHz4oV
# APU0br5t9tgD8E08GSDi3I6H57Ftod9w26h0MlQiOr10Xqhr5iPLS7SlQwj8HW37
# ybqsmjQpKhmWul6xiXSNGGm36GarHy4Q1egYlxhlUnk3ZKSr3QtWIo1GGL03hT57
# xzjL25fKiZQX/q+II8nuG5M0Qmjvl6Egltr4hZ3e3FQRzRHfLoNPq3ELpxbWdH8t
# Nuj0j/x9Crnfwbki8n57mJKI5JVWRWTSLmbTcDDLkTZlJLg9V1BIJwXGY3i2kR9i
# 5HsADL8YlW0gMWVSlKB1eiSlK6LmFi0rVH16dde+j5T/EaQtFz6qngN7d1lvO7uk
# 6rtX+MLKG4LDRsQgBTi6sIYiKntMjoYFHMPvI/OMUip5ljtLitVbkFGfagSqmbxK
# 7rJMhC8wiTzHanBg1Rrbff1niBbnFbbV4UDmYumjs1FIpFCazk6AADXxoKCo5TsO
# zSHqr9gHgGYQC2hMyX9MGLIpowYCURx3L7kUiGbOiMwaMIIHejCCBWKgAwIBAgIK
# YQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlm
# aWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEw
# OTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYD
# VQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+la
# UKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc
# 6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4D
# dato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+
# lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nk
# kDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6
# A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmd
# X4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL
# 5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zd
# sGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3
# T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS
# 4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRI
# bmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAL
# BgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBD
# uRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jv
# c29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1h
# cnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkA
# YwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn
# 8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7
# v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0b
# pdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/
# KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvy
# CInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBp
# mLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJi
# hsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYb
# BL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbS
# oqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sL
# gOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtX
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGZ8wghmbAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAOuLTVRyFOPVR0AAAAA
# A64wDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIMH6
# gzT6pmBrJE5lD2Xwz+9SJeh1dFpoEJSv6dR+y0VqMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAbiiuxGcn+zYhXiqPJ8HtdJzj3PSDqg8DdRqV
# szRFtK/t2AlI7ewmw9s1yXoGFIUyrpilPPnvSnVoRWjTerAcAwe3Wb9uzb6qam90
# QS6GlNUUUCekca0dZ4h2au5QlydQ7WhA31XCSWREm3xSQh3AuHrZt2XiJ6QiStep
# GHfe0+mlWa/9KoZPMGBqnUMAaEOkThOSiIA2/JiynTAfYEI9gn/1LvkaJkD5LlA9
# 6Le75V+qqi5gG4lw2VVuOzdNUaDGuZttpRdViWfaNGBJaM+TE7h92RPo7VX2qBDJ
# 4Leczby6Ts2ZYZso4pHL8HsG0oTIw+dqW5H2Ajv6c9M6RDsoYqGCFykwghclBgor
# BgEEAYI3AwMBMYIXFTCCFxEGCSqGSIb3DQEHAqCCFwIwghb+AgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFZBgsqhkiG9w0BCRABBKCCAUgEggFEMIIBQAIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCBtPzbPJFXjcwyODd3HYaS6fwtkHKAQEj8t
# R+V5h9nStwIGZpetysXPGBMyMDI0MDczMTA3MTQxNi45NjNaMASAAgH0oIHYpIHV
# MIHSMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQL
# EyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJjAkBgNVBAsT
# HVRoYWxlcyBUU1MgRVNOOjJBRDQtNEI5Mi1GQTAxMSUwIwYDVQQDExxNaWNyb3Nv
# ZnQgVGltZS1TdGFtcCBTZXJ2aWNloIIReDCCBycwggUPoAMCAQICEzMAAAHenkie
# lp8oRD0AAQAAAd4wDQYJKoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# UENBIDIwMTAwHhcNMjMxMDEyMTkwNzEyWhcNMjUwMTEwMTkwNzEyWjCB0jELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9z
# b2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFsZXMg
# VFNTIEVTTjoyQUQ0LTRCOTItRkEwMTElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUt
# U3RhbXAgU2VydmljZTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALSB
# 9ByF9UIDhA6xFrOniw/xsDl8sSi9rOCOXSSO4VMQjnNGAo5VHx0iijMEMH9LY2SU
# IBkVQS0Ml6kR+TagkUPbaEpwjhQ1mprhRgJT/jlSnic42VDAo0en4JI6xnXoAoWo
# KySY8/ROIKdpphgI7OJb4XHk1P3sX2pNZ32LDY1ktchK1/hWyPlblaXAHRu0E3yn
# vwrS8/bcorANO6DjuysyS9zUmr+w3H3AEvSgs2ReuLj2pkBcfW1UPCFudLd7IPZ2
# RC4odQcEPnY12jypYPnS6yZAs0pLpq0KRFUyB1x6x6OU73sudiHON16mE0l6LLT9
# OmGo0S94Bxg3N/3aE6fUbnVoemVc7FkFLum8KkZcbQ7cOHSAWGJxdCvo5OtUtRdS
# qf85FklCXIIkg4sm7nM9TktUVfO0kp6kx7mysgD0Qrxx6/5oaqnwOTWLNzK+BCi1
# G7nUD1pteuXvQp8fE1KpTjnG/1OJeehwKNNPjGt98V0BmogZTe3SxBkOeOQyLA++
# 5Hyg/L68pe+DrZoZPXJaGU/iBiFmL+ul/Oi3d83zLAHlHQmH/VGNBfRwP+ixvqhy
# k/EebwuXVJY+rTyfbRfuh9n0AaMhhNxxg6tGKyZS4EAEiDxrF9mAZEy8e8rf6dlK
# IX5d3aQLo9fDda1ZTOw+XAcAvj2/N3DLVGZlHnHlAgMBAAGjggFJMIIBRTAdBgNV
# HQ4EFgQUazAmbxseaapgdxzK8Os+naPQEsgwHwYDVR0jBBgwFoAUn6cVXQBeYl2D
# 9OXSZacbUzUZ6XIwXwYDVR0fBFgwVjBUoFKgUIZOaHR0cDovL3d3dy5taWNyb3Nv
# ZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUy
# MDIwMTAoMSkuY3JsMGwGCCsGAQUFBwEBBGAwXjBcBggrBgEFBQcwAoZQaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBUaW1l
# LVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcnQwDAYDVR0TAQH/BAIwADAWBgNVHSUB
# Af8EDDAKBggrBgEFBQcDCDAOBgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQAD
# ggIBAOKUwHsXDacGOvUIgs5HDgPs0LZ1qyHS6C6wfKlLaD36tZfbWt1x+GMiazSu
# y+GsxiVHzkhMW+FqK8gruLQWN/sOCX+fGUgT9LT21cRIpcZj4/ZFIvwtkBcsCz1X
# EUsXYOSJUPitY7E8bbldmmhYZ29p+XQpIcsG/q+YjkqBW9mw0ru1MfxMTQs9MTDi
# D28gAVGrPA3NykiSChvdqS7VX+/LcEz9Ubzto/w28WA8HOCHqBTbDRHmiP7MIj+S
# QmI9VIayYsIGRjvelmNa0OvbU9CJSz/NfMEgf2NHMZUYW8KqWEjIjPfHIKxWlNMY
# huWfWRSHZCKyIANA0aJL4soHQtzzZ2MnNfjYY851wHYjGgwUj/hlLRgQO5S30Zx7
# 8GqBKfylp25aOWJ/qPhC+DXM2gXajIXbl+jpGcVANwtFFujCJRdZbeH1R+Q41Fjg
# Bg4m3OTFDGot5DSuVkQgjku7pOVPtldE46QlDg/2WhPpTQxXH64sP1GfkAwUtt6r
# rZM/PCwRG6girYmnTRLLsicBhoYLh+EEFjVviXAGTk6pnu8jx/4WPWu0jsz7yFzg
# 82/FMqCk9wK3LvyLAyDHN+FxbHAxtgwad7oLQPM0WGERdB1umPCIiYsSf/j79EqH
# doNwQYROVm+ZX10RX3n6bRmAnskeNhi0wnVaeVogLMdGD+nqMIIHcTCCBVmgAwIB
# AgITMwAAABXF52ueAptJmQAAAAAAFTANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UE
# BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAc
# BgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0
# IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMjEwOTMwMTgyMjI1
# WhcNMzAwOTMwMTgzMjI1WjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
# Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDCC
# AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOThpkzntHIhC3miy9ckeb0O
# 1YLT/e6cBwfSqWxOdcjKNVf2AX9sSuDivbk+F2Az/1xPx2b3lVNxWuJ+Slr+uDZn
# hUYjDLWNE893MsAQGOhgfWpSg0S3po5GawcU88V29YZQ3MFEyHFcUTE3oAo4bo3t
# 1w/YJlN8OWECesSq/XJprx2rrPY2vjUmZNqYO7oaezOtgFt+jBAcnVL+tuhiJdxq
# D89d9P6OU8/W7IVWTe/dvI2k45GPsjksUZzpcGkNyjYtcI4xyDUoveO0hyTD4MmP
# frVUj9z6BVWYbWg7mka97aSueik3rMvrg0XnRm7KMtXAhjBcTyziYrLNueKNiOSW
# rAFKu75xqRdbZ2De+JKRHh09/SDPc31BmkZ1zcRfNN0Sidb9pSB9fvzZnkXftnIv
# 231fgLrbqn427DZM9ituqBJR6L8FA6PRc6ZNN3SUHDSCD/AQ8rdHGO2n6Jl8P0zb
# r17C89XYcz1DTsEzOUyOArxCaC4Q6oRRRuLRvWoYWmEBc8pnol7XKHYC4jMYcten
# IPDC+hIK12NvDMk2ZItboKaDIV1fMHSRlJTYuVD5C4lh8zYGNRiER9vcG9H9stQc
# xWv2XFJRXRLbJbqvUAV6bMURHXLvjflSxIUXk8A8FdsaN8cIFRg/eKtFtvUeh17a
# j54WcmnGrnu3tz5q4i6tAgMBAAGjggHdMIIB2TASBgkrBgEEAYI3FQEEBQIDAQAB
# MCMGCSsGAQQBgjcVAgQWBBQqp1L+ZMSavoKRPEY1Kc8Q/y8E7jAdBgNVHQ4EFgQU
# n6cVXQBeYl2D9OXSZacbUzUZ6XIwXAYDVR0gBFUwUzBRBgwrBgEEAYI3TIN9AQEw
# QTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9E
# b2NzL1JlcG9zaXRvcnkuaHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMIMBkGCSsGAQQB
# gjcUAgQMHgoAUwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/
# MB8GA1UdIwQYMBaAFNX2VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJ
# oEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01p
# Y1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYB
# BQUHMAKGPmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljUm9v
# Q2VyQXV0XzIwMTAtMDYtMjMuY3J0MA0GCSqGSIb3DQEBCwUAA4ICAQCdVX38Kq3h
# LB9nATEkW+Geckv8qW/qXBS2Pk5HZHixBpOXPTEztTnXwnE2P9pkbHzQdTltuw8x
# 5MKP+2zRoZQYIu7pZmc6U03dmLq2HnjYNi6cqYJWAAOwBb6J6Gngugnue99qb74p
# y27YP0h1AdkY3m2CDPVtI1TkeFN1JFe53Z/zjj3G82jfZfakVqr3lbYoVSfQJL1A
# oL8ZthISEV09J+BAljis9/kpicO8F7BUhUKz/AyeixmJ5/ALaoHCgRlCGVJ1ijbC
# HcNhcy4sa3tuPywJeBTpkbKpW99Jo3QMvOyRgNI95ko+ZjtPu4b6MhrZlvSP9pEB
# 9s7GdP32THJvEKt1MMU0sHrYUP4KWN1APMdUbZ1jdEgssU5HLcEUBHG/ZPkkvnNt
# yo4JvbMBV0lUZNlz138eW0QBjloZkWsNn6Qo3GcZKCS6OEuabvshVGtqRRFHqfG3
# rsjoiV5PndLQTHa1V1QJsWkBRH58oWFsc/4Ku+xBZj1p/cvBQUl+fpO+y/g75LcV
# v7TOPqUxUYS8vwLBgqJ7Fx0ViY1w/ue10CgaiQuPNtq6TPmb/wrpNPgkNWcr4A24
# 5oyZ1uEi6vAnQj0llOZ0dFtq0Z4+7X6gMTN9vMvpe784cETRkPHIqzqKOghif9lw
# Y1NNje6CbaUFEMFxBmoQtB1VM1izoXBm8qGCAtQwggI9AgEBMIIBAKGB2KSB1TCB
# 0jELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMk
# TWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1U
# aGFsZXMgVFNTIEVTTjoyQUQ0LTRCOTItRkEwMTElMCMGA1UEAxMcTWljcm9zb2Z0
# IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUAaKBSisy4y86pl8Xy
# 22CJZExE2vOggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
# Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAN
# BgkqhkiG9w0BAQUFAAIFAOpT9tgwIhgPMjAyNDA3MzEwNzMzNDRaGA8yMDI0MDgw
# MTA3MzM0NFowdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA6lP22AIBADAHAgEAAgIc
# SzAHAgEAAgIgczAKAgUA6lVIWAIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEE
# AYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBBQUAA4GB
# AHOpffy0QyV+0jeXe+3ngQrsr25fx0Y0FoYyYQ6Db+kP/EWRaOW5yJYVzbMTXmXZ
# Z1B+mpc8tvYCnw5bxWHTFOs1fw7ErreemwjzGwXJAWQE+4qwbu0sBFY0rSPf6+R3
# jRpkGevsSFQg5CQDlE6vKnnnzEBZ4fwZooXtOtMwVaNvMYIEDTCCBAkCAQEwgZMw
# fDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMd
# TWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAHenkielp8oRD0AAQAA
# Ad4wDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRAB
# BDAvBgkqhkiG9w0BCQQxIgQgPlub4OwSg1WrX9HLtvwbknwFpxdDpxFl6qicxRyt
# t8IwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCCOPiOfDcFeEBBJAn/mC3Mg
# rT5w/U2z81LYD44Hc34dezCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwAhMzAAAB3p5InpafKEQ9AAEAAAHeMCIEID1OAzK1/Wc/iomxipjPCilJ
# XDo/OKgUaWKoACw0DZsrMA0GCSqGSIb3DQEBCwUABIICAAjIEqLa7bL5rj7ZXvG6
# uCVIz2kf6xHF/XZGaTSlTeXhdi7G67RVM1CmNuJy3ZIWvoSYUpsyfhLz9ZZRJgHz
# N+E31Q65+vTvwrwA/C+1HO5eJG4ajzbxueOEtTga+jNNeVmHpuf6AnnK6ScYwa8a
# eWg4mtX5oeNNAcVuYLSpVGFVFuUKOHzetgU2aYGYsH6fAo3SbcTlaHkzWJqavy3o
# wBOyM8vyfN39cwTrAh35t4rlz2fRR/7tAB+gwtgQtGN0fTdCPNiPgCiuRXDC/cwT
# /DVp0q5QRe2mITn9i2LOS7aK0gd+7NjjcUq8iHyghiEt749CuokKUck46v903WXY
# XA3jac8AUtFtWix0zzqFmlRSV5QrjgQb9PPc3tI/DVK4TA3F+bpdwu/ArrNmkRdj
# ZG5jDP5WuJAHxpkDRyvNexNBVx7ge8dbbyvs6d11jVOPhIHkFF/DiNO3V++8HHmj
# TAQfRiVKTNLE5IsXEyQQAP02tlDx6UgUh8FQm3pP6jd2HX0Kcq0+liSLI9xYfqcq
# eBNrbwsa2/l1Bc82T4hMpjV+woNqrLE7yieqWyEfAA9NYqbIi5Wfu+kKavnR3vSz
# rSoOUnBVrNb7j08zVN1PHL0KKgd76XarFx/lB5loHfYuWlwos2IhZAG1kjZTDyyh
# Rs7xjPaMMkeOGcln5xT+hNYe
# SIG # End signature block
