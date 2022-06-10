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
