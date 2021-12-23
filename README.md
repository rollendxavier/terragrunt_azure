# Create Azure resources with Terragunt
[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/Naereen/StrapDown.js/blob/master/LICENSE)
## Requirement
Create resources on Azure with Terragrunt
## Terragrunt
Terragrunt is a wrapper written on top of terraform HCL, and it strongly supports mudule based infrastructure creation aka implements DRY principles. Simple, never repeat your code :)
I just tried a single stage now, but terragrunt gives a nice way to deploy your multi stage environments, and will try push those in my next commit.

## Terragrunt Usage
Similar like terraform you can use command terragrunt, below are samples

``` 
$ terragrunt plan 
$ terragrunt apply
```

You can use special command `run-all` with terragrunt, it will run all your modules and recursively search the current working directory for any folders that contain Terragrunt modules

`$  terragrunt run-all apply`

Another feature with terragrunt is Auto-Init (the default) and  makes it so that terragrunt init does not need to be called explicitly before other terragrunt commands like plan and apply. Means, when u run `terragrunt plan` it actually runs `terragrunt init` first then `terragrunt plan`.

## Limitations
Need a dedicated build vm to run terragrunt, a nice way may be to provision it with [terraform packer](https://www.packer.io/docs)
