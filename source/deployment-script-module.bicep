@description('Specify the content to run.')
param scriptContent string

@description('Specify the argument to pass to script if it contains parameters.')
param arguments string = ''

@description('Location of the deploymentScript resource.')
param location string = resourceGroup().location

@description('The service principal ID')
param servicePrincipalId string

@description('The service principal key to authenticate the service principal')
@secure()
param servicePrincipalKey string

@description('The tenant ID of Azure')
param tenantId string

@description('The subscription to connect to of Azure')
param subscriptionId string

module deploymentScript 'deployment-script-spn.bicep' = {
  name: 'deploymentscript-az-ps'
  params: {
    arguments: arguments
    scriptContent: scriptContent
    location: location
    servicePrincipalId: servicePrincipalId
    servicePrincipalKey: servicePrincipalKey
    tenantId: tenantId
    subscriptionId: subscriptionId

  }
}
