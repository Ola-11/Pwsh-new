
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
Updates a database.
.Description
Updates a database.
.Example
PS C:\> $2ds = New-TimeSpan -Days 2
PS C:\> $4ds = New-TimeSpan -Days 4
PS C:\> Update-AzSynapseKustoPoolDatabase -ResourceGroupName testrg -WorkspaceName testws -KustoPoolName testkustopool -DatabaseName mykustodatabase -Kind ReadWrite -SoftDeletePeriod $4ds -HotCachePeriod $2ds -Location 'East US'

Kind      Location Name                                
----      -------- ----                                
ReadWrite East US  testws/testkustopool/mykustodatabase

.Inputs
Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.ISynapseIdentity
.Outputs
Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.IDatabase
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <ISynapseIdentity>: Identity Parameter
  [AttachedDatabaseConfigurationName <String>]: The name of the attached database configuration.
  [DataConnectionName <String>]: The name of the data connection.
  [DatabaseName <String>]: The name of the database in the Kusto pool.
  [Id <String>]: Resource identity path
  [KustoPoolName <String>]: The name of the Kusto pool.
  [Location <String>]: The name of Azure region.
  [PrincipalAssignmentName <String>]: The name of the Kusto principalAssignment.
  [ResourceGroupName <String>]: The name of the resource group. The name is case insensitive.
  [SubscriptionId <String>]: The ID of the target subscription.
  [WorkspaceName <String>]: The name of the workspace
.Link
https://learn.microsoft.com/powershell/module/az.synapse/update-azsynapsekustopooldatabase
#>
function Update-AzSynapseKustoPoolDatabase {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.IDatabase])]
    [CmdletBinding(DefaultParameterSetName='UpdateExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(ParameterSetName='UpdateExpanded', Mandatory)]
        [Alias('Name')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [System.String]
        # The name of the database in the Kusto pool.
        ${DatabaseName},

        [Parameter(ParameterSetName='UpdateExpanded', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [System.String]
        # The name of the Kusto pool.
        ${KustoPoolName},

        [Parameter(ParameterSetName='UpdateExpanded', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [System.String]
        # The name of the resource group.
        # The name is case insensitive.
        ${ResourceGroupName},

        [Parameter(ParameterSetName='UpdateExpanded')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # The ID of the target subscription.
        ${SubscriptionId},

        [Parameter(ParameterSetName='UpdateExpanded', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [System.String]
        # The name of the workspace
        ${WorkspaceName},

        [Parameter(ParameterSetName='UpdateViaIdentityExpanded', Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.ISynapseIdentity]
        # Identity Parameter
        # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
        ${InputObject},

        [Parameter(Mandatory)]
        [ArgumentCompleter( { param ( $CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters ) return @('ReadWrite') })]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Support.Kind]
        # Kind of the database
        ${Kind},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.TimeSpan]
        # The time the data should be kept in cache for fast queries in TimeSpan.
        ${HotCachePeriod},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityExpanded')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.TimeSpan]
        # The time the data should be kept before it stops being accessible to queries in TimeSpan.
        ${SoftDeletePeriod},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.String]
        # Resource location.
        ${Location},

        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        try {
            $Parameter = [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ReadWriteDatabase]::new()

            $Parameter.Kind = $PSBoundParameters['Kind']
            $null = $PSBoundParameters.Remove('Kind')

            if ($PSBoundParameters.ContainsKey('SoftDeletePeriod')) {
                $Parameter.SoftDeletePeriod = $PSBoundParameters['SoftDeletePeriod']
                $null = $PSBoundParameters.Remove('SoftDeletePeriod')
            } 
            
            if ($PSBoundParameters.ContainsKey('HotCachePeriod')) {
                $Parameter.HotCachePeriod = $PSBoundParameters['HotCachePeriod']
                $null = $PSBoundParameters.Remove('HotCachePeriod')
            }   

            $Parameter.Location = $PSBoundParameters['Location']
            $null = $PSBoundParameters.Remove('Location')

            $null = $PSBoundParameters.Add('Parameter', $Parameter)

            Az.Synapse.internal\Update-AzSynapseKustoPoolDatabase @PSBoundParameters
        }
        catch {
            throw
        }
    }
}

# SIG # Begin signature block
# MIIoOwYJKoZIhvcNAQcCoIIoLDCCKCgCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBj9+NrQV66XDgx
# iZcxx+gK0FKW62kmpKODOqU8x4v/IaCCDYUwggYDMIID66ADAgECAhMzAAADri01
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
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGgwwghoIAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAOuLTVRyFOPVR0AAAAA
# A64wDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIKh0
# fo89CrP+iYvpcSJU3nNOBFF8kl+UlWCTjmheBsOAMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEA1ItVIA6utU4NBMU3ewcftACKVA/obGj7RN50
# NT0gBbXebpxDMrNQQJrU6xAYXYvU9A8XT3Gr7HG1zZN5XEv36iSw+JaJYn0VjP+N
# dv7a8OPkq14PLLLLNGq9DFyXurgrUYO7Qyvj3j7HYnCiJV+MiRc9xUhoejhxGLnA
# i650PkgaDE5NicqEduGO3QTmoB6WPg1ukVn+r0cUXXtCLbiWsNYF7pmciPU3Jyvg
# p3v6bdf08se/0dyAPBrESYAhEFAZf20uCtRTk8pNs8VsktDEfsEqyCnm/YBJLU0y
# AmcQ1uPax9/qHqPJXEYrstWaYbI4qsq+UXzPYxpQk9L6KW+Sz6GCF5YwgheSBgor
# BgEEAYI3AwMBMYIXgjCCF34GCSqGSIb3DQEHAqCCF28wghdrAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFRBgsqhkiG9w0BCRABBKCCAUAEggE8MIIBOAIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCA1J81tK6MhsYySi27F/63VMaSu1Qc+NjKb
# PMsPiR73egIGZr3/kd3mGBIyMDI0MDgyOTAzMDgyNi41OFowBIACAfSggdGkgc4w
# gcsxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsT
# HE1pY3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJzAlBgNVBAsTHm5TaGllbGQg
# VFNTIEVTTjo4RDAwLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUt
# U3RhbXAgU2VydmljZaCCEe0wggcgMIIFCKADAgECAhMzAAAB88UKQ64DzB0xAAEA
# AAHzMA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# MB4XDTIzMTIwNjE4NDYwMloXDTI1MDMwNTE4NDYwMlowgcsxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1pY3Jvc29mdCBBbWVy
# aWNhIE9wZXJhdGlvbnMxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo4RDAwLTA1
# RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCC
# AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAP6fptrhK4H2JI7lYyFueCpg
# Bv7Pch/M2lkhZL+yB9eGUtiYaexS2sZfc5VyD7ySsl2LG41Qw7tkA6oJmxdSM7Pz
# NyfVpQPkPavY+HNUqMe2K9YaAaPjHnCpZ7VCi/e8zPxYewqx9p0iVaN8EydUpWiY
# 7JtDv7aNzhp/OPZclBBKYT2NBGgGiAPCaplqR5icjHQSY665w+vrvhPr9hpM+Ihi
# UZ/5dXa7qhAcCQwbnrFg9CKSK1COM1YcAN8GpsERqqmlqy3GlE1ziJ3ZLXFVDFxA
# ZeOcCB55Vts9sCgQuFvD7PdV61HC4QUlHNPqFtYSC/P0sxg9JuKgcvzD5mJajfG7
# DdHt8myp7umqyePC+eI/ux8TW61+LuTQ1Bkym+I6z//bf0fp4Dog5W0XzDrqKkTv
# URitxI2s4aVObm6qr6zI7W51k54ozTFjvbw1wYMWqeO4U9sQSbr561kp+1T2PEsJ
# LOpc5U7N2oDw7ldrcTjWPezsyVMXhDsFitCZunGqFO9+4iVjAjYDN47c6K9x7MnA
# GPYVCBOJUdpy8xAOBIDsTm/K1qTT4wsGbQBxbgg96vwDiA4YP2hKmubIC7UnrAWQ
# Gt/ZKOf6J42roXHS1aPwimDe5C9y6DfuNJp0XqrWtQRqg8hqNkIZWT6jnCfqu35z
# B0nf1ERTjdpYLCfQL5fHAgMBAAGjggFJMIIBRTAdBgNVHQ4EFgQUw2QV9qURUQyM
# DcCmhTH2oOsNCiQwHwYDVR0jBBgwFoAUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYD
# VR0fBFgwVjBUoFKgUIZOaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9j
# cmwvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwG
# CCsGAQUFBwEBBGAwXjBcBggrBgEFBQcwAoZQaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIw
# MjAxMCgxKS5jcnQwDAYDVR0TAQH/BAIwADAWBgNVHSUBAf8EDDAKBggrBgEFBQcD
# CDAOBgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBAN/EHI/80f7v29ze
# WI7hzudcz9QoVwCbnDrUXFHE/EJdFeWI2NnuwOo0/QPNRMFT21LkOqSpFKIhXXmP
# urx7p6WDz9wPdu/Sxbgaj0AwviWEDkwGDfDMp2KF8nQT8cipwdfXWbC1ulOILayA
# BSHv45mdv1PAkTulsQE8lBTHG4KJLn+vSzZBWKkGaL/wwRbZ4iLiYn68cjkMJoAa
# ihPgDXn/ug2P3PLNEAFNQgI02tLX0p+vIQ3l2HmSo4bhCBxr3DovsIv5K65NmLRJ
# nxmrrmIraFDwgwA5XF7AKkPiVkvo0OxU1LAE1c5SWzE4A7cbTA1P5wG6D8cPjcHs
# Tah1V+zofYRgJnFRLWuBF4Z3a6pDGBDbCsy5NvnKQ76p37ieFp//1I3eB62ia1Cf
# kjOF8KStpPUqdkXxMjfJ7Vnemd6vQKf+nXkfvA3AOQECJn7aLP01QR5gt8wab28S
# sNUENEyMawT8eqpjtBNJO0O9Tv7NnBE8aOJhhQVdP5WCR90eIWkrDjZeybQx8vlo
# 5rfUXIIzXv+k9MgpNGIqwMXfvRLAjBkCNXOIP/1CEQUG72miMVQs5m/O4vmJIQkh
# yqilUDB1s12uhmLYc3yd8OPMlrwIxORB5J9CxCkqvzc6EGYTcwXazPyCp7eWhzTk
# Nbwk29nfbwmmzcskIAu3StA8lic7MIIHcTCCBVmgAwIBAgITMwAAABXF52ueAptJ
# mQAAAAAAFTANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNh
# dGUgQXV0aG9yaXR5IDIwMTAwHhcNMjEwOTMwMTgyMjI1WhcNMzAwOTMwMTgzMjI1
# WjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQD
# Ex1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDCCAiIwDQYJKoZIhvcNAQEB
# BQADggIPADCCAgoCggIBAOThpkzntHIhC3miy9ckeb0O1YLT/e6cBwfSqWxOdcjK
# NVf2AX9sSuDivbk+F2Az/1xPx2b3lVNxWuJ+Slr+uDZnhUYjDLWNE893MsAQGOhg
# fWpSg0S3po5GawcU88V29YZQ3MFEyHFcUTE3oAo4bo3t1w/YJlN8OWECesSq/XJp
# rx2rrPY2vjUmZNqYO7oaezOtgFt+jBAcnVL+tuhiJdxqD89d9P6OU8/W7IVWTe/d
# vI2k45GPsjksUZzpcGkNyjYtcI4xyDUoveO0hyTD4MmPfrVUj9z6BVWYbWg7mka9
# 7aSueik3rMvrg0XnRm7KMtXAhjBcTyziYrLNueKNiOSWrAFKu75xqRdbZ2De+JKR
# Hh09/SDPc31BmkZ1zcRfNN0Sidb9pSB9fvzZnkXftnIv231fgLrbqn427DZM9itu
# qBJR6L8FA6PRc6ZNN3SUHDSCD/AQ8rdHGO2n6Jl8P0zbr17C89XYcz1DTsEzOUyO
# ArxCaC4Q6oRRRuLRvWoYWmEBc8pnol7XKHYC4jMYctenIPDC+hIK12NvDMk2ZItb
# oKaDIV1fMHSRlJTYuVD5C4lh8zYGNRiER9vcG9H9stQcxWv2XFJRXRLbJbqvUAV6
# bMURHXLvjflSxIUXk8A8FdsaN8cIFRg/eKtFtvUeh17aj54WcmnGrnu3tz5q4i6t
# AgMBAAGjggHdMIIB2TASBgkrBgEEAYI3FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQW
# BBQqp1L+ZMSavoKRPEY1Kc8Q/y8E7jAdBgNVHQ4EFgQUn6cVXQBeYl2D9OXSZacb
# UzUZ6XIwXAYDVR0gBFUwUzBRBgwrBgEEAYI3TIN9AQEwQTA/BggrBgEFBQcCARYz
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnku
# aHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMIMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIA
# QwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFNX2
# VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwu
# bWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEw
# LTA2LTIzLmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93
# d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYt
# MjMuY3J0MA0GCSqGSIb3DQEBCwUAA4ICAQCdVX38Kq3hLB9nATEkW+Geckv8qW/q
# XBS2Pk5HZHixBpOXPTEztTnXwnE2P9pkbHzQdTltuw8x5MKP+2zRoZQYIu7pZmc6
# U03dmLq2HnjYNi6cqYJWAAOwBb6J6Gngugnue99qb74py27YP0h1AdkY3m2CDPVt
# I1TkeFN1JFe53Z/zjj3G82jfZfakVqr3lbYoVSfQJL1AoL8ZthISEV09J+BAljis
# 9/kpicO8F7BUhUKz/AyeixmJ5/ALaoHCgRlCGVJ1ijbCHcNhcy4sa3tuPywJeBTp
# kbKpW99Jo3QMvOyRgNI95ko+ZjtPu4b6MhrZlvSP9pEB9s7GdP32THJvEKt1MMU0
# sHrYUP4KWN1APMdUbZ1jdEgssU5HLcEUBHG/ZPkkvnNtyo4JvbMBV0lUZNlz138e
# W0QBjloZkWsNn6Qo3GcZKCS6OEuabvshVGtqRRFHqfG3rsjoiV5PndLQTHa1V1QJ
# sWkBRH58oWFsc/4Ku+xBZj1p/cvBQUl+fpO+y/g75LcVv7TOPqUxUYS8vwLBgqJ7
# Fx0ViY1w/ue10CgaiQuPNtq6TPmb/wrpNPgkNWcr4A245oyZ1uEi6vAnQj0llOZ0
# dFtq0Z4+7X6gMTN9vMvpe784cETRkPHIqzqKOghif9lwY1NNje6CbaUFEMFxBmoQ
# tB1VM1izoXBm8qGCA1AwggI4AgEBMIH5oYHRpIHOMIHLMQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmlj
# YSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046OEQwMC0wNUUw
# LUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoB
# ATAHBgUrDgMCGgMVAG76BizYtGFrmkU7v2DcuR/ApGcooIGDMIGApH4wfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQELBQACBQDqekkRMCIY
# DzIwMjQwODI5MDExMDQxWhgPMjAyNDA4MzAwMTEwNDFaMHcwPQYKKwYBBAGEWQoE
# ATEvMC0wCgIFAOp6SRECAQAwCgIBAAICBBMCAf8wBwIBAAICEvcwCgIFAOp7mpEC
# AQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEK
# MAgCAQACAwGGoDANBgkqhkiG9w0BAQsFAAOCAQEAZD2/zlgbZkwczzRFW9FBmQal
# o7qB/NZUT/VPG0EE80T5qT2J57hFcLdsVpippl5HXWXxNqkR8kbKntt2tKM4Oxg1
# fKmp5G3KvUk3W8Og1+VbJ5KRXi2NYEkNr/SpBz6TUzYiTb6bh/GJJoDe4xlcnSYs
# 1FKeJJZ6guXbej/xIu8domUV/pSMlLqy12w8r9pFpQAcbXGmi4VeuDhlgjPsbcJ+
# xg1tfcb6pZE66T5WlhqSkvXpcOUxyHpK5hoknkfZibTOMCKqXeysGdQ5q7oAxvNG
# aUlXfiFAysBV7fji41P9QWoodJBo8aMsHaG9tHqSFDvqohKZT9WNXgyn+atlyjGC
# BA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB
# 88UKQ64DzB0xAAEAAAHzMA0GCWCGSAFlAwQCAQUAoIIBSjAaBgkqhkiG9w0BCQMx
# DQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIOUONxZSoa03s3PkwlXmd4n3
# 92yTXs6QVHUNRqr0mci/MIH6BgsqhkiG9w0BCRACLzGB6jCB5zCB5DCBvQQgGLzZ
# NIu24bhWSnzAGYmT9P5ECHzjWwb9oM7DGDo7YugwgZgwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAfPFCkOuA8wdMQABAAAB8zAiBCDct/hZ
# q4tN9NOZhjGbUjOgRR+hmr8Jl026EyWMhSA4cTANBgkqhkiG9w0BAQsFAASCAgBF
# FiuiJ7JCy+WDnJK4CLoaB4s86eIPONzKwYgBgZPuvtzHdI0x9CwYZiQXQQbA57k8
# hiJTCPpEdsafmuXuqpvnKN1Mn6Dor/dVkbZiKjz4AZG/Ac4oaUTbbMB1TY0UMyAW
# xq2E43Wq/+n/+qxY98hO5fLnR570fyFE/SkabaHUQML8AS1UjfUr0ygOqi0PAxlN
# suwwNwjdD4u1qlL4te2QgObUeM5AwNOs0NBjx3jLRLLQKSeJit5CeTlp1x5rBbcH
# XZ20hx5I3mkHfCma6k4O/yixHIxOqu7hHjyvtq7bUzbIE0hNnQ4AvHNuEy+y0SU6
# gYcrV7/ODgRxYa7ETOZMuFSS844B1BJ8SoiZ032AOeeYQ/Av6BBLBB8M6kd6kFMJ
# Ekj32ePuqLNr3b9zIh2A4ufwAazmKNcdRPJLX0TO87UFa6aMUGqhns67/uDUTA9N
# kdiOMRFrKInJtQnInr08EDs0I1ibQ0kwG5rDuPmDayrqb7c3m2YveOwoJMQ1P1Qd
# JNsbIfPl12Zu8Cqmab6dki6GkSurJ5fc/29ZO7BJC48IyBXwzqoIxaw12dX1hrLo
# uMPThHzthiT/IKTkdxGXK2UGtBR3KVgo9/BGyh2sv4lkQewoDqGgCzZ9WmcuN7eT
# koV9msFvpvD/F8i2BBnKLJFYO6X8nHz/Cjv0lfxcFQ==
# SIG # End signature block
