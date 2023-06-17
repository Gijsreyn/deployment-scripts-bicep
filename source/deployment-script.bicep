param location string = resourceGroup().location
param arguments string = ''

resource AzurePowershellScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'AzurePowershellScript'
  location: location
  kind: 'AzurePowerShell'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '': {}
    }
  }
  properties: {
    azPowerShellVersion: '9.7'
    retentionInterval: 'PT1H'
    scriptContent: loadTextContent('../Scripts/Add-AzRoleAssignment.ps1')
    arguments: arguments
  }
}
