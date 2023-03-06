# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "consul_workspace" {
  type        = string
  description = "Workspace that created the Consul cluster"
}

variable "cluster_workspace" {
  type        = string
  description = "Workspace that created the Kubernetes cluster"
}

variable "organization" {
  type        = string
  description = "Organization of workspace that created the Kubernetes cluster"
}