terraform {
  backend "remote" {
    organization = "hashicorp-team-da-beta"

    workspaces {
      name = "qa-kubernetes-vault"
    }
  }
}

data "terraform_remote_state" "cluster" {
  backend = "remote"
  config = {
    organization = var.organization
    workspaces = {
      name = var.cluster_workspace
    }
  }
}

data "terraform_remote_state" "consul" {
  backend = "remote"
  config = {
    organization = var.organization
    workspaces = {
      name = var.consul_workspace
    }
  }
}

provider "helm" {
  version = "~> 1.0"
  kubernetes {
    load_config_file       = false
    host                   = data.terraform_remote_state.cluster.outputs.host
    username               = data.terraform_remote_state.cluster.outputs.username
    password               = data.terraform_remote_state.cluster.outputs.password
    cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate
  }
}