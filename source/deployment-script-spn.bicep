param scriptContent string
param arguments string
param location string = resourceGroup().location
param servicePrincipalId string
@secure()
param servicePrincipalKey string
param tenantId string = ''
param subscriptionId string

resource deploymentScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'deploymentScript'
  location: location
  kind: 'AzurePowerShell'
  properties: {
    azPowerShellVersion: '9.7'
    retentionInterval: 'PT1H'
    environmentVariables: [
      {
        name: 'servicePrincipalId'
        value: servicePrincipalId
      }
      {
        name: 'servicePrincipalKey'
        secureValue: servicePrincipalKey
      }
      {
        name: 'tenantId'
        value: tenantId
      }
      {
        name: 'subscriptionId'
        value: subscriptionId
      }
    ]
    arguments: arguments
    scriptContent: scriptContent
    timeout: 'PT4H'
    cleanupPreference: 'Always'
  }
}
