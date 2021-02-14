locals {
  code_project_name = split(".",basename(var.git_url))[0]
  managed_image_name = format("%s-%s-%s", var.os_name, var.image_name, var.image_version)
  os_list = {
    centos7-8 = {
      image_offer = "CentOS"
      image_publisher = "OpenLogic"
      image_sku = "7_8"
    }
    centos8-2 = {
      image_offer = "CentOS"
      image_publisher = "OpenLogic"
      image_sku = "8_2"
    }
    debian9-13 = {
      image_offer = "Debian"
      image_publisher = "credativ"
      image_sku = "9"
    }
    debian10-07 = {
      image_offer = "debian-10"
      image_publisher = "Debian"
      image_sku = "10"
    }
  }
}