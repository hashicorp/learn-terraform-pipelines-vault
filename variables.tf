variable "consul_workspace" {
  type        = string
  default = ""
  description = "Workspace that created the Consul cluster"
}

variable "cluster_workspace" {
  type        = string
  default = ""
  description = "Workspace that created the Kubernetes cluster"
}

variable "organization" {
  type        = string
  default = ""
  description = "Organization of workspace that created the Kubernetes cluster"
}
