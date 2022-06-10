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
  subscription_id = var.SUB_ID
  client_id       = var.CLIENT
  client_secret   = var.SECRET
  tenant_id       = var.TENANT
  features {}
}

resource "azurerm_resource_group" "github-actions-tf" {
  name     = "github-actions-tf"
  location = "West Europe"
}

resource "azurerm_linux_function_app" "functionapp-weu" {
  name = "linuxfunctionapp-weu"
  resource_group_name = azurerm_resource_group.github-actions-tf
  location = azurerm_resource_group.github-actions-tf.location
  storage_account_name = azurerm_storage_account.fun-weu-storage.name
  service_plan_id = azurerm_service_plan.fun-weu-asp.id
  site_config { }
  
}

resource "azurerm_storage_account" "fun-weu-storage" {
  name = "linuxfuncappstrgeweu001"
  resource_group_name = azurerm_resource_group.github-actions-tf.name
  location = azurerm_resource_group.github-actions-tf.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "fun-weu-asp" {
  name = "fun-weu-asp-001"
  resource_group_name = azurerm_resource_group.github-actions-tf.name
  location = azurerm_resource_group.github-actions-tf.location
  os_type = "Linux"
  sku_name = "Y1"

}

resource "azurerm_resource_group" "github-rg-eus" {
  name     = "github-rg-eus"
  location = "East US"
}
