
# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Updates setting.
.Description
Updates setting.

.Link
https://learn.microsoft.com/powershell/module/az.securityinsights/update-azsentinelsetting
#>
function Update-AzSentinelSetting {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.Settings])]
    [CmdletBinding(DefaultParameterSetName = 'UpdateExpandedAnomaliesEyesOnEntityAnalytics', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(ParameterSetName = 'UpdateExpandedAnomaliesEyesOnEntityAnalytics')]
        [Parameter(ParameterSetName = 'UpdateExpandedUeba')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.DefaultInfo(Script = '(Get-AzContext).Subscription.Id')]
        [System.String]
        # Gets subscription credentials which uniquely identify Microsoft Azure subscription.
        # The subscription ID forms part of the URI for every service call.
        ${SubscriptionId},
        
        [Parameter(ParameterSetName = 'UpdateExpandedAnomaliesEyesOnEntityAnalytics', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateExpandedUeba', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [System.String]
        # The Resource Group Name.
        ${ResourceGroupName},

        [Parameter(ParameterSetName = 'UpdateExpandedAnomaliesEyesOnEntityAnalytics', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateExpandedUeba', Mandatory)]
        #[Alias('DataConnectionName')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [System.String]
        # The name of the workspace.
        ${WorkspaceName},

        [Parameter(ParameterSetName = 'UpdateExpandedAnomaliesEyesOnEntityAnalytics', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateExpandedUeba', Mandatory)]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.SettingKind])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        # The setting Name 
        ${SettingsName},

        [Parameter(ParameterSetName = 'UpdateViaIdentityExpandedAnomaliesEyesOnEntityAnalytics', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityExpandedUeba', Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.ISecurityInsightsIdentity]
        # Identity Parameter
        # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
        ${InputObject},

        #Anomalies
        #.EyesOn
        #.EntityAnalytics
        [Parameter(ParameterSetName = 'UpdateExpandedAnomaliesEyesOnEntityAnalytics', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityExpandedAnomaliesEyesOnEntityAnalytics', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.Boolean]
        ${Enabled},

        #.Ueba
        [Parameter(ParameterSetName = 'UpdateExpandedUeba', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityExpandedUeba', Mandatory)]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.UebaDataSources])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.UebaDataSources[]]
        ${DataSource},

        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        try {
             #Handle Get
             $GetPSBoundParameters = @{}
             if($PSBoundParameters['InputObject']){
                $GetPSBoundParameters.Add('ResourceGroupName', ($PSBoundParameters['InputObject']).Id.Split('/')[4])
                $GetPSBoundParameters.Add('WorkspaceName', ($PSBoundParameters['InputObject']).Id.Split('/')[8])
                $Name = ($PSBoundParameters['InputObject']).Name
            }
            else {
                $GetPSBoundParameters.Add('ResourceGroupName', $PSBoundParameters['ResourceGroupName'])
                $GetPSBoundParameters.Add('WorkspaceName', $PSBoundParameters['WorkspaceName'])
                $Name = $PSBoundParameters['SettingsName']
             }
            if($Name -eq 'Ueba'){
                $GetPSBoundParameters.Add('SettingsName', 'Ueba')
                $ueba = Az.SecurityInsights\Get-AzSentinelSetting @GetPSBoundParameters
            }
            else{
                $Settings = Az.SecurityInsights\Get-AzSentinelSetting @GetPSBoundParameters
            }
            
 
            if ($Name -eq 'Anomalies'){
                If($PSBoundParameters['Enabled'] -eq $true){
                    if($Settings.Name -contains 'Anomalies'){
                        Write-Host "$Name is already Enabled!" -ForegroundColor Green
                    }
                    else{
                        Az.SecurityInsights.internal\Update-AzSentinelSetting -ResourceGroupName $GetPSBoundParameters['ResourceGroupName'] -WorkspaceName $GetPSBoundParameters['WorkspaceName'] -SettingsName $Name -Kind $Name
                    }
                }
              
                If($PSBoundParameters['Enabled'] -eq $false){
                    if($Settings.Name -contains 'Anomalies'){
                        Az.SecurityInsights.internal\Remove-AzSentinelSetting -ResourceGroupName $GetPSBoundParameters['ResourceGroupName'] -WorkspaceName $GetPSBoundParameters['WorkspaceName'] -SettingsName $Name
                    }
                    else{
                        Write-Host "$Name is already Disabled!" -ForegroundColor Green
                    }
                }
            }
            if ($Name -eq 'EyesOn'){
                If($PSBoundParameters['Enabled'] -eq $true){
                    if($Settings.Name -contains 'EyesOn'){
                        Write-Host "$Name is already Enabled!" -ForegroundColor Green
                    }
                    else{
                        Az.SecurityInsights.internal\Update-AzSentinelSetting -ResourceGroupName $GetPSBoundParameters['ResourceGroupName'] -WorkspaceName $GetPSBoundParameters['WorkspaceName'] -SettingsName $Name -Kind $Name
                    }                   
                }
                
                If($PSBoundParameters['Enabled'] -eq $false){
                    if($Settings.Name -contains 'EyesOn'){
                        Az.SecurityInsights.internal\Remove-AzSentinelSetting -ResourceGroupName $GetPSBoundParameters['ResourceGroupName'] -WorkspaceName $GetPSBoundParameters['WorkspaceName'] -SettingsName $Name
                    }
                    else{
                        Write-Host "$Name is already Disabled!" -ForegroundColor Green
                    }
                }
            }
            if ($Name -eq 'EntityAnalytics'){
                If($PSBoundParameters['Enabled'] -eq $true){
                    if($Settings.Name -contains 'EntityAnalytics'){
                        Write-Host "$Name is already Enabled!" -ForegroundColor Green
                    }
                    else{
                        Az.SecurityInsights.internal\Update-AzSentinelSetting -ResourceGroupName $GetPSBoundParameters['ResourceGroupName'] -WorkspaceName $GetPSBoundParameters['WorkspaceName'] -SettingsName $Name -Kind $Name
                    }                   
                }
                
                If($PSBoundParameters['Enabled'] -eq $false){
                    if($Settings.Name -contains 'EntityAnalytics'){
                        Az.SecurityInsights.internal\Remove-AzSentinelSetting -ResourceGroupName $GetPSBoundParameters['ResourceGroupName'] -WorkspaceName $GetPSBoundParameters['WorkspaceName'] -SettingsName $Name
                    }
                    else{
                        Write-Host "$Name is already Disabled!" -ForegroundColor Green
                    }
                }
            }

            if ($Name -eq 'Ueba'){
                If($PSBoundParameters['DataSource']){
                    $ueba.DataSource = $PSBoundParameters['DataSource']
                    $null = $PSBoundParameters.Remove('DataSource')
                }
                $null = $PSBoundParameters.Add('Setting', $Setting)
                Az.SecurityInsights.internal\Update-AzSentinelSetting @PSBoundParameters
            }
        }
        catch {
            throw
        }
    }
}
# SIG # Begin signature block
# MIIoPAYJKoZIhvcNAQcCoIIoLTCCKCkCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA3A1svQDps8guM
# vpimbAM58k45GFpbYAz5zU3rsZCHMKCCDYUwggYDMIID66ADAgECAhMzAAADri01
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
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGg0wghoJAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAOuLTVRyFOPVR0AAAAA
# A64wDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIIq+
# ezZfd7PvfY8oClfair6zAppauRg6W+fmrC3gcOcwMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAYOaBlBhPiRw6gHw+sFpliqx7A9PLDwIXi8V1
# 2DuiyTfR1N+qAHJGOdQeAhxgHQHgGVb2vUdx6Gq6VtnwsfpeFLlURRhB8pj2sa07
# rLabhCXPVI9reChux42ZnQ6oUFDMXWU06tPmH6Eh31NaIpXjwGjydEzzTN71CQ97
# 9lGw8DmCaqflExOuDPistUMP9NbUy3vLeAgIHh8b1DzwBpeCtk7b6tPCMiARRVQp
# 4ju8WMwslGGmIy/9MOBSMtzElk6eHXs6MGKLlgmZJUqc+aZERhB0Dxn9ueVk3YbN
# ZLc3Hk9t9nJsn9WymoDvq4sv9T2ukqi+4EKqyWLjPTeZOpqYdKGCF5cwgheTBgor
# BgEEAYI3AwMBMYIXgzCCF38GCSqGSIb3DQEHAqCCF3AwghdsAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFSBgsqhkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCDX1J8Sf4+wAA3IZfdkKwk6raFSyIBoo8CD
# E6OyqQq7TgIGZhfWS4bSGBMyMDI0MDQyMzEzMTUxMi4zNjNaMASAAgH0oIHRpIHO
# MIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQL
# ExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxk
# IFRTUyBFU046OTIwMC0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFNlcnZpY2WgghHtMIIHIDCCBQigAwIBAgITMwAAAecujy+TC08b6QAB
# AAAB5zANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDAeFw0yMzEyMDYxODQ1MTlaFw0yNTAzMDUxODQ1MTlaMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046OTIwMC0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Uw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDCV58v4IuQ659XPM1DtaWM
# v9/HRUC5kdiEF89YBP6/Rn7kjqMkZ5ESemf5Eli4CLtQVSefRpF1j7S5LLKisMWO
# GRaLcaVbGTfcmI1vMRJ1tzMwCNIoCq/vy8WH8QdV1B/Ab5sK+Q9yIvzGw47TfXPE
# 8RlrauwK/e+nWnwMt060akEZiJJz1Vh1LhSYKaiP9Z23EZmGETCWigkKbcuAnhvh
# 3yrMa89uBfaeHQZEHGQqdskM48EBcWSWdpiSSBiAxyhHUkbknl9PPztB/SUxzRZj
# UzWHg9bf1mqZ0cIiAWC0EjK7ONhlQfKSRHVLKLNPpl3/+UL4Xjc0Yvdqc88gOLUr
# /84T9/xK5r82ulvRp2A8/ar9cG4W7650uKaAxRAmgL4hKgIX5/0aIAsbyqJOa6OI
# GSF9a+DfXl1LpQPNKR792scF7tjD5WqwIuifS9YUiHMvRLjjKk0SSCV/mpXC0BoP
# kk5asfxrrJbCsJePHSOEblpJzRmzaP6OMXwRcrb7TXFQOsTkKuqkWvvYIPvVzC68
# UM+MskLPld1eqdOOMK7Sbbf2tGSZf3+iOwWQMcWXB9gw5gK3AIYK08WkJJuyzPqf
# itgubdRCmYr9CVsNOuW+wHDYGhciJDF2LkrjkFUjUcXSIJd9f2ssYitZ9CurGV74
# BQcfrxjvk1L8jvtN7mulIwIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFM/+4JiAnzY4
# dpEf/Zlrh1K73o9YMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8G
# A1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMv
# Y3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBs
# BggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUy
# MDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUH
# AwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQB0ofDbk+llWi1c
# C6nsfie5Jtp09o6b6ARCpvtDPq2KFP+hi+UNNP7LGciKuckqXCmBTFIhfBeGSxvk
# 6ycokdQr3815pEOaYWTnHvQ0+8hKy86r1F4rfBu4oHB5cTy08T4ohrG/OYG/B/gN
# nz0Ol6v7u/qEjz48zXZ6ZlxKGyZwKmKZWaBd2DYEwzKpdLkBxs6A6enWZR0jY+q5
# FdbV45ghGTKgSr5ECAOnLD4njJwfjIq0mRZWwDZQoXtJSaVHSu2lHQL3YHEFikun
# bUTJfNfBDLL7Gv+sTmRiDZky5OAxoLG2gaTfuiFbfpmSfPcgl5COUzfMQnzpKfX6
# +FkI0QQNvuPpWsDU8sR+uni2VmDo7rmqJrom4ihgVNdLaMfNUqvBL5ZiSK1zmaEL
# BJ9a+YOjE5pmSarW5sGbn7iVkF2W9JQIOH6tGWLFJS5Hs36zahkoHh8iD963LeGj
# ZqkFusKaUW72yMj/yxTeGEDOoIr35kwXxr1Uu+zkur2y+FuNY0oZjppzp95AW1le
# hP0xaO+oBV1XfvaCur/B5PVAp2xzrosMEUcAwpJpio+VYfIufGj7meXcGQYWA8Um
# r8K6Auo+Jlj8IeFS6lSvKhqQpmdBzAMGqPOQKt1Ow3ZXxehK7vAiim3ZiALlM0K5
# 46k0sZrxdZPgpmz7O8w9gHLuyZAQezCCB3EwggVZoAMCAQICEzMAAAAVxedrngKb
# SZkAAAAAABUwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmlj
# YXRlIEF1dGhvcml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIy
# NVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
# B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UE
# AxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXI
# yjVX9gF/bErg4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjo
# YH1qUoNEt6aORmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1y
# aa8dq6z2Nr41JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v
# 3byNpOORj7I5LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pG
# ve2krnopN6zL64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viS
# kR4dPf0gz3N9QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYr
# bqgSUei/BQOj0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlM
# jgK8QmguEOqEUUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSL
# W6CmgyFdXzB0kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AF
# emzFER1y7435UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIu
# rQIDAQABo4IB3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIE
# FgQUKqdS/mTEmr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWn
# G1M1GelyMFwGA1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEW
# M2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5
# Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBi
# AEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV
# 9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3Js
# Lm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAx
# MC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2
# LTIzLmNydDANBgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv
# 6lwUtj5OR2R4sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZn
# OlNN3Zi6th542DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1
# bSNU5HhTdSRXud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4
# rPf5KYnDvBewVIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU
# 6ZGyqVvfSaN0DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDF
# NLB62FD+CljdQDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/
# HltEAY5aGZFrDZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdU
# CbFpAUR+fKFhbHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKi
# excdFYmNcP7ntdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTm
# dHRbatGePu1+oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZq
# ELQdVTNYs6FwZvKhggNQMIICOAIBATCB+aGB0aSBzjCByzELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoT
# FU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJp
# Y2EgT3BlcmF0aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjkyMDAtMDVF
# MC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMK
# AQEwBwYFKw4DAhoDFQCzcgTnGasSwe/dru+cPe1NF/vwQ6CBgzCBgKR+MHwxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jv
# c29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6dIknDAi
# GA8yMDI0MDQyMzEyMTQyMFoYDzIwMjQwNDI0MTIxNDIwWjB3MD0GCisGAQQBhFkK
# BAExLzAtMAoCBQDp0iScAgEAMAoCAQACAgyFAgH/MAcCAQACAhNGMAoCBQDp03Yc
# AgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSCh
# CjAIAgEAAgMBhqAwDQYJKoZIhvcNAQELBQADggEBAAtBkyUdrM1hwbTBWCK48MGm
# KRxZss6LPFkY42ZOWnXsVX6ZpU1Gl/LHGQnpRZk6/hinddMaf7iclXFbDMTro7W5
# 8hCrRegPfWwTzs8g1aOMYXNAwJW30fwOsS6mecLg5zfkvBReOfq509wnpa0Ndwg6
# EQMGwD/BAq7tdePiGcewKasjknLTpYY7fgoW2Ncb0sgNMRHJId/wLrHwD90VtvkC
# Enw9OPR+IbvMfWkyCTqpPJ3Y0U/m/Oeqqoo9GDlFnX17f/az0HZjr4SZ9LXRqz8Q
# a4zlmb79kpVqf6nLoXJr9P9oeI7iFIEHkb+mYdtENFDUMyhhduOhsqZHXwrf3QQx
# ggQNMIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
# bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0
# aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAA
# Aecujy+TC08b6QABAAAB5zANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkD
# MQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCAKMtrO+W5iFr9OygzTazi8
# WF1FX5cydjVKwOJWONySfDCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIOU2
# XQ12aob9DeDFXM9UFHeEX74Fv0ABvQMG7qC51nOtMIGYMIGApH4wfDELMAkGA1UE
# BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAc
# BgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0
# IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAHnLo8vkwtPG+kAAQAAAecwIgQgUj1W
# 10UOl24tqW0PGjrhbdiG0wEdX5mXIsSe+QniYO0wDQYJKoZIhvcNAQELBQAEggIA
# OqIuVxiwVsHhGMEsh1YOm0TcR46nu13+owiirgDRNQBp2jA0oRGSIWHX0ARf5Q2N
# 8RyT4IcLv6d9zsClZ865+/zEF1jbew7Pjo6lCrc1bDlwnrPqwNMG9KFedeojoQQE
# CGkhTgq4bhw0/r/YgIB3F3ERUvtsuot/Kll5CJU7W/B01JYuHVS/2tbofU9+Opc7
# IDqm4J02k+Mzzvbbx7v3NVaYxHsujBzmYR2nuzGsM6rhFjFBiU4mXKQnmpfSF3oI
# 1QPfhujXUNO3rBCfr8oJcrEGV7VXyF8EG5r6ccnC1tBnqy5ge6CqPzM4AMNzSrkJ
# vhdm1MQM/esrP/1FxB/h5CT57EMJVifZSi/q3kLNlAWOCVHNxhqTo2bkDALLr3aG
# yai8Od11gwZlKPagc6vM5KjQmthaKI1snpB5NHnvfMkt+UN+qpqhdkNlgwprTuL8
# JWWFMU2aWL5PqBgl3Fx5P6TZTO2T1Jmll4S7rmanR1xmnjcorejtOvEX23WVNM6F
# EbNQwMR1r45hpM5PnrUv7364QERgPL+TQc1IMXaDziiveiXKXMXT5dwKU5H0eE+4
# fbi7alFdFspczLGfqZk83e4ycv0Mw11s8rzMbpzOUhG4ewuVOXQ1MVumewVc8u6Y
# qL49UjLJb+joDwUZOm5OUfyoESnwqaBebjJ3F16qKHU=
# SIG # End signature block