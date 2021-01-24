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
