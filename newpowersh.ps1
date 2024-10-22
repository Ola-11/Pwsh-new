
$resourceGroupName = "RG-PWSH"
$storageAccountName = "mystorageaccount12987"
$location = "westus2"
$vmName = "MyPowerShellVM"

New-AzResourceGroup -Name $resourceGroupName -Location $location
New-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -Location $location -Image "Canonical:UbuntuServer:24.04-LTS:latest" -Size "Standard_B1s" -OpenPorts 22
New-AzStorageAccount -ResourceGroupName $resourceGroupName -AccountName $storageAccountName -Location $location -SkuName "Standard_LRS"


