@description('Name of the Azure Static Web App.')
param appName string

@description('Azure region for the Static Web App.')
param location string = resourceGroup().location

@description('Tags to apply to all resources.')
param tags object = {}

resource staticWebApp 'Microsoft.Web/staticSites@2022-09-01' = {
  name: appName
  location: location
  tags: tags
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    stagingEnvironmentPolicy: 'Enabled'
    allowConfigFileUpdates: true
    buildProperties: {
      skipGithubActionWorkflowGeneration: true
    }
  }
}

@description('The deployed Static Web App resource name.')
output staticWebAppName string = staticWebApp.name

@description('The default hostname of the Static Web App.')
output staticWebAppHostname string = staticWebApp.properties.defaultHostname

@description('Resource ID of the Static Web App.')
output staticWebAppId string = staticWebApp.id
