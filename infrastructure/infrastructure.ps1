Param
(
    # Name for the resource group
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName,

    # The name for the app service plan
    [Parameter(Mandatory=$true)]
    [string]$AppServicePlanName,

    # The name for the web app
    [Parameter(Mandatory=$true)]
    [ValidatePattern("[a-z]*")]
    [ValidateLength(0,15)]
    [String]
    [string$WebAppName,
    [ValidateSet("Small", "Medium", "Large", "ExtraLarge")]
    [string]$WorkerSize = "Small"
    # The size for the app service plan

)


$location = "WestEurope"

New-AzureRmResourceGroup $ResourceGroupName -Location $location
New-AzureRmAppServicePlan -Name $AppServicePlanName -Location $location -ResourceGroupName $ResourceGroupName -WorkerSize $WorkerSize
New-AzureRmWebApp -ResourceGroupName $ResourceGroupName -Name $WebAppName -Location $location -AppServicePlan $AppServicePlanName
