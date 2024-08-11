		terraform {
		  required_providers {
		    azurerm = {
		      source  = "hashicorp/azurerm"
		      version = "=3.0.0"
		    }
		  }
		}
		# Configure the Microsoft Azure Provider
		provider "azurerm" {
		  features {}
		  subscription_id = "f3b83971-0e0e-4a0b-b17a-a19db7dfd450"

		}
