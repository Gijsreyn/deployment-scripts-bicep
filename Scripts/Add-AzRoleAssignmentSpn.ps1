param (
    [string]$ObjectId,
    [string]$ResourceGroupName,
    [string]$RoleDefinition = 'Contributor'
)

try {
    # Region connect Service Principal
    Write-Host -Object ("Connection service principal id - {0}" -f $env:servicePrincipalId)
    $ServicePrincipalKey = ConvertTo-SecureString -String $env:servicePrincipalKey -AsPlainText -Force
    $AzureADCred = New-Object System.Management.Automation.PSCredential($env:servicePrincipalId, $ServicePrincipalKey)
    Connect-AzAccount -ServicePrincipal -Credential $AzureADCred -TenantId $env:tenantId -Subscription $env:subscriptionId
    # End region connect Service Principal

    Write-Host -Object ("Assigning role permission - {0}" -f $RoleDefinition)
    New-AzRoleAssignment -ObjectId $ObjectId -ResourceGroupName $ResourceGroupName -RoleDefinitionName $RoleDefinition
} catch {
    Write-Error $_.Exception.Message
}

