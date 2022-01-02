
param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $tenantid

)

$random = Get-RandomCharacters -length 10 -characters 'abc1234567890'

$tf = New-Object PSObject -Property @{
    resourcegroup = "terraformstatesa"
    storage = 'tfstorage'+$random
    container = "tfstate"
    location = "australiasoutheast"
}

# login to the provided tenant id
Write-Output 'Login to tenant' $tenantid
az login --tenant $tenantid'.onmicrosoft.com'

# re-runnable script
$rsgExists = az group exists -n $tf.resourcegroup
if ($rsgExists -eq 'false') {

    try {
        # Resource group
        az group create --name $tf.resourcegroup --location $tf.location
        Write-Output $tf.resourcegroup ' resource group created sucessfully!.'
        # account
        az storage account create --resource-group $tf.resourcegroup --name $tf.storage --sku Standard_LRS --encryption-services blob
        Write-Output $tf.storage ' storage account created sucessfully!.'
        # container
        az storage container create --name $tf.container --account-name $tf.storage
        Write-Host $tf.container ' container created sucessfully!.'
    }
    catch {
        Write-Output 'Unable to create resources.'
        Write-Output $_
        Write-Output 'Destroying resource group ' $tf.resourcegroup
        az group delete --name $tf.resourcegroup

    }

# echo storage account name
Write-Output $tf.storage

}
else
{
    Write-Host 'Resource group ' $tf.resourcegroup ' already exists!.'
}

Function Get-RandomCharacters($length, $characters) { 
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length } 
    $private:ofs="" 
    return [String]$characters[$random]
}