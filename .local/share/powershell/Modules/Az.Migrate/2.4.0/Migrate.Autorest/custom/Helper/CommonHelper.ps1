function CheckResourceGraphModuleDependency {
    [Microsoft.Azure.PowerShell.Cmdlets.Migrate.DoNotExportAttribute()]
    param() 

    process {
        $module = Get-Module -ListAvailable | Where-Object { $_.Name -eq "Az.ResourceGraph" }
        if ($null -eq $module) {
            $message = "Az.ResourceGraph Module must be installed to run this command. Please run 'Install-Module -Name Az.ResourceGraph' to install and continue."
            throw $message
        }
    }
}

function CheckResourcesModuleDependency {
    [Microsoft.Azure.PowerShell.Cmdlets.Migrate.DoNotExportAttribute()]
    param() 

    process {
        $module = Get-Module -ListAvailable | Where-Object { $_.Name -eq "Az.Resources" }
        if ($null -eq $module) {
            $message = "Az.Resources Module must be installed to run this command. Please run 'Install-Module -Name Az.Resources' to install and continue."
            throw $message
        }
    }
}

function CheckStorageModuleDependency {
    [Microsoft.Azure.PowerShell.Cmdlets.Migrate.DoNotExportAttribute()]
    param() 

    process {
        $module = Get-Module -ListAvailable | Where-Object { $_.Name -eq "Az.Storage" }
        if ($null -eq $module) {
            $message = "Az.Storage Module must be installed to run this command. Please run 'Install-Module -Name Az.Storage' to install and continue."
            throw $message
        }
    }
}

function GetHCIClusterARGQuery {
    [Microsoft.Azure.PowerShell.Cmdlets.Migrate.DoNotExportAttribute()]
    param(
        [Parameter(Mandatory)]
        [System.String]
        # Specifies HCI Cluster Id.
        ${HCIClusterID}
    )

    process {
        $query = @"
resources | where type == 'microsoft.extendedlocation/customlocations'
| mv-expand ClusterId = properties['clusterExtensionIds']
| extend ClusterId = toupper(tostring(ClusterId))
| extend CustomLocation = toupper(tostring(id))
| extend resourceBridgeID = toupper(tostring(properties['hostResourceId']))
| extend customLocationRegion = location
| join (
    kubernetesconfigurationresources
    | where type == 'microsoft.kubernetesconfiguration/extensions'
    | where properties['ConfigurationSettings']['HCIClusterID'] =~ '$HCIClusterID'
    | project ClusterId = id
    | extend ClusterId = toupper(tostring(ClusterId))
) on ClusterId
| join (
    resources
    | where type == 'microsoft.resourceconnector/appliances'
    | where properties['provisioningState'] == 'Succeeded'
    | extend statusOfTheBridge = properties['status']
    | extend resourceBridgeID = toupper(tostring(id))
) on resourceBridgeID
"@
        return $query
    }
}

function IsReservedOrTrademarked {
    [Microsoft.Azure.PowerShell.Cmdlets.Migrate.DoNotExportAttribute()]
    param(
        [Parameter(Mandatory)]
        [System.String]
        # Specifies VM name.
        ${Value}
    )

    $uppercased = $Value.ToUpper();

    # cannot be exactly one of these, but could be slighlty differnet (e.g. hololens2)
    $reservedWords = @(
        "ACCESS",
        "APP_CODE",
        "APP_THEMES",
        "APP_DATA",
        "APP_GLOBALRESOURCES",
        "APP_LOCALRESOURCES",
        "APP_WEBREFERENCES",
        "APP_BROWSERS",
        "AZURE",
        "BING",
        "BIZSPARK",
        "BIZTALK",
        "CORTANA",
        "DIRECTX",
        "DOTNET",
        "DYNAMICS",
        "EXCEL",
        "EXCHANGE",
        "FOREFRONT",
        "GROOVE",
        "HOLOLENS",
        "HYPERV",
        "KINECT",
        "LYNC",
        "MSDN",
        "O365",
        "OFFICE",
        "OFFICE365",
        "ONEDRIVE",
        "ONENOTE",
        "OUTLOOK",
        "POWERPOINT",
        "SHAREPOINT",
        "SKYPE",
        "VISIO",
        "VISUALSTUDIO"
    )

    # The following words can't be used as either a whole word or a substring in the name:
    $microsoft = "MICROSOFT";
    $windows = "WINDOWS";

    # The following words can't be used at the start of a resource name, but can be used later in the name:
    $startLogin = "LOGIN";
    $startXbox = "XBOX";

    if ($uppercased.startsWith($startLogin) -or $uppercased.startsWith($startXbox)) {
        return $true;
    }

    if ($uppercased.contains($microsoft) -or $uppercased.contains($windows)) {
        return $true;
    }

    foreach ($reservedName in $reservedWords) {
        if ($uppercased -eq $reservedName) {
            return $true;
        }
    }

    return $false;
}

