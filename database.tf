resource "azurerm_cosmosdb_account" "morttodoaccount" {
  name                = var.azurerm_cosmosdb_account_name
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true


  consistency_policy {
    consistency_level       = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  capabilities {
    name = "EnableServerless"
  }
  depends_on = [ azurerm_resource_group.mattias_labb_RG ]
}

resource "azurerm_cosmosdb_sql_database" "morttodo_db" {
  name                = "morttododatabase"
  resource_group_name = var.azurerm_resource_group_name
  account_name        = var.azurerm_cosmosdb_account_name
  depends_on = [ azurerm_cosmosdb_account.morttodoaccount ]
}