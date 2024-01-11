resource "azurerm_resource_group" "mattias_labb_RG" {
    name = var.azurerm_resource_group_name
    location = var.location
}

module "github_module" {
  source = "github.com/Mooortie/Labb2Morttodo"

  # Additional module inputs, if required
}