module "wsidrdcapp01" {
  source              = "git::https://xkmjl6xcuanap5betn3m43lagh5y6llpn6lq5bqfpaxep7cynvca@dev.azure.com/IRL-INFRA-DEVOPS/IRL-MODULES/_git/IRL-MODULES//azurerm_windows_virtual_machine"
  location            = "South india"
  resource_group_name = "rsg-si-inf-dr-net-01"
  subnet_name         = "snt-si-inf-dr-dc-01"
  vnet_name           = "vnt-si-inf-dr-hub-01"
  vnet_rg_name        = "rsg-si-inf-dr-net-01"
  create_public_ip    = false
  public_ip_name      = ""
  pip_add_allocation  = "Static"
  private_ip_address  = "10.16.41.69"
  vm_config = {
    "vm1" = {
      name           = "wsidrdcapp001"
      size           = "Standard_D4s_v3"
      admin_username = "azureadmin"
      admin_password = "Pa55w.rd@123"
      computer_name  = "wsidrdcapp001"
    }
  }
  caching_type     = "ReadWrite"
  disk_type        = "Standard_LRS"
  os_disk_name     = "wsidrdcapp001"
  os_disk_size_gb  = "128"
  os_publisher     = "MicrosoftWindowsServer"
  os_offer         = "WindowsServer"
  os_sku           = "2016-Datacenter"
  image_version    = "latest"
  create_data_disk = true
  data_disk_config = {
    "disk1" = {
      name                 = "wsidrdcapp001-datadisk01"
      storage_account_type = "Standard_LRS"
      disk_size_gb         = "128"
      lun                  = "1"
      caching              = "ReadWrite"
      vmkey                = "vm1"
    }
  }
  nic_name = "nic-si-inf-dr-dc-01"
  tags = {
    application        = "domain controller"
    environment        = "dr"
    IRL-business-owner = "Rajdeep Dutta"
    tower              = "Infra"
  }
}
