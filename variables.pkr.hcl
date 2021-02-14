variable "client_id" {
  default = ""
  description = "Access key for AWS and client id for Azure."
  type = string
}

variable "client_secret" {
  default = ""
  description = "Secret key for AWS and client secret for Azure."
  type = string
}

variable "docker_environment_variable" {
  default = ""
  description = "Environment variable used by docker. Format is '--env COOL_VAR1=VALUE1 --env COOL_VAR2=VALUE2'"
  type = string
}

variable "docker_image_name" {
  default = ""
  description = "Docker image with the Ansible runtime environment."
  type = string
}

variable "docker_mounted_volume" {
  default = ""
  description = "Mount volumes needed to support the Ansible playbook process."
  type = string
}

variable "git_code_version" {
  default = "master"
  description = "Code version to use (branch or tag)."
  type = string
}

variable "git_url" {
  default = ""
  description = "Git repo"
  type = string
}

variable "image_name" {
  default = "packer"
  type = string
}

variable "image_version" {
  default = "0.0.0"
  type = string
}

variable "location" {
  default = "westus2"
  description = "The region for AWS and the location for Azure."
  type = string
}

variable "managed_image_resource_group_name" {
  default = "packer-build-rg"
  type = string
}

variable "os_disk_size_gb" {
  default = "50"
  description = "Azure this is a number value representing GB."
  type = string
}

variable "os_name" {
  default = "centos7-8"
  description = "The OS name the packer build process create image from."
  type = string
}

variable "ssh_password" {
  default = "vagrant"
  description = "Password to use"
  type = string
}

variable "ssh_username" {
  default = "vagrant"
  description = "Username to use"
  type = string
}

variable "subscription_id" {
  default = ""
  type = string
}

variable "tenant_id" {
  default = ""
  type = string
}

variable "vm_size" {
  default = "Standard_D4a_v4"
  description = "The instance type for AWS and the VM Size for Azure."
  type = string
}
