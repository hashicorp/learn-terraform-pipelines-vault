# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "helm_release" "vault" {
  name       = "${data.tfe_outputs.consul.values.release_name}-vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.25.0"
  namespace  = data.tfe_outputs.consul.values.namespace

  set {
    name  = "server.ha.enabled"
    value = "true"
  }

  set {
    name  = "server.ha.config"
    value = <<EOT
    ui = true

    listener "tcp" {
      tls_disable = 1
      address = "[::]:8200"
      cluster_address = "[::]:8201"
    }
    storage "consul" {
      path = "vault"
      address = "consul-server:8500"
    }
    EOT
  }
}