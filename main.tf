terraform {

  backend "azurerm" {
    resource_group_name  = "SignalwireRG"
    storage_account_name = "signalwirerga9f4"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  subscription_id = "c91c3304-edff-43a6-9350-9b070cac47dc"
  client_id = "2abcf973-1b44-46b9-b708-b0b829b2b977"
  client_secret = "dWf8Q~UbZLlC3UF3IvpYm0R3DY3OY02n4r-J4cJg"
  tenant_id = "e37395c1-6b54-4147-96b9-e1e8fc861811"
  features {}
}

resource "azurerm_resource_group" "github-actions-tf" {
  name     = "github-actions-tf"
  location = "West Europe"
}

resource "azurerm_resource_group" "github-rg-eus" {
  name     = "github-rg-eus"
  location = "East US"
}
