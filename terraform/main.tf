# Define o provedor Azure
provider "azurerm" {
  features {}
}

# Cria um grupo de recursos
resource "azurerm_resource_group" "rg_rentacar" {
  name     = "rg-rentacar-app"
  location = "East US" # Escolha sua regiao
}

# Conta de Armazenamento para a Function App
resource "azurerm_storage_account" "st_rentacar" {
  name                     = "strentacarapp" # Nomes de storage account devem ser unicos globalmente
  resource_group_name      = azurerm_resource_group.rg_rentacar.name
  location                 = azurerm_resource_group.rg_rentacar.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Plano do App Service para a Function App
resource "azurerm_app_service_plan" "plan_rentacar" {
  name                = "plan-rentacar-serverless"
  location            = azurerm_resource_group.rg_rentacar.location
  resource_group_name = azurerm_resource_group.rg_rentacar.name
  kind                = "FunctionApp"
  sku {
    tier = "Consumption" # Plano Consumption para serverless
    size = "Y1"
  }
}

# Azure Function App para RentProcess
resource "azurerm_function_app" "func_rent_process" {
  name                       = "func-rent-process"
  location                   = azurerm_resource_group.rg_rentacar.location
  resource_group_name        = azurerm_resource_group.rg_rentacar.name
  app_service_plan_id        = azurerm_app_service_plan.plan_rentacar.id
  storage_account_name       = azurerm_storage_account.st_rentacar.name
  storage_account_access_key = azurerm_storage_account.st_rentacar.primary_access_key
  version                    = "~4" # Versao do runtime (ex: ~4 para .NET 6, Node.js 16/18)

  # Configuracoes do aplicativo, como variaveis de ambiente
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "node" # ou "dotnet", "python", etc.
    "DATABASE_CONNECTION_STRING" = azurerm_postgresql_flexible_server.db_rentacar.connection_string # Exemplo
    "PAYMENT_QUEUE_CONNECTION_STRING" = azurerm_servicebus_namespace.sb_rentacar.default_primary_connection_string # Exemplo
    "PAYMENT_QUEUE_NAME" = azurerm_servicebus_queue.queue_payment.name
  }

  # Configuracoes de deployment (se voce tiver um zip de codigo)
  # site_config {
  #   app_command_line = "node index.js" # Exemplo para Node.js
  # }
}

# Exemplo de Banco de Dados PostgreSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "db_rentacar" {
  name                = "db-rentacar-server"
  resource_group_name = azurerm_resource_group.rg_rentacar.name
  location            = azurerm_resource_group.rg_rentacar.location
  version             = "14"
  delegated_subnet_id = null # Configure uma VNet e Subnet se desejar rede privada
  sku_name            = "Standard_B1ms"
  administrator_login = "rentacaradmin"
  administrator_password = "ComplexPassword123!"
  zone                = "1"
}

# Exemplo de Azure Service Bus Namespace e Fila
resource "azurerm_servicebus_namespace" "sb_rentacar" {
  name                = "sbus-rentacar"
  location            = azurerm_resource_group.rg_rentacar.location
  resource_group_name = azurerm_resource_group.rg_rentacar.name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "queue_payment" {
  name                = "paymentqueue"
  namespace_id        = azurerm_servicebus_namespace.sb_rentacar.id
  resource_group_name = azurerm_resource_group.rg_rentacar.name
  max_delivery_count  = 10
}
