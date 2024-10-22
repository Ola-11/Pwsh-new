
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
Updates the alert rule.
.Description
Updates the alert rule.

.Link
https://learn.microsoft.com/powershell/module/az.securityinsights/Update-azsentinelalertrule
#>
function Update-AzSentinelAlertRule {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.AlertRule])]
    [CmdletBinding(DefaultParameterSetName = 'UpdateScheduled', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(ParameterSetName = 'UpdateFusionMLTI')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.DefaultInfo(Script = '(Get-AzContext).Subscription.Id')]
        [System.String]
        # Gets subscription credentials which uniquely identify Microsoft Azure subscription.
        # The subscription ID forms part of the URI for every service call.
        ${SubscriptionId},
        
        [Parameter(ParameterSetName = 'UpdateFusionMLTI', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateNRT', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateScheduled', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [System.String]
        # The Resource Group Name.
        ${ResourceGroupName},

        [Parameter(ParameterSetName = 'UpdateFusionMLTI', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateNRT', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateScheduled', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [System.String]
        # The name of the workspace.
        ${WorkspaceName},

        [Parameter(ParameterSetName = 'UpdateFusionMLTI', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateNRT', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateScheduled', Mandatory)]
        #[Alias('RuleId')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [System.String]
        # The name of Operational Insights Resource Provider.
        ${RuleId},

        [Parameter(ParameterSetName = 'UpdateViaIdentityFusionMLTI', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftSecurityIncidentCreation', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled', Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.ISecurityInsightsIdentity]
        # Identity Parameter
        # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
        ${InputObject},

        [Parameter(ParameterSetName = 'UpdateFusionMLTI', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityFusionMLTI', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${FusionMLorTI},

        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftSecurityIncidentCreation', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${MicrosoftSecurityIncidentCreation},

        [Parameter(ParameterSetName = 'UpdateNRT', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${NRT},

        [Parameter(ParameterSetName = 'UpdateScheduled', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${Scheduled},

        [Parameter(ParameterSetName = 'UpdateFusionMLTI')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityFusionMLTI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${AlertRuleTemplateName},
        
        [Parameter(ParameterSetName = 'UpdateFusionMLTI')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityFusionMLTI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Switch]
        ${Enabled},

        [Parameter(ParameterSetName = 'UpdateFusionMLTI')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityFusionMLTI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Switch]
        ${Disabled},

        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${Description},

        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftSecurityIncidentCreation')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String[]]
        ${DisplayNamesFilter},

        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftSecurityIncidentCreation')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String[]]
        ${DisplayNamesExcludeFilter},


        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftSecurityIncidentCreation')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.MicrosoftSecurityProductName])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.MicrosoftSecurityProductName]
        ${ProductFilter},
            
        [Parameter(ParameterSetName = 'UpdateMicrosoftSecurityIncidentCreation')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftSecurityIncidentCreation')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.AlertSeverity[]]
        #High, Medium, Low, Informational
        ${SeveritiesFilter},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${Query},
        
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${DisplayName},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.DefaultInfo(Script = 'New-TimeSpan -Hours 5')]
        [System.TimeSpan]
        ${SuppressionDuration},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Switch]
        ${SuppressionEnabled},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.AlertSeverity])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.AlertSeverity]
        ${Severity},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.AttackTactic])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.AttackTactic]
        [System.String[]]
        ${Tactic},
            
        
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Switch]
        ${CreateIncident},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Switch]
        ${GroupingConfigurationEnabled},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Switch]
        ${ReOpenClosedIncident},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.DefaultInfo(Script = 'New-TimeSpan -Hours 5')]
        [System.TimeSpan]
        ${LookbackDuration},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.DefaultInfo(Script = '"AllEntities"')]
        [ValidateSet('AllEntities', 'AnyAlert', 'Selected')]
        [System.String]
        ${MatchingMethod},
            
        
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.AlertDetail])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.AlertDetail[]]
        ${GroupByAlertDetail}, 
        
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [string[]] 
        ${GroupByCustomDetail},
        
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.EntityMappingType])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.EntityMappingType[]]
        ${GroupByEntity},
    
        
        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        #'Account', 'Host', 'IP', 'Malware', 'File', 'Process', 'CloudApplication', 'DNS', 'AzureResource', 'FileHash', 'RegistryKey', 'RegistryValue', 'SecurityGroup', 'URL', 'Mailbox', 'MailCluster', 'MailMessage', 'SubmissionMail'
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.EntityMapping[]]
        ${EntityMapping},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${AlertDescriptionFormat},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${AlertDisplayNameFormat},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${AlertSeverityColumnName},

        [Parameter(ParameterSetName = 'UpdateNRT')]
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityNRT')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${AlertTacticsColumnName},


        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.TimeSpan]
        ${QueryFrequency},

        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.TimeSpan]
        ${QueryPeriod},

        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.TriggerOperator])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.TriggerOperator]
        ${TriggerOperator},
        
        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [int]
        ${TriggerThreshold},

        [Parameter(ParameterSetName = 'UpdateScheduled')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityUpdateScheduled')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.EventGroupingAggregationKind])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.EventGroupingAggregationKind]
        ${EventGroupingSettingAggregationKind},
            
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
            $null = $PSBoundParameters.Remove('FusionMLorTI')
            $null = $PSBoundParameters.Remove('MicrosoftSecurityIncidentCreation')
            $null = $PSBoundParameters.Remove('NRT')
            $null = $PSBoundParameters.Remove('Scheduled')
            #Handle Get
            $GetPSBoundParameters = @{}
            if($PSBoundParameters['InputObject']){
                $GetPSBoundParameters.Add('InputObject', $PSBoundParameters['InputObject'])
            }
            else {
                $GetPSBoundParameters.Add('ResourceGroupName', $PSBoundParameters['ResourceGroupName'])
                $GetPSBoundParameters.Add('WorkspaceName', $PSBoundParameters['WorkspaceName'])
                $GetPSBoundParameters.Add('RuleId', $PSBoundParameters['RuleId'])
            }
            $AlertRule = Az.SecurityInsights\Get-AzSentinelAlertRule @GetPSBoundParameters

            #Fusion
            if ($AlertRule.Kind -eq 'Fusion'){
                If($PSBoundParameters['AlertTemplateName']){
                    $AlertRule.AlertRuleTemplateName = $PSBoundParameters['AlertRuleTemplateName']
                    $null = $PSBoundParameters.Remove('AlertRuleTemplateName')
                }
                
                If($PSBoundParameters['Enabled']){
                    $AlertRule.Enabled = $true
                    $null = $PSBoundParameters.Remove('Enabled')
                }
                if($PSBoundParameters['Disabled']) {
                    $AlertRule.Enabled = $false
                    $null = $PSBoundParameters.Remove('Disabled')
                }
            }
            #MSIC
            if($AlertRule.Kind -eq 'MicrosoftSecurityIncidentCreation'){
                If($PSBoundParameters['AlertRuleTemplateName']){
                    $AlertRule.AlertRuleTemplateName = $PSBoundParameters['AlertRuleTemplateName']
                    $null = $PSBoundParameters.Remove('AlertRuleTemplateName')
                }
                
                If($PSBoundParameters['Enabled']){
                    $AlertRule.Enabled = $true
                    $null = $PSBoundParameters.Remove('Enabled')
                }
                if($PSBoundParameters['Disabled']) {
                    $AlertRule.Enabled = $false
                    $null = $PSBoundParameters.Remove('Disabled')
                }
                
                If($PSBoundParameters['Description']){
                    $AlertRule.Description = $PSBoundParameters['Description']
                    $null = $PSBoundParameters.Remove('Description')
                }
                
                If($PSBoundParameters['DisplayNamesFilter']){
                    $AlertRule.DisplayNamesFilter = $PSBoundParameters['DisplayNamesFilter']
                    $null = $PSBoundParameters.Remove('DisplayNamesFilter')
                }
                
                If($PSBoundParameters['DisplayNamesExcludeFilter']){
                    $AlertRule.DisplayNamesExcludeFilter = $PSBoundParameters['DisplayNamesExcludeFilter']
                    $null = $PSBoundParameters.Remove('DisplayNamesExcludeFilter')
                }
                
                If($PSBoundParameters['ProductFilter']){
                    $AlertRule.ProductFilter = $PSBoundParameters['ProductFilter']
                    $null = $PSBoundParameters.Remove('ProductFilter')
                }

                If($PSBoundParameters['SeveritiesFilter']){
                    $Parameter.SeveritiesFilter = $PSBoundParameters['SeveritiesFilter']
                    $null = $PSBoundParameters.Remove('SeveritiesFilter')
                }
            }
            #ML
            if ($AlertRule.Kind -eq 'MLBehaviorAnalytics'){
                If($PSBoundParameters['AlertRuleTemplateName']){
                    $AlertRule.AlertRuleTemplateName = $PSBoundParameters['AlertRuleTemplateName']
                    $null = $PSBoundParameters.Remove('AlertRuleTemplateName')
                }
                
                If($PSBoundParameters['Enabled']){
                    $AlertRule.Enabled = $true
                    $null = $PSBoundParameters.Remove('Enabled')
                }
                if($PSBoundParameters['Disabled']) {
                    $AlertRule.Enabled = $false
                    $null = $PSBoundParameters.Remove('Disabled')
                }
            }

            #NRT
            if($AlertRule.Kind -eq 'NRT'){
                If($PSBoundParameters['AlertRuleTemplateName']){
                    $AlertRule.Enabled = $PSBoundParameters['AlertRuleTemplateName']
                    $null = $PSBoundParameters.Remove('AlertRuleTemplateName')
                }
                
                If($PSBoundParameters['Enabled']){
                    $AlertRule.Enabled = $true
                    $null = $PSBoundParameters.Remove('Enabled')
                }
                if($PSBoundParameters['Disabled']) {
                    $AlertRule.Enabled = $false
                    $null = $PSBoundParameters.Remove('Disabled')
                }
                
                If($PSBoundParameters['Description']){
                    $AlertRule.Description = $PSBoundParameters['Description']
                    $null = $PSBoundParameters.Remove('Description')
                }
                
                If($PSBoundParameters['Query']){
                    $AlertRule.Query = $PSBoundParameters['Query']
                    $null = $PSBoundParameters.Remove('Query')
                }

                If($PSBoundParameters['DisplayName']){
                    $AlertRule.DisplayName = $PSBoundParameters['DisplayName']
                    $null = $PSBoundParameters.Remove('DisplayName')
                }

                If($PSBoundParameters['SuppressionDuration']){
                    $AlertRule.SuppressionDuration = $PSBoundParameters['SuppressionDuration']
                    $null = $PSBoundParameters.Remove('SuppressionDuration')
                }

                If($PSBoundParameters['SuppressionEnabled']){
                    $AlertRule.SuppressionEnabled = $true
                    $null = $PSBoundParameters.Remove('SuppressionEnabled')
                }
                else{
                    $AlertRule.SuppressionEnabled = $false
                }
                
                If($PSBoundParameters['Severity']){
                    $AlertRule.Severity = $PSBoundParameters['Severity']
                    $null = $PSBoundParameters.Remove('Severity')
                }
                
                If($PSBoundParameters['Tactic']){
                    $AlertRule.Tactic = $PSBoundParameters['Tactic']
                    $null = $PSBoundParameters.Remove('Tactic')
                }
                
                If($PSBoundParameters['IncidentConfigurationCreateIncident']){
                    $AlertRule.IncidentConfigurationCreateIncident = $true
                    $null = $PSBoundParameters.Remove('IncidentConfigurationCreateIncident')
                }
                else{
                    $AlertRule.IncidentConfigurationCreateIncident = $false
                }
                
                If($PSBoundParameters['Enabled']){
                    $AlertRule.GroupingConfigurationEnabled = $true
                    $null = $PSBoundParameters.Remove('Enabled')
                }
                else{
                    $AlertRule.GroupingConfigurationEnabled = $false
                }
                
                If($PSBoundParameters['ReOpenClosedIncident']){
                    $AlertRule.GroupingConfigurationReOpenClosedIncident = $true
                    $null = $PSBoundParameters.Remove('ReOpenClosedIncident')
                }
                else{
                    $AlertRule.GroupingConfigurationReOpenClosedIncident = $false
                }
                
                If($PSBoundParameters['LookbackDuration']){
                    $AlertRule.GroupingConfigurationLookbackDuration = $PSBoundParameters['LookbackDuration']
                    $null = $PSBoundParameters.Remove('LookbackDuration')
                }

                If($PSBoundParameters['MatchingMethod']){
                    $AlertRule.GroupingConfigurationMatchingMethod = $PSBoundParameters['MatchingMethod']
                    $null = $PSBoundParameters.Remove('MatchingMethod')
                }

                If($PSBoundParameters['GroupByAlertDetail']){
                    $AlertRule.GroupingConfigurationGroupByAlertDetail = $PSBoundParameters['GroupByAlertDetail']
                    $null = $PSBoundParameters.Remove('GroupByAlertDetail')
                }

                If($PSBoundParameters['GroupByCustomDetail']){
                    $AlertRule.GroupingConfigurationGroupByCustomDetail = $PSBoundParameters['GroupByCustomDetail']
                    $null = $PSBoundParameters.Remove('GroupByCustomDetail')
                }
                
                If($PSBoundParameters['GroupByEntity']){
                    $AlertRule.GroupingConfigurationGroupByEntity = $PSBoundParameters['GroupByEntity']
                    $null = $PSBoundParameters.Remove('GroupByEntity')
                }

                If($PSBoundParameters['EntityMapping']){
                    $AlertRule.EntityMapping = $PSBoundParameters['EntityMapping']
                    $null = $PSBoundParameters.Remove('EntityMapping')
                }

                If($PSBoundParameters['AlertDescriptionFormat']){
                    $AlertRule.AlertDetailOverrideAlertDescriptionFormat = $PSBoundParameters['AlertDescriptionFormat']
                    $null = $PSBoundParameters.Remove('AlertDescriptionFormat')
                }

                If($PSBoundParameters['AlertDisplayNameFormat']){
                    $AlertRule.AlertDetailOverrideAlertDisplayNameFormat = $PSBoundParameters['AlertDisplayNameFormat']
                    $null = $PSBoundParameters.Remove('AlertDisplayNameFormat')
                }

                If($PSBoundParameters['AlertSeverityColumnName']){
                    $AlertRule.AlertDetailOverrideAlertSeverityColumnName = $PSBoundParameters['AlertSeverityColumnName']
                    $null = $PSBoundParameters.Remove('AlertSeverityColumnName')
                }

                If($PSBoundParameters['AlertTacticsColumnName']){
                    $AlertRule.AlertDetailOverrideAlertTacticsColumnName = $PSBoundParameters['AlertTacticsColumnName']
                    $null = $PSBoundParameters.Remove('AlertTacticsColumnName')
                }
                
            }
            #Scheduled
            if ($AlertRule.Kind -eq 'Scheduled'){
                If($PSBoundParameters['AlertRuleTemplateName']){
                    $AlertRule.Enabled = $PSBoundParameters['AlertRuleTemplateName']
                    $null = $PSBoundParameters.Remove('AlertRuleTemplateName')
                }
                
                If($PSBoundParameters['Enabled']){
                    $AlertRule.Enabled = $true
                    $null = $PSBoundParameters.Remove('Enabled')
                }
                if($PSBoundParameters['Disabled']) {
                    $AlertRule.Enabled = $false
                    $null = $PSBoundParameters.Remove('Disabled')
                }
                
                If($PSBoundParameters['Description']){
                    $AlertRule.Description = $PSBoundParameters['Description']
                    $null = $PSBoundParameters.Remove('Description')
                }
                
                If($PSBoundParameters['Query']){
                    $AlertRule.Query = $PSBoundParameters['Query']
                    $null = $PSBoundParameters.Remove('Query')
                }

                If($PSBoundParameters['DisplayName']){
                    $AlertRule.DisplayName = $PSBoundParameters['DisplayName']
                    $null = $PSBoundParameters.Remove('DisplayName')
                }

                If($PSBoundParameters['SuppressionDuration']){
                    $AlertRule.SuppressionDuration = $PSBoundParameters['SuppressionDuration']
                    $null = $PSBoundParameters.Remove('SuppressionDuration')
                }

                If($PSBoundParameters['SuppressionEnabled']){
                    $AlertRule.SuppressionEnabled = $true
                    $null = $PSBoundParameters.Remove('SuppressionEnabled')
                }
                else{
                    $AlertRule.SuppressionEnabled = $false
                }
                
                If($PSBoundParameters['Severity']){
                    $AlertRule.Severity = $PSBoundParameters['Severity']
                    $null = $PSBoundParameters.Remove('Severity')
                }

                If($PSBoundParameters['Tactic']){
                    $AlertRule.Tactic = $PSBoundParameters['Tactic']
                    $null = $PSBoundParameters.Remove('Tactic')
                }
                
                If($PSBoundParameters['CreateIncident']){
                    $AlertRule.IncidentConfigurationCreateIncident = $true
                    $null = $PSBoundParameters.Remove('CreateIncident')
                }
                else{
                    $AlertRule.IncidentConfigurationCreateIncident = $false
                }
                
                If($PSBoundParameters['GroupingConfigurationEnabled']){
                    $AlertRule.GroupingConfigurationEnabled = $true
                    $null = $PSBoundParameters.Remove('GroupingConfigurationEnabled')
                }
                else{
                    $AlertRule.GroupingConfigurationEnabled = $false
                }
                
                If($PSBoundParameters['ReOpenClosedIncident']){
                    $AlertRule.GroupingConfigurationReOpenClosedIncident = $PSBoundParameters['ReOpenClosedIncident']
                    $null = $PSBoundParameters.Remove('ReOpenClosedIncident')
                }
                else{
                    $AlertRule.GroupingConfigurationReOpenClosedIncident = $false
                }
                
                If($PSBoundParameters['LookbackDuration']){
                    $AlertRule.GroupingConfigurationLookbackDuration = $PSBoundParameters['LookbackDuration']
                    $null = $PSBoundParameters.Remove('LookbackDuration')
                }

                If($PSBoundParameters['MatchingMethod']){
                    $AlertRule.GroupingConfigurationMatchingMethod = $PSBoundParameters['MatchingMethod']
                    $null = $PSBoundParameters.Remove('MatchingMethod')
                }

                If($PSBoundParameters['GroupByAlertDetail']){
                    $AlertRule.GroupingConfigurationGroupByAlertDetail = $PSBoundParameters['GroupByAlertDetail']
                    $null = $PSBoundParameters.Remove('GroupByAlertDetail')
                }

                If($PSBoundParameters['GroupByCustomDetail']){
                    $AlertRule.GroupingConfigurationGroupByCustomDetail = $PSBoundParameters['GroupByCustomDetail']
                    $null = $PSBoundParameters.Remove('GroupByCustomDetail')
                }
                
                If($PSBoundParameters['GroupByEntity']){
                    $AlertRule.GroupingConfigurationGroupByEntity = $PSBoundParameters['GroupByEntity']
                    $null = $PSBoundParameters.Remove('GroupByEntity')
                }

                If($PSBoundParameters['EntityMapping']){
                    $AlertRule.EntityMapping = $PSBoundParameters['EntityMapping']
                    $null = $PSBoundParameters.Remove('EntityMapping')
                }

                If($PSBoundParameters['AlertDescriptionFormat']){
                    $AlertRule.AlertDetailOverrideAlertDescriptionFormat = $PSBoundParameters['AlertDescriptionFormat']
                    $null = $PSBoundParameters.Remove('AlertDescriptionFormat')
                }

                If($PSBoundParameters['AlertDisplayNameFormat']){
                    $AlertRule.AlertDetailOverrideAlertDisplayNameFormat = $PSBoundParameters['AlertDisplayNameFormat']
                    $null = $PSBoundParameters.Remove('AlertDisplayNameFormat')
                }

                If($PSBoundParameters['AlertSeverityColumnName']){
                    $AlertRule.AlertDetailOverrideAlertSeverityColumnName = $PSBoundParameters['AlertSeverityColumnName']
                    $null = $PSBoundParameters.Remove('AlertSeverityColumnName')
                }

                If($PSBoundParameters['AlertTacticsColumnName']){
                    $AlertRule.AlertDetailOverrideAlertTacticsColumnName = $PSBoundParameters['AlertTacticsColumnName']
                    $null = $PSBoundParameters.Remove('AlertTacticsColumnName')
                }

                If($PSBoundParameters['QueryFrequency']){
                    $AlertRule.QueryFrequency = $PSBoundParameters['QueryFrequency']
                    $null = $PSBoundParameters.Remove('QueryFrequency')
                }

                If($PSBoundParameters['QueryPeriod']){
                    $AlertRule.QueryPeriod = $PSBoundParameters['QueryPeriod']
                    $null = $PSBoundParameters.Remove('QueryPeriod')
                }

                If($PSBoundParameters['TriggerOperator']){
                    $AlertRule.TriggerOperator = $PSBoundParameters['TriggerOperator']
                    $null = $PSBoundParameters.Remove('TriggerOperator')
                }

                If($null -ne $PSBoundParameters['TriggerThreshold']){
                    $AlertRule.TriggerThreshold = $PSBoundParameters['TriggerThreshold']
                    $null = $PSBoundParameters.Remove('TriggerThreshold')
                }

                If($PSBoundParameters['EventGroupingSettingAggregationKind']){
                    $AlertRule.EventGroupingSettingAggregationKind = $PSBoundParameters['EventGroupingSettingAggregationKind']
                    $null = $PSBoundParameters.Remove('EventGroupingSettingAggregationKind')
                }
            }
            #TI
            if ($AlertRule.Kind -eq 'ThreatIntelligence'){
                If($PSBoundParameters['AlertRuleTemplateName']){
                    $AlertRule.AlertRuleTemplateName = $PSBoundParameters['AlertRuleTemplateName']
                    $null = $PSBoundParameters.Remove('AlertRuleTemplateName')
                }

                If($PSBoundParameters['Enabled']){
                    $AlertRule.Enabled = $true
                    $null = $PSBoundParameters.Remove('Enabled')
                }
                if($PSBoundParameters['Disabled']) {
                    $AlertRule.Enabled = $false
                    $null = $PSBoundParameters.Remove('Disabled')
                }
            }
            
            $null = $PSBoundParameters.Add('AlertRule', $AlertRule) 

            Az.SecurityInsights.internal\Update-AzSentinelAlertRule @PSBoundParameters
        }
        catch {
            throw
        }
    }
}