function GenerateHashForArtifact {
    [Microsoft.Azure.PowerShell.Cmdlets.Migrate.DoNotExportAttribute()]
    param(
        [Parameter(Mandatory)]
        [System.String]
        # Specifies resource group name.
        ${Artifact}
    )

    $hashCode = 0
    $artifactLength = $Artifact.Length
    $tempItemLength = 0
    if ($artifactLength -gt 0) {
        while ($tempItemLength -lt $artifactLength) {
            $hashCode = ((($hashCode -shl 5) - $hashCode) + $Artifact[$tempItemLength++] -bor 0)
            
            # Treat as Double, then convert to Bytes, then convert back to Int32 to match JavaScript behavior
            $hashCode = [System.BitConverter]::ToInt32([System.BitConverter]::GetBytes($hashCode), 0)
        }
    }

    if ($hashCode -lt 0) {
        return -1 * $hashCode
    }
    else {
        return $hashCode
    }
}

function InvokeAzMigrateGetCommandWithRetries {
    [Microsoft.Azure.PowerShell.Cmdlets.Migrate.DoNotExportAttribute()]
    param(
        [Parameter(Mandatory)]
        [System.String]
        # Specifies the name of Az.Migrate command.
        ${CommandName},

        [Parameter(Mandatory)]
        [System.Collections.Hashtable]
        # Specifies the parameters for Az.Migrate command.
        ${Parameters},

        [Parameter()]
        [System.Int32]
        # Specifies the maximum number of retries.
        ${MaxRetryCount} = 3,

        [Parameter()]
        [System.Int32]
        # Specifies the delay between retries in seconds.
        ${RetryDelayInSeconds} = 30,

        [Parameter()]
        [System.String]
        # Specifies the error message to throw if command fails.
        ${ErrorMessage} = "Internal Az.Migrate commands failed to execute."
    )

    process {
        for ($i = 0; $i -le $MaxRetryCount; $i++) {
            try {
                $result = & $CommandName @Parameters -ErrorVariable notPresent -ErrorAction SilentlyContinue

                if ($null -eq $result) {
                    throw $ErrorMessage
                }

                break
            }
            catch {
                if ($i -lt $MaxRetryCount) {
                    Start-Sleep -Seconds $RetryDelayInSeconds
                }
                else {
                    throw $ErrorMessage
                }
            }
        }

        return $result
    }
}
# SIG # Begin signature block
# MIInwQYJKoZIhvcNAQcCoIInsjCCJ64CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDXw7OjnUfoxcjr
# B0rR8WACKeiYNNbTx7Wj6k3lu3fU7qCCDXYwggX0MIID3KADAgECAhMzAAADrzBA
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
# /Xmfwb1tbWrJUnMTDXpQzTGCGaEwghmdAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAOvMEAOTKNNBUEAAAAAA68wDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIKZMu/7uKd7H4oQmiMWxUJpk
# CG43NLkuUTNsPbnM00UOMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAZqFuocdMYRrnr2TpbYjdCIfgavUwP+UA/0XBjm2wf7rn6dTXwhsFHXMJ
# wbn7IPjpzTPy4qd0pVaueruU7yqLSgcgIllyLppLhHlTe8MloxgWPwlSqIZXl/O7
# oPdIN3Kx2gBwu2Tp+P6M+tMpi230jrli30RL6+O3Saq7QIUn7NE3ibpYimi4NOhr
# tN9fLdhPLZ5syvW+Z7r+vV+FNiY7BfjyLZOlMTLZON5AxzE0+kHGZrqvkMdgdS3Q
# 8D1zZ6lQvwSKNtM3RNvHCBBYQJ31KbWYkr11E7FwAM/p7vVK4OZDrgI6dtq6JaeS
# zym0V5bhbnOL4HgFGV+Hb9+e9m5/1KGCFyswghcnBgorBgEEAYI3AwMBMYIXFzCC
# FxMGCSqGSIb3DQEHAqCCFwQwghcAAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFYBgsq
# hkiG9w0BCRABBKCCAUcEggFDMIIBPwIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCDncpZMai2Joy60KbhthDhKwWNQzYNGdaqH9aGF/SgA7wIGZnLCLkhi
# GBIyMDI0MDcwNDA4MzA1MC41NFowBIACAfSggdikgdUwgdIxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVs
# YW5kIE9wZXJhdGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046
# MkFENC00QjkyLUZBMDExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNl
# cnZpY2WgghF7MIIHJzCCBQ+gAwIBAgITMwAAAd6eSJ6WnyhEPQABAAAB3jANBgkq
# hkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMzEw
# MTIxOTA3MTJaFw0yNTAxMTAxOTA3MTJaMIHSMQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVy
# YXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOjJBRDQtNEI5
# Mi1GQTAxMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIIC
# IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAtIH0HIX1QgOEDrEWs6eLD/Gw
# OXyxKL2s4I5dJI7hUxCOc0YCjlUfHSKKMwQwf0tjZJQgGRVBLQyXqRH5NqCRQ9to
# SnCOFDWamuFGAlP+OVKeJzjZUMCjR6fgkjrGdegChagrJJjz9E4gp2mmGAjs4lvh
# ceTU/exfak1nfYsNjWS1yErX+FbI+VuVpcAdG7QTfKe/CtLz9tyisA07oOO7KzJL
# 3NSav7DcfcAS9KCzZF64uPamQFx9bVQ8IW50t3sg9nZELih1BwQ+djXaPKlg+dLr
# JkCzSkumrQpEVTIHXHrHo5Tvey52Ic43XqYTSXostP06YajRL3gHGDc3/doTp9Ru
# dWh6ZVzsWQUu6bwqRlxtDtw4dIBYYnF0K+jk61S1F1Kp/zkWSUJcgiSDiybucz1O
# S1RV87SSnqTHubKyAPRCvHHr/mhqqfA5NYs3Mr4EKLUbudQPWm165e9Cnx8TUqlO
# Ocb/U4l56HAo00+Ma33xXQGaiBlN7dLEGQ545DIsD77kfKD8vryl74Otmhk9cloZ
# T+IGIWYv66X86Ld3zfMsAeUdCYf9UY0F9HA/6LG+qHKT8R5vC5dUlj6tPJ9tF+6H
# 2fQBoyGE3HGDq0YrJlLgQASIPGsX2YBkTLx7yt/p2Uohfl3dpAuj18N1rVlM7D5c
# BwC+Pb83cMtUZmUeceUCAwEAAaOCAUkwggFFMB0GA1UdDgQWBBRrMCZvGx5pqmB3
# HMrw6z6do9ASyDAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNV
# HR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Ny
# bC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYI
# KwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAy
# MDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMI
# MA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsFAAOCAgEA4pTAexcNpwY69QiC
# zkcOA+zQtnWrIdLoLrB8qUtoPfq1l9ta3XH4YyJrNK7L4azGJUfOSExb4WoryCu4
# tBY3+w4Jf58ZSBP0tPbVxEilxmPj9kUi/C2QFywLPVcRSxdg5IlQ+K1jsTxtuV2a
# aFhnb2n5dCkhywb+r5iOSoFb2bDSu7Ux/ExNCz0xMOIPbyABUas8Dc3KSJIKG92p
# LtVf78twTP1RvO2j/DbxYDwc4IeoFNsNEeaI/swiP5JCYj1UhrJiwgZGO96WY1rQ
# 69tT0IlLP818wSB/Y0cxlRhbwqpYSMiM98cgrFaU0xiG5Z9ZFIdkIrIgA0DRokvi
# ygdC3PNnYyc1+NhjznXAdiMaDBSP+GUtGBA7lLfRnHvwaoEp/KWnblo5Yn+o+EL4
# NczaBdqMhduX6OkZxUA3C0UW6MIlF1lt4fVH5DjUWOAGDibc5MUMai3kNK5WRCCO
# S7uk5U+2V0TjpCUOD/ZaE+lNDFcfriw/UZ+QDBS23qutkz88LBEbqCKtiadNEsuy
# JwGGhguH4QQWNW+JcAZOTqme7yPH/hY9a7SOzPvIXODzb8UyoKT3Arcu/IsDIMc3
# 4XFscDG2DBp3ugtA8zRYYRF0HW6Y8IiJixJ/+Pv0Sod2g3BBhE5Wb5lfXRFfefpt
# GYCeyR42GLTCdVp5WiAsx0YP6eowggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZ
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
# HVUzWLOhcGbyoYIC1zCCAkACAQEwggEAoYHYpIHVMIHSMQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFu
# ZCBPcGVyYXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOjJB
# RDQtNEI5Mi1GQTAxMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2
# aWNloiMKAQEwBwYFKw4DAhoDFQBooFKKzLjLzqmXxfLbYIlkTETa86CBgzCBgKR+
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBBQUAAgUA
# 6jBc5zAiGA8yMDI0MDcwNDA3MjczNVoYDzIwMjQwNzA1MDcyNzM1WjB3MD0GCisG
# AQQBhFkKBAExLzAtMAoCBQDqMFznAgEAMAoCAQACAiVrAgH/MAcCAQACAhHtMAoC
# BQDqMa5nAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEA
# AgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQADgYEAjzyCR44VeRJ2uW5v
# xThctesIOIuJ57mKIGGRJN9fVhb1W+K+8U9y4aGz82xhkSQ6KFSNzm3vcrK2SLsP
# UjWe8M/OL8zLPGM0JXjnZNUxhb1XhEKKSEGkHqfzpgaFznQ9S9s2IZszxF5LIdaU
# EqGLphT15TjLjgQnGC60GTk2Or0xggQNMIIECQIBATCBkzB8MQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBQQ0EgMjAxMAITMwAAAd6eSJ6WnyhEPQABAAAB3jANBglghkgBZQME
# AgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJ
# BDEiBCCkq7pmgFpfuwB9Wvddkln0o8CNB1YQ1tOFe+OmRZCu0TCB+gYLKoZIhvcN
# AQkQAi8xgeowgecwgeQwgb0EII4+I58NwV4QEEkCf+YLcyCtPnD9TbPzUtgPjgdz
# fh17MIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAHe
# nkielp8oRD0AAQAAAd4wIgQg97zU1GMlkfoRHwGSXAVdsYrb3uTCnoP1dFSCY9Xr
# WzowDQYJKoZIhvcNAQELBQAEggIAaeNrYx3ciJnYo+y2yNQpygiaPrnBW9WkBOnD
# 64U6m8Y8WLOaA5crVXGBCOOysipoqLiZej2qaxuKRc7e+owyz/owEYvTS5FVgPHj
# lUGZ3u78lxjxXnQRYBjEb9fLk4T+oP5xwBzCub0nIk0rKxOS6HPIhYV8JSQRQ7lJ
# OTzSpD6lwDK43mrYPTgZ1FnQStx+mM8Wy3PO6iEIKd+ABMg04VTBe50MTUV+6VnY
# RzOsVTtmxjST6HRy9NDxx+t7oxo6KD9ex4yEEibXyo5Cce0x/L/TXkiQlbHAdHvU
# dJcpx6G8wYggNQFUMJxNycE/0hWaBo8nMkbWqdp1nL3prcy+zQYVKXBtBmyZ+UCD
# A81rr3Pcqc4tDNl7G84QA5x9nAlivbYbTF3u0YBaNoE1s6Nh5EAzPpPHqowrpi1T
# J84yFlxoD329OUjDkBEp5g2SOoWAunfBoknu4BFol/p6Qf6la3eoXaLS2kHpVFvG
# LbaPm/EHHn8IV9MiM07J5HhoN1KG1EQglUhDZ7ZA6/napk/ALq7zHjeijulQA8IO
# nL086IBe1A+G+5JLFtoG94fGosl3wSbmy04qNeogYtGRL4Jx7tujfGQBth+NrRvP
# 0qOfygPTxlkdRa0keibjUFCOG9eHRhp1eutrV0xxd3Fzk/xvP0ncjozk3JBl8H1G
# qc5/u1I=
# SIG # End signature block
