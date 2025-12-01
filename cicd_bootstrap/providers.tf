terraform {
    required_providers {
        tfe = {
            source  = "hashicorp/tfe"
            version = "~> 0.71.0"
        }
        google-beta = {
            source  = "hashicorp/google-beta"
            version = "~> 7.12.0"
        }
        null = {
            source  = "hashicorp/null"
            version = "~> 3.2.4"
        }
        random = {
            source  = "hashicorp/random"
            version = "~> 3.7.2"
        }
    }
}

provider "tfe" {
    token    = var.tf_cloud_token
}