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
		  subscription_id = "a14b6fe5-f739-4b09-a63a-99171f6f2984"
		}
