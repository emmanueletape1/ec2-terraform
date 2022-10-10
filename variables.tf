variable "application" {
  description = "The application or function name to be named."
  # default     = "sql"
}

variable "env" {
  description = "Environment where the application or function is deployed."
  # default     = "tn"
}

variable "location" {
  description = "Region where apllication/finction is created."
  # default     = "wev"
}

variable "infra_type" {
  description = "Type of infrastructure that is being created."
  # default     = "p"
}

variable "sequence" {
  type = string
  description = "Application/server number"
  validation {
    condition = length(var.sequence) == 3 && var.sequence >= "001" && var.sequence <= "999"
    error_message = "Please provide a number between 001 to 999 and pattern must be three digits."
  }
}

variable "resource_type" {
  description = "Type of resource being created."
  # default     = "vm00"
}

variable "ami" {
  description = "Amazon Machine Image (ami) id"
  # default     = "ami-026b57f3c383c2eec"
}

variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "prefix" {
  type        = string
  description = "Prefix of the server name"
  # default = "mot"
  validation {
    condition     = length(var.prefix) == 3 && substr(var.prefix, 0, 3) == "mot"
    error_message = "The server name prefix value must be a valid value, starting with \"mot\"."
  }
}

variable "secret_key" {}
variable "access_key" {}