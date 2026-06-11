param storageAccountNamePrifix string
param location string = resourceGroup().location
param acr_name string = 'techsckoolacr'
param acb_name string = 'techsckoolacb'

var storage_acc_name = '${storageAccountNamePrifix}${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storage_acc_name
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource container_registry 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: acr_name
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}

resource abs 'Microsoft.ServiceBus/namespaces@2021-11-01'={
  name: acb_name
  location: location
}
