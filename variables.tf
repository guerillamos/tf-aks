variable "org" {
  type    = string
  default = "alpha"
}

variable "svc" {
  type        = string
  description = "Service Name"
  default     = "aks"
}

variable "env" {
  type        = string
  description = "Environment Name"
  default     = "dev"
}

variable "loc" {
  type        = string
  description = "Location"
  default     = "UK South"
}
