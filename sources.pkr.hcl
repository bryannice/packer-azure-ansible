source "virtualbox-iso" "ansible" {
  boot_command = lookup(local.boot_commands, lookup(lookup(local.os_list, var.os_name,{}), "os_family", ""), [])
  boot_wait = local.boot_wait
  communicator = local.communicator
  cpus = local.cpus
  disk_size = local.disk_size
  export_opts = local.export_opts
  format = "ova"
  guest_additions_path = "VBoxGuestAdditions_{{.Version}}.iso"
  guest_os_type = lookup(lookup(local.os_list, var.os_name,{}), "virtualbox", "")
  headless = local.headless
  http_directory = local.http_directory
  iso_checksum = lookup(lookup(local.os_list, var.os_name,{}), "iso_checksum", "")
  iso_url = lookup(lookup(local.os_list, var.os_name,{}), "iso_url", "")
  memory = local.memory
  output_directory = format("%s-%s-%s","output-virtualbox-iso",local.vm_name,local.build_ts)
  shutdown_command = local.shutdown_command
  ssh_password = var.ssh_password
  ssh_port = local.ssh_port
  ssh_timeout = local.ssh_timeout
  ssh_username = var.ssh_username
  vboxmanage = local.vboxmanage
  vm_name = local.vm_name
}

source "vmware-iso" "ansible" {
  boot_command = lookup(local.boot_commands, lookup(lookup(local.os_list, var.os_name,{}), "os_family", ""), [])
  boot_wait = local.boot_wait
  communicator = local.communicator
  cpus = local.cpus
  disk_size = local.disk_size
  disk_type_id = 2
  guest_os_type = lookup(lookup(local.os_list, var.os_name,{}), "vmware", "")
  headless = local.headless
  http_directory = local.http_directory
  iso_checksum = lookup(lookup(local.os_list, var.os_name,{}), "iso_checksum", "")
  iso_url = lookup(lookup(local.os_list, var.os_name,{}), "iso_url", "")
  memory = local.memory
  output_directory = format("%s-%s-%s","output-vmware-iso",local.vm_name,local.build_ts)
  shutdown_command = local.shutdown_command
  ssh_password = var.ssh_password
  ssh_port = local.ssh_port
  ssh_timeout = local.ssh_timeout
  ssh_username = var.ssh_username
  version = 14
  vm_name = local.vm_name
}

source "amazon-ebs" "ansible" {
  access_key = var.client_id
  ami_description = var.image_description
  ami_name = local.vm_name
  ami_regions = var.ami_regions
  ami_virtualization_type = "hvm"
  associate_public_ip_address = true
  communicator = "ssh"
  instance_type = var.instance_type
  launch_block_device_mappings = lookup(local.launch_block_device_mappings, lookup(lookup(local.os_list, var.os_name,{}), "os_family", ""), [])
  region = var.region
  secret_key = var.client_secret
  source_ami = lookup(lookup(local.os_list, var.os_name,{}), "source_ami", "")
  ssh_username = lookup(lookup(local.os_list, var.os_name,{}), "ssh_username", "")
}

source "azure-arm" "ansible" {
  client_id = var.client_id
  client_secret = var.client_secret
  image_offer = lookup(lookup(local.os_list, var.os_name,{}), "image_offer", "")
  image_publisher = lookup(lookup(local.os_list, var.os_name,{}), "image_publisher", "")
  image_sku = lookup(lookup(local.os_list, var.os_name,{}), "image_sku", "")
  location = var.region
  managed_image_resource_group_name = var.az_resource_group_name
  managed_image_name = local.vm_name
  os_disk_size_gb = local.disk_size
  os_type = lookup(lookup(local.os_list, var.os_name,{}), "os_type", "")
  subscription_id = var.az_subscription_id
  tenant_id = var.az_tenant_id
  vm_size = var.instance_type
}

source "docker" "ansible" {
  commit = true
  discard = false
  image = lookup(lookup(local.os_list, var.os_name,{}), "docker_image", "")
  login = true
  login_server = var.container_registry_server
  login_username = var.container_registry_username
  login_password = var.container_registry_password
}