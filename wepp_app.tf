resource "azurerm_service_plan" "morttodo_SP" {
  name                = var.azurerm_service_plan_name
  resource_group_name = var.azurerm_resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
  depends_on = [ azurerm_resource_group.mattias_labb_RG ]
}

resource "azurerm_linux_web_app" "morttodo_WA" {
  name                = var.azurerm_linux_web_app_name
  resource_group_name = var.azurerm_resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.morttodo_SP.id

  site_config {}
  
}
