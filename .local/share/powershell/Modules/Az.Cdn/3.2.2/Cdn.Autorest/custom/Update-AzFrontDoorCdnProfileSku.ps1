
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

<#
.Synopsis
Upgrade a profile from Standard_AzureFrontDoor to Premium_AzureFrontDoor.
.Description
Upgrade a profile from Standard_AzureFrontDoor to Premium_AzureFrontDoor.
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Inputs
Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.Api20240201.IProfileUpgradeParameters
.Outputs
Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.Api20240201.IProfile
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

PROFILEUPGRADEPARAMETER <IProfileUpgradeParameters>: Parameters required for profile upgrade.
  WafMappingList <IProfileChangeSkuWafMapping[]>: Web Application Firewall (WAF) and security policy mapping for the profile upgrade
    SecurityPolicyName <String>: The security policy name.
    [ChangeToWafPolicyId <String>]: Resource ID.

WAFMAPPINGLIST <IProfileChangeSkuWafMapping[]>: Web Application Firewall (WAF) and security policy mapping for the profile upgrade
  SecurityPolicyName <String>: The security policy name.
  [ChangeToWafPolicyId <String>]: Resource ID.
.Link
https://learn.microsoft.com/powershell/module/az.cdn/update-azfrontdoorcdnprofilesku
#>
function Update-AzFrontDoorCdnProfileSku {
    [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Runtime.PreviewMessageAttribute("This cmdlet is using a preview API version and is subject to breaking change in a future release.")]
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.Api20240201.IProfile])]
    [CmdletBinding(PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Path')]
        [System.String]
        # Name of the Azure Front Door Standard or Azure Front Door Premium which is unique within the resource group.
        ${ProfileName},
    
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Path')]
        [System.String]
        # Name of the Resource group within the Azure subscription.
        ${ResourceGroupName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # Azure Subscription ID.
        ${SubscriptionId},

        [Parameter(Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Models.Api20240201.IProfileUpgradeParameters]
        # Parameters required for profile upgrade.
        # To construct, see NOTES section for PROFILEUPGRADEPARAMETER properties and create a hash table.
        ${ProfileUpgradeParameter},
    
        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Cdn.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )
    
    process {
        if (!(Get-Module -ListAvailable -Name Az.FrontDoor)) {
            Write-Host("Starting the install Az.FrontDoor module.")
            Install-Module -Name Az.FrontDoor
            # throw 'Please install Az.FrontDoor module by entering "Install-Module -Name Az.FrontDoor".'
        }
        Import-Module -Name Az.FrontDoor

        $wafPolicies = $PSBoundParameters.ProfileUpgradeParameter
        $validateWafId = "^/subscriptions/(?<subscriptionId>[^/]+)/resourcegroups/(?<resourceGroupName>[^/]+)/providers/microsoft.network/frontdoorwebapplicationfirewallpolicies/(?<policyName>[^/]+)$"

        if($wafPolicies.count -ne 0) {
            # 1. Validate the format of the waf ID
            foreach ($wafMapping in $wafPolicies.WafMappingList) {
                $changeToWafPolciy = $wafMapping.ChangeToWafPolicyId
                if ($changeToWafPolciy.ToLower() -notmatch $validateWafId) {
                    throw "The format of Waf policy id is supposed to be like '/subscriptions/*******/resourceGroups/****/providers/Microsoft.Network/frontdoorWebApplicationFirewallPolicies/******' "
                }
            }

            foreach ($wafMapping in $wafPolicies.wafMappingList) {
                $changeToWafPolicy = $wafMapping.ChangeToWafPolicyId
                $changeToWafPolicyName = $changeToWafPolicy.split("/")[8]
                if ($changeToWafPolicyName -notmatch '(^[a-zA-Z]+)\w+$') {
                    throw "The WAF name must begin with a letter, and may only contain numbers and letters."
                }

                $changeToWafPolicySubId = $changeToWafPolicy.split("/")[2]
                $changeToWafPolicyResourceGroup = $changeToWafPolicy.split("/")[4]

                $context = Get-AzContext
                if (${SubscriptionId} -ne $context.Subscription.Id)
                {
                    Write-Host("The subscription parameter provided is different from local subscription. Now set the value of subscription as: '${SubscriptionId}'")
                    Set-AzContext -Subscription ${SubscriptionId}
                }

                # Validate the waf policy whether located in the same subscritpion as the profile.
                $contextNew = Get-AzContext
                if ($contextNew.Subscription.Id -ne $changeToWafPolicySubId)
                {
                    throw "The subscritpion of existing or created Premium WAF policy should be in the same subscription as the profile's."
                }

                # 2. Validate whether the policy already exists in the subsrciption
                try {
                    Get-AzFrontDoorWafPolicy -ResourceGroupName $changeToWafPolicyResourceGroup -Name $changeToWafPolicyName -ErrorAction Stop | Out-Null
                } catch {
                    $policyName = $wafMapping.SecurityPolicyName
                    # Get the waf policy name of the security.
                    try{
                        $policyNameProperty = Get-AzFrontDoorCdnSecurityPolicy -ResourceGroupName ${ResourceGroupName} -ProfileName ${ProfileName} -Name $policyName -ErrorAction Stop
                    }
                    catch {
                        throw 'Security policy name not exists in this profile...'
                    }
                    $currentWafName = $policyNameProperty.Parameter.WafPolicyId.split("/")[8]
                    $currentWafResourceGroup = $policyNameProperty.Parameter.WafPolicyId.split("/")[4]
                    $wafPolicyProperty = Get-AzFrontDoorWafPolicy -ResourceGroupName $currentWafResourceGroup -Name $currentWafName

                    # Create a new waf policy
                    if ($changeToWafPolicyResourceGroup -ne ${ResourceGroupName}) {
                        throw "The copied new premium WAF policy should to be created in the same resource group with the current profile's: '${ResourceGroupName}'."
                    }
                    CreatePremiumWafPolicy -ResourceGroupName $changeToWafPolicyResourceGroup -Name $changeToWafPolicyName -WafProperty $wafPolicyProperty
                }
            }
        }

        Az.Cdn.internal\Update-AzFrontDoorCdnProfileSku @PSBoundParameters
    }
}


# Corresponding to "Copy to a new waf policy"
function CreatePremiumWafPolicy {
    param (
        [string]$ResourceGroupName,
        [string]$Name,
        [Microsoft.Azure.Commands.FrontDoor.Models.PSTrackedResource]$WafProperty
    )

    # Remove the null/empty property
    $validatedWafProperty = ValidateWafPolicyProperty $WafProperty

    New-AzFrontDoorWafPolicy -ResourceGroupName $ResourceGroupName -Name $Name -Sku "Premium_AzureFrontDoor" @validatedWafProperty  | Out-Null
}

# Validate the property of a waf policy
function ValidateWafPolicyProperty {
    param (
        [Microsoft.Azure.Commands.FrontDoor.Models.PSTrackedResource]$WafProperty
    )

    $wafPropertHash = @{}
    if ($WafProperty.PolicyEnabledState) {
        $wafPropertHash.Add('EnabledState', $WafProperty.PolicyEnabledState)
    } 
    if ($WafProperty.PolicyMode) {
        $wafPropertHash.Add('Mode', $WafProperty.PolicyMode)
    }
    if ($WafProperty.CustomRules) {
        $wafPropertHash.Add('Customrule', $WafProperty.CustomRules)
    }
    if ($WafProperty.ManagedRules) {
        $wafPropertHash.Add('ManagedRule', $WafProperty.ManagedRules)
    }
    if ($WafProperty.RedirectUrl) {
        $wafPropertHash.Add('RedirectUrl', $WafProperty.RedirectUrl)
    }
    if ($WafProperty.CustomBlockResponseStatusCode) {
        $wafPropertHash.Add('CustomBlockResponseStatusCode', $WafProperty.CustomBlockResponseStatusCode)
    }
    if ($WafProperty.CustomBlockResponseBody) {
        $wafPropertHash.Add('CustomBlockResponseBody', $WafProperty.CustomBlockResponseBody)
    }
    if ($WafProperty.RequestBodyCheck) {
        $wafPropertHash.Add('RequestBodyCheck', $WafProperty.RequestBodyCheck)
    }
    return $wafPropertHash
}

# SIG # Begin signature block
# MIIoLQYJKoZIhvcNAQcCoIIoHjCCKBoCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBQSUPGgN6d3Nm3
# Ys1316gl24wUVn/ryOrKkWyEpQ4PlqCCDXYwggX0MIID3KADAgECAhMzAAADrzBA
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIH4aj7J664EMn6Ukcacqtt7S
# vfxTOl/5XLqPrKQJWLEnMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAVb0RBUhHaExmb/mmz9iNwzxy+9HbhDAk6dXwIeYN2NGBWAqKXbUQF0q/
# xQW/ZlTEKiFIRZ1hYN2Sab9glHASq9bEvoIS3T3vOdsxxurulnxlb4YN+9bx3IiA
# 1JTpbFkL0MlRQ3XO9TbiO5bNyAMWG/YOds9sGan68jZMV8YpUrBe2J2EOrer596q
# EhmVvq2zI0RFaEf9eENB+oIFXAR+mZP4RlRu98KFg0FuL/FO/XUECOyseuBXYhk6
# n3skS8sguwmi8vsViOoSLOF+Z76YdMMIzA2IaXVuJXmMrWTkvPrYdCXO5MI95NLj
# ow5vpyDTTN3taumN3xXC9Y/xs7ytgqGCF5cwgheTBgorBgEEAYI3AwMBMYIXgzCC
# F38GCSqGSIb3DQEHAqCCF3AwghdsAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFSBgsq
# hkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCA9KlZMhqiLogpMo+4sS/5+cAcYvFo/FIPF4sQHHr4amgIGZr4d/NY3
# GBMyMDI0MDgyOTAzMDgyMy4yNTFaMASAAgH0oIHRpIHOMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046ODkwMC0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wg
# ghHtMIIHIDCCBQigAwIBAgITMwAAAe3hX8vV96VdcwABAAAB7TANBgkqhkiG9w0B
# AQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMzEyMDYxODQ1
# NDFaFw0yNTAzMDUxODQ1NDFaMIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25z
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046ODkwMC0wNUUwLUQ5NDcxJTAjBgNV
# BAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCoMMJskrrqapycLxPC1H7zD7g88NpbEaQ6SjcTIRbz
# CVyYQNsz8TaL1pqFTEAPL1X7ojL4/EaEW+UjNqZs/ayMyW4YIpFPZP2x4FBMVCdd
# seF2i+aMMjDHi0LcTQZxM2s3mFMrCZAWSfLYXYDIimFBz8j0oLWGy3VgLmBTKM4x
# Lqv7DZUz8B2SoAmbEtp62ngSl0hOoN73SFwE+Y24SvGQMWhykpG+vXDwcpWvwDe+
# TgnrLR7ATRFXN5JS26dm2yy6SYFMRYnME3dMHCQ/UQIQQNC8nLmIvdKkAoWEMXtJ
# sGEo3QrM2S2SBv4PpHRzRukzTtP+UAceGxM9JyrwUQP5OCEmW6YchEyRDSwP4hU9
# f7B0Ayh14Pw9vJo7jewNjeMPIkmneyLSi0ruv2ox/xRGtcJ9yBNC5BaRktjz7stP
# aojR+PDA2fuBtCo8xKlkt53mUb7AY+CZHHqhLm76pdMF6BHv2TvwlVBeQRN22Xja
# VVRwCgjgJnNewt7PejcrpUn0qHLgLq+1BN1DzYukWkTr7wT0zl0iXr+NtqUkWSOn
# WRfe8N21tB6uv3VkW8nFdChtbbZZz24peLtJEZuNrN8Xf9PTPMzZXDJBI1EciR/9
# 1QcGoZFmVbFVb2rUIAs01+ZkewvbhmGVDefX9oZG4/K4gGUsTvTW+r1JZMxUT2Mw
# qQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFM4b8Oz33hAqBEfKlAZf0NKh4CIZMB8G
# A1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYwVKBSoFCG
# Tmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUy
# MFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcBAQRgMF4w
# XAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY2Vy
# dHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3J0MAwG
# A1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQD
# AgeAMA0GCSqGSIb3DQEBCwUAA4ICAQCd1gK2Rd+eGL0eHi+iE6/qDY8sbbsO4ema
# ncp6KPN+xq5ZAatiBR4jmRRhm+9Vik0Fo0DLWi/N28bFI7dXYw09p3vCipbjy4Eo
# ifm0Nud7/4U30i9+7RvW7XOQ3rx37+U7vq9lk6yYpGCNp0jlJ188/CuRPgqJnfq5
# EdeafH2AoG46hKWTeB7DuXasGt6spJOenGedSre34MWZqeTIQ0raOItZnFuGDy4+
# xoD1qRz2QW+u2gCHaG8AQjhYUM4uTi9t6kttj6c7Xamr2zrWuceDhz7sKLttLTJ7
# ws5YrA2I8cTlbMAf2KW0GVjKbYGd+LZGduEK7/7fs4GUkMqc51FsNdG1n+zgc7zH
# u2oGGeCBg4s8ZR0ZFyx7jsgm9sSFCKQ5CsbAvlr/60Ndk5TeMR8Js2kNUicu2CqZ
# 03833TsvTgk7iD1KLgfS16HEvjN6m4VKJKgjJ7OJJzabtS4JQgUnJrIZfyosk4D1
# 8rZni9pUwN03WgTmd10WTwiZOu4g8Un6iKcPMY/iFqTu4ntkzFUxBBpbFG6k1CIN
# ZmoirEWmCtG3lyZ2IddmjtIefTkIvGWb4Jxzz7l2m/E2kGOixDJHsahZVmwsoNvh
# y5ku/inU++dXHzw+hlvqTSFT89rIFVhcmsWPDJPNRSSpMhoJ33V2Za/lkKcbkUM0
# SbQgS9qsdzCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZI
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
# MCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjg5MDAtMDVFMC1EOTQ3MSUwIwYDVQQD
# ExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQDu
# HayKTCaYsYxJh+oWTx6uVPFw+aCBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6nm+vTAiGA8yMDI0MDgyODE1MjAy
# OVoYDzIwMjQwODI5MTUyMDI5WjB3MD0GCisGAQQBhFkKBAExLzAtMAoCBQDqeb69
# AgEAMAoCAQACAiRuAgH/MAcCAQACAhQeMAoCBQDqexA9AgEAMDYGCisGAQQBhFkK
# BAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJ
# KoZIhvcNAQELBQADggEBADE3aIkkJc7rvR6mnZZSGmi+qc7gSRq5g7O8XN+0CPga
# hYBJPm5uCAqPoLQr/+v8M5AYav31dChWoDh2r1WCtN+qT/RrA8LqOHCtXqkYvOX7
# kI0hEfXSC0tvhOxqMU3+Bh5NmUECuvVeYeGPlhOW+t07cgq/L6YacBrSo3+zGeWN
# D/bpwsfr5ZLx1+1MtybrQIYxgGkdaxjSjfEhRgaVYNAaSCSf3aGGaYOLFawW2N2u
# ZVCGL80JmZYwIg51F09kYPutSqEHRSLc4LBuOfHKHfWcxR97ARpvAfjWMYgy1l33
# RLcyEU3sNzmnqIGe2fYeaqzVSGhWKbb7f+3qhCJPRC4xggQNMIIECQIBATCBkzB8
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1N
# aWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAe3hX8vV96VdcwABAAAB
# 7TANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEE
# MC8GCSqGSIb3DQEJBDEiBCDHh+VDmdPB9K1b+LbP7vVLnYQVjQc5co7fMb6Np3mS
# KjCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EII0uDWg0CFseKxK3A16l1wrI
# wrsSDrXZ6xSf0F4xbMo5MIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAHt4V/L1felXXMAAQAAAe0wIgQgkQZMyCntceJirpYE9Ba9wMNn
# QchENeNlJtkhR2SiSpUwDQYJKoZIhvcNAQELBQAEggIAnbHr/ai3Gd+Evmwn6PHY
# w7gUxplbxogKjF8MVN+Z1OA/QVQruc5f4SvUOWCKBap+jUwXDlz5Tmmnjzv0p8pl
# SkRgCGJea38b2HHCedoMeGqiajOPAigiiyRsOG9FOfQNHDNUtyp3t2gk7HAwfnSe
# aOd0BeScnfrf1TF6GPMuacEwYHrWxu+nd9vuOsoWXUq6S+7XdNdl3vwRZhangeZV
# ghrgZFmRMo+t5aWfc7v29yLD1LKZYpfx6svGoA7nmmHpIwCmrQenGrJEylD9bjWz
# uE1ly58SQqNrQtkNm8i48qv9g3hrkSRot5XJoFMNnL6XJraBy8Fyq8JY+CnGGGfM
# /xP5axOnfh4rb78wk8YNHwSOFNqAN/MmnN3scLTWLuJQjnRYHOtzyu90v/Y5A2tP
# ox37+wWkRI6DhBjeIOgtrnDFq8jsjXjoInDrYiC4Zdnct3r5+n/kFSJwUMFWElei
# DQq9NI22GDZxgtc/C7FayVt0SneQp0H0VUfGl7d05AQpb5g32bRSpWmIdYeqma9D
# H0UlkS/HAvUkI1selr/Fwi/1OjR5LDPZF0PTQJgbW/+IlrWogXrQRzVwqZTCL3rQ
# OuIpb3nlSNqIshGto4sIh3hmjbJNuR6rENoaZk8Jowtmc+gCbr0/J4HP5t4zz1aY
# 8+xjinLgPVfXjFryx+0Qk+Q=
# SIG # End signature block
