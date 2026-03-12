using './main.bicep'

param appName = 'devops-ai-demo-swa'

param location = 'eastus2'

param tags = {
  environment: 'production'
  project: 'DevopsAiDemo'
}
