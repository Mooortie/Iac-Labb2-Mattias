#Main
variable "azurerm_resource_group_name" {
    type = string
    default = "RG_mattias_labb"
}
variable "location" {
    type = string
    default = "North Europe"
}

#network
variable "vnet_name" {
    type = string
    default = "Vnet_Morttodo"
}
variable "nsg_name" {
    type = string
    default = "morttodo_security_group"
}

#compute
variable "public_ip_address_id" {
    type = string
    default = "MortToDoPublicIPForPIP"
}

#database
variable "azurerm_cosmosdb_account_name" {
  type = string
  default = "morttododb"
}

#webapp
variable "azurerm_service_plan_name" {
    type = string
    default = "morttodo_sp"
}
variable "azurerm_linux_web_app_name" {
    type = string
    default = "morttodo"
}