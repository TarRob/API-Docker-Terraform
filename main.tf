provider "azurerm" {
    version = "2.5.0"
    features {}
}

resource "azurerm_resource_group" "tf_test" {
  name = "tf-main-rg"
  location = "West Europe"
}

resource "azurerm_container_group" "tfcg_test" {
  name                      = "api-docker-terraform"
  location                  = azurerm_resource_group.tf_test.location
  resource_group_name       = azurerm_resource_group.tf_test.name

  ip_address_type     = "public"
  dns_name_label      = "roberttarczitfwa"
  os_type             = "Linux"

  container {
      name            = "api-docker-terraform"
      image           = "roberttarczi/api-docker-terraform"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
  }
}