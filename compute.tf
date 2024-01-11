resource "azurerm_public_ip" "morttodo_PIP" {
  name                = var.public_ip_address_id
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  allocation_method   = "Static"
  depends_on = [ azurerm_resource_group.mattias_labb_RG ]
}

resource "azurerm_lb" "morttodo_LB" {
  name                = "morttodo_lb"
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.morttodo_PIP.id
  }
  depends_on = [ azurerm_public_ip.morttodo_PIP ]
}