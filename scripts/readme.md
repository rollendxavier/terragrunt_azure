# Bootstrap scripts folder
Intention of this scripts are to create the initial infrastructure using powershell/ansible/bash scriptsetc, which terraform may needed to provision your project infrastructure. Everytihg we have is IaC, then why not this too..
## initialize.ps1
### This are the scripts needed to setup the initial infrastructe for terraform to keep its state file. We create below resources
* azure resource group
* azure storage account
* azure storage container
### Arguments
1. tenantid - provide your tenant id to set login to azure and later it is amended with .onmicrosoft.com

_You can try many other ways to autheticate to your azure (including service principals), have a look at [here](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli)_
### Working
This creates a new storage account in the resource group and container set to private access as Terraform state files can contain secrets.

 _Note : You may need to run `Set-ExecutionPolicy Unrestricted` for powershell to run the scripts_