# SIG # Begin signature block
# MIIoLQYJKoZIhvcNAQcCoIIoHjCCKBoCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCABPsycJ7BsYY2E
# kLPOfFIMTvaLzczMlBCUSLq8EWnuQ6CCDXYwggX0MIID3KADAgECAhMzAAADrzBA
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIHvL1/dnSgtlnyAvjmL+ba/3
# Cb7j+Qay4EsCYNCqSwfOMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAMdqKndps6bT43k1XDVRxErIY+lVJ3bBwi5/8wuyu2+oTISYF6+llmED1
# ctu1qx9XNluqt8dY8W3PXjTlpOzj5Ry96MMiJK4/7ndM67Fkznz4USPc/KDeRqyY
# ARusRGCo3ajvBjR5SPA8wU33gM0+K9ibVyYiDNEiY+LFL0JFyEufR0nvUQHFD7dM
# LQF7F0PWOoj7pif6Qnfoj5NwqsLqgZo/HxcUM6hk6RV98dLewvtP7U7E/4ebt8q0
# YjGU3syCS011mMH000GutGuCMCDmXX04Y6sV9kvO9ZfRQCs1Sr+/swO5ltWK8XyC
# KqGi1vLrHFGdAJEX/bQLWpak5fam+aGCF5cwgheTBgorBgEEAYI3AwMBMYIXgzCC
# F38GCSqGSIb3DQEHAqCCF3AwghdsAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFSBgsq
# hkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCBE7FphqzIIkjgwd4Z9iFD63FjyaqnxicmfBSvjUgSmbAIGZhgUnUrq
# GBMyMDI0MDQyMzEzMTUxMi4yMTRaMASAAgH0oIHRpIHOMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046OTYwMC0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wg
# ghHtMIIHIDCCBQigAwIBAgITMwAAAe+JP1ahWMyo2gABAAAB7zANBgkqhkiG9w0B
# AQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMzEyMDYxODQ1
# NDhaFw0yNTAzMDUxODQ1NDhaMIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25z
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046OTYwMC0wNUUwLUQ5NDcxJTAjBgNV
# BAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCjC1jinwzgHwhOakZqy17oE4BIBKsm5kX4DUmCBWI0
# lFVpEiK5mZ2Kh59soL4ns52phFMQYGG5kypCipungwP9Nob4VGVE6aoMo5hZ9Nyt
# XR5ZRgb9Z8NR6EmLKICRhD4sojPMg/RnGRTcdf7/TYvyM10jLjmLyKEegMHfvIwP
# mM+AP7hzQLfExDdqCJ2u64Gd5XlnrFOku5U9jLOKk1y70c+Twt04/RLqruv1fGP8
# LmYmtHvrB4TcBsADXSmcFjh0VgQkX4zXFwqnIG8rgY+zDqJYQNZP8O1Yo4kSckHT
# 43XC0oM40ye2+9l/rTYiDFM3nlZe2jhtOkGCO6GqiTp50xI9ITpJXi0vEek8AejT
# 4PKMEO2bPxU63p63uZbjdN5L+lgIcCNMCNI0SIopS4gaVR4Sy/IoDv1vDWpe+I28
# /Ky8jWTeed0O3HxPJMZqX4QB3I6DnwZrHiKn6oE38tgBTCCAKvEoYOTg7r2lF0Iu
# bt/3+VPvKtTCUbZPFOG8jZt9q6AFodlvQntiolYIYtqSrLyXAQIlXGhZ4gNcv4dv
# 1YAilnbWA9CsnYh+OKEFr/4w4M69lI+yaoZ3L/t/UfXpT/+yc7hS/FolcmrGFJTB
# YlS4nE1cuKblwZ/UOG26SLhDONWXGZDKMJKN53oOLSSk4ldR0HlsbT4heLlWlOEl
# JQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFO1MWqKFwrCbtrw9P8A63bAVSJzLMB8G
# A1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYwVKBSoFCG
# Tmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUy
# MFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcBAQRgMF4w
# XAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY2Vy
# dHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3J0MAwG
# A1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQD
# AgeAMA0GCSqGSIb3DQEBCwUAA4ICAQAYGZa3aCDudbk9EVdkP8xcQGZuIAIPRx9K
# 1CA7uRzBt80fC0aWkuYYhQMvHHJRHUobSM4Uw3zN7fHEN8hhaBDb9NRaGnFWdtHx
# mJ9eMz6Jpn6KiIyi9U5Og7QCTZMl17n2w4eddq5vtk4rRWOVvpiDBGJARKiXWB9u
# 2ix0WH2EMFGHqjIhjWUXhPgR4C6NKFNXHvWvXecJ2WXrJnvvQGXAfNJGETJZGpR4
# 1nUN3ijfiCSjFDxamGPsy5iYu904Hv9uuSXYd5m0Jxf2WNJSXkPGlNhrO27pPxgT
# 111myAR61S3S2hc572zN9yoJEObE98Vy5KEM3ZX53cLefN81F1C9p/cAKkE6u9V6
# ryyl/qSgxu1UqeOZCtG/iaHSKMoxM7Mq4SMFsPT/8ieOdwClYpcw0CjZe5KBx2xL
# a4B1neFib8J8/gSosjMdF3nHiyHx1YedZDtxSSgegeJsi0fbUgdzsVMJYvqVw52W
# qQNu0GRC79ZuVreUVKdCJmUMBHBpTp6VFopL0Jf4Srgg+zRD9iwbc9uZrn+89odp
# InbznYrnPKHiO26qe1ekNwl/d7ro2ItP/lghz0DoD7kEGeikKJWHdto7eVJoJhkr
# UcanTuUH08g+NYwG6S+PjBSB/NyNF6bHa/xR+ceAYhcjx0iBiv90Mn0JiGfnA2/h
# Lj5evhTcAjCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZI
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
# MCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjk2MDAtMDVFMC1EOTQ3MSUwIwYDVQQD
# ExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQBL
# cI81gxbea1Ex2mFbXx7ck+0g/6CBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6dG73jAiGA8yMDI0MDQyMzA0NDcy
# NloYDzIwMjQwNDI0MDQ0NzI2WjB3MD0GCisGAQQBhFkKBAExLzAtMAoCBQDp0bve
# AgEAMAoCAQACAh+EAgH/MAcCAQACAhMpMAoCBQDp0w1eAgEAMDYGCisGAQQBhFkK
# BAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJ
# KoZIhvcNAQELBQADggEBABJdIQV1pLAu6DiUVtodnUy7lXjWSGDwYaTCHoo9PazM
# jgR6YnsaMrEjrKRG7LvRas4wSN1VNa6Y7lZOl+nM/fYIFUVs2jE+JAwA99zjMo+8
# ZFvP10MzX7NTpzkXgthy0Upf9VcZdLyC8nCO5i2y8LxuuYL0iSKGEWKWYbvKJSWm
# Qz59LZiFQcR/SQTz9oZ6CR8TjJUWqtiEq767vBckeECh2kLDm5ZSFYMULCQ99pNj
# FASrfTnCFrCeaf+1D3Id5kZZdY28wsWohBWiQrzjHuwmMA16COHUoWgRCmlc8LYe
# hSgrKjHFQdQ2ukQwsaJRGdpl4m99DT9VWBVvOfGtx1AxggQNMIIECQIBATCBkzB8
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1N
# aWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAe+JP1ahWMyo2gABAAAB
# 7zANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEE
# MC8GCSqGSIb3DQEJBDEiBCBlLEeL0SqO7Pr/OdVZJo1QDUWSAZxJqk8AbPqSXLnz
# MTCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIPBhKEW4Fo3wUz09NQx2a0Db
# cdsX8jovM5LizHmnyX+jMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAHviT9WoVjMqNoAAQAAAe8wIgQgaD4TcRz6I1uvFPd/K+7zJ3KI
# YTfBjg+/VoKqmjIKTMUwDQYJKoZIhvcNAQELBQAEggIAYVSS98WwqjqlSHLOiUjU
# fCsT47lVuU74L6s58YE39mq7aS5J8wqvVLCHhrA3oXxB0OgvvwOP7QN5EcRIp8q8
# 3yEg7+MFNeJEMZyvTnVgfgtuOzaRm/9FtnHkWJfkNzw0Zp4GWbzWGunlWuYUavot
# q2khhQG+I9is9XeybTy3Gje5dCVesCtKmK5gwIB/3dE5yUVw6ZyCrkOx0Yx6Zocz
# 3UEEw8Xo6u7GXbt+Os7q3r715xeHVVpmrhkt0xa6bpX4wGRBazXjSU28wIqVAY5D
# W3BeSREuM7xfIuw7cwlqE6CqP4KZXGX87lnAXlzz9IrfnZjSh6+Qxa2XkeQSRtjl
# OtheEP/dmOys0OrFcZ3cRjaMzAc1GIlbEAR63G7Hzf/ab4kGiv3CFKj3XDbKDEDx
# OU8kQwT8EHvJUn57V68UbrTlos3qWdzY2ont1iC6a73A5853UpQ7Poe8txp4c1LU
# CT1DJqCkci0LLzTZlbMzG3Vi4Lu3J88e9/UpbeTxZEpBaMbg/hEq//+1NCcc+HaN
# 0hXdxTuimOyvITIzQF5y+eQqugB0wKw87Wjfh3LwMeY6tG/jKd7NKPIkLR19SChq
# NuLAsi+SGTLs4VMSz8h+uiLGCM/J85pKX4aHHTR/5MVbWN7bNEmHr6ovJvbLyxP1
# XvKeMJm6wsTn9+zUWavTfrU=
# SIG # End signature block
