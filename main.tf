module "vnet11" {
    source = "./pipeline-practice/Vnet"
    name = "tutu_vnet"
    resource_group_name = "devv-rgg-01"
    location = "westus"
  
}
module "subnet11" {
    for_each = var.subbu
    source = "./pipeline-practice/SUBNET"
    name = each.key
    resource_group_name = "devv-rgg-01"
    virtual_network_name = module.vnet11.name
    address_prefixes = each.value
  
}
module "nsg11" {

    source = "./pipeline-practice/NSG"
    name = "tutu_nsg"
    resource_group_name = "devv-rgg-01"
    location = "westus"
  
}
module "nic11" {
    source = "./pipeline-practice/NIC"
    name = "tutu_nic"
    resource_group_name = "devv-rgg-01"
    location = "westus"
    ip_config_name = "tutu_ip"
    subnet_id = module.subnet11["tutu_subnet_01"].id
    public_ip_id = module.pip11.id
}
module "pip11" {
    source = "./pipeline-practice/Public_ip"
    name = "tutu_pip"
    resource_group_name = "devv-rgg-01"
    location = "westus"
}
module "vm11" {
    source = "./pipeline-practice/VM"
    name = "tutu_vm"
    resource_group_name = "devv-rgg-01"
    location = "westus"
    nic_id = module.nic11.id
    vm_size = "Standard_B1s"
    admin_username = "Netflixvm"
    admin_password = "Netflixvm11@"
    
}
