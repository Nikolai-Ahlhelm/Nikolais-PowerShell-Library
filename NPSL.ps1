using module "./modules/basic_logging.psm1"

# Nikolai's PowerShell Library 
# Version 1.0.0



### Import XML Data
$xml = [xml] (Get-Content -Path "./NPSL.xml")

### Welcome Message
Write-Host "Welcome to NPSL ⚙️ -"$xml.version

### Import Modules
Write-Host "Loading... ⏳"
$moduleList = Get-ChildItem -Path "./modules"
$totalModules = $moduleList.count
$loadingFailed = 0
foreach ($module in $moduleList)
{
    try {
        Import-Module -Name $module
        Write-Host "✅ -"$module.basename
    }
    catch {
        Write-Host "❌ -"$module.basename
        $loadingFailed += 1
    }
}

if ($loadingFailed -gt 0) {
    Write-Host "⚠️ $totalModules modules loaded "
    Write-Host "❌ $loadingFailed failed loading "
}
else {
    ### Finished StartUp
    Write-Host "✅ All $totalModules modules loaded "
}





