remote_state {
    backend = "azurerm"
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "rollend-test-rg"
        storage_account_name = "rollendxstatetf"
        container_name       = "tfstate"
    }
}
inputs = {
    location = "Australia Southeast"
    resource_group_name = "terragrunt-rg"
    virtual_network_name = "rollend_dev_vnet"
}