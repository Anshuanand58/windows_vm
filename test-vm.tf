module "test-vm" {
  source              = "location of your main code"
  location            = "South india"
  resource_group_name = "test-rg"
  subnet_name         = "default"
  vnet_name           = "test-vnet"
  vnet_rg_name        = "test-rg"
  create_public_ip    = false
  public_ip_name      = ""
  pip_add_allocation  = "Static"
  private_ip_address  = "10.16.41.69"
  vm_config = {
    "vm1" = {
      name           = "test-vm"
      size           = "Standard_D4s_v3"
      admin_username = "azureadmin"
      admin_password = "Pa55w.rd@123"
      computer_name  = "test-vm"
    }
  }
  caching_type     = "ReadWrite"
  disk_type        = "Standard_LRS"
  os_disk_name     = "test-vm"
  os_disk_size_gb  = "128"
  os_publisher     = "MicrosoftWindowsServer"
  os_offer         = "WindowsServer"
  os_sku           = "2016-Datacenter"
  image_version    = "latest"
  create_data_disk = true
  data_disk_config = {
    "disk1" = {
      name                 = "test-vm-datadisk01"
      storage_account_type = "Standard_LRS"
      disk_size_gb         = "128"
      lun                  = "1"
      caching              = "ReadWrite"
      vmkey                = "vm1"
    }
  }
  nic_name = "test-nic"
  tags = {
    application        = "test"

  }
}
