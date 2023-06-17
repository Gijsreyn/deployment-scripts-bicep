param (
    [string]$ResourceGroupName,
    [string]$ObjectId,
    [string]$RoleDefinitionName = 'Contributor'
)

$ErrorActionPreference = 'Stop'

try {
    $Params = @{
        ResourceGroupName  = $ResourceGroupName
        ObjectId           = $ObjectId
        RoleDefinitionName = $RoleDefinitionName
    }

    New-AzRoleAssignment @Params
}
catch {
    Write-Error $_.Exception.Message
}