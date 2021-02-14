source "azure-arm" "ansible" {
  client_id = var.client_id
  client_secret = var.client_secret
  image_offer = lookup(lookup(local.os_list, var.os_name,{}), "image_offer", "")
  image_publisher = lookup(lookup(local.os_list, var.os_name,{}), "image_publisher", "")
  image_sku = lookup(lookup(local.os_list, var.os_name,{}), "image_sku", "")
  location = var.location
  managed_image_resource_group_name = var.managed_image_resource_group_name
  managed_image_name = local.managed_image_name
  os_disk_size_gb = var.os_disk_size_gb
  os_type = lookup(lookup(local.os_list, var.os_name,{}), "os_type", "")
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
  vm_size = var.vm_size
}
