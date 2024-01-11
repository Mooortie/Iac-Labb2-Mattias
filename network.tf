
resource "azurerm_network_security_group" "morttodo_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  depends_on = [ azurerm_resource_group.mattias_labb_RG ]
}

resource "azurerm_virtual_network" "morttodo_VN" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.morttodo_nsg.id
  }
}