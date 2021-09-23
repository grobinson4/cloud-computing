# Replace the following URL with a public GitHub repo URL
$gitrepo="https://github.com/grobinson4/cashflow-api.git"
$webappname="garobions-test-api"
$location="EastUS"

# Connect to AzAccount
Connect-AzAccount

# Choose Subscription
Set-AzContext -Subscription "Garobins Testing Subscription"

# Create a resource group.
New-AzResourceGroup -Name myResourceGroup -Location $location

# Create an App Service plan in Free tier.
New-AzAppServicePlan -Name $webappname -Location $location -ResourceGroupName myResourceGroup -Tier Free

# Create a web app.
New-AzWebApp -Name $webappname -Location $location -AppServicePlan $webappname -ResourceGroupName myResourceGroup

# Configure GitHub deployment from your GitHub repo and deploy once.
$PropertiesObject = @{
    repoUrl = "$gitrepo";
    branch = "master";
    isManualIntegration = "true";
}
Set-AzResource -Properties $PropertiesObject -ResourceGroupName myResourceGroup -ResourceType Microsoft.Web/sites/sourcecontrols -ResourceName $webappname/web -ApiVersion 2015-08-01 -Force