
param(
  [Parameter(Mandatory=$true)][string]$EnvironmentUrl,
  [string]$SolutionName = 'HMS Healthcare Portal',
  [string]$PublisherName = 'Harsha Shirali',
  [string]$PublisherPrefix = 'harsha'
)
$ErrorActionPreference = 'Stop'
Write-Host "==> Ensure pac CLI and Dataverse client module" -ForegroundColor Cyan
if (-not (Get-Command pac -ErrorAction SilentlyContinue)) { throw 'Install pac: https://aka.ms/PowerAppsCLI' }
if (-not (Get-Module -ListAvailable Microsoft.PowerPlatform.Dataverse.Client)) { Install-Module Microsoft.PowerPlatform.Dataverse.Client -Scope CurrentUser -Force }

# Create publisher & solution (basic)
$headers = @{Accept='application/json'; 'Content-Type'='application/json'}
$pub = Invoke-RestMethod -Method GET -Uri "$EnvironmentUrl/api/data/v9.2/publishers?$select=publisherid&$filter=friendlyname eq '$PublisherName'" -Headers $headers
if ($pub.value.Count -eq 0) {
  $pubBody = @{ friendlyname=$PublisherName; customizationprefix=$PublisherPrefix; uniquename=$PublisherPrefix } | ConvertTo-Json
  $pubId = (Invoke-RestMethod -Method POST -Uri "$EnvironmentUrl/api/data/v9.2/publishers" -Headers $headers -Body $pubBody).publisherid
} else { $pubId = $pub.value[0].publisherid }

$sol = Invoke-RestMethod -Method GET -Uri "$EnvironmentUrl/api/data/v9.2/solutions?$select=solutionid&$filter=friendlyname eq '$SolutionName'" -Headers $headers
if ($sol.value.Count -eq 0) {
  $unique = ($SolutionName -replace '[^A-Za-z0-9_]','')
  $solBody = @{ friendlyname=$SolutionName; uniquename=$unique; publisherid=@{publisherid=$pubId}; version='1.0.0.0' } | ConvertTo-Json
  $solutionId = (Invoke-RestMethod -Method POST -Uri "$EnvironmentUrl/api/data/v9.2/solutions" -Headers $headers -Body $solBody).solutionid
} else { $solutionId = $sol.value[0].solutionid }

# Call generators (stubs)
& "$PSScriptRoot/generate-dataverse.ps1" -EnvironmentUrl $EnvironmentUrl -SolutionId $solutionId -PublisherPrefix $PublisherPrefix -SchemaDir (Join-Path $PSScriptRoot '../assets/dataverse/schema') -ChoicesDir (Join-Path $PSScriptRoot '../assets/dataverse/choices')
& "$PSScriptRoot/generate-model.ps1" -EnvironmentUrl $EnvironmentUrl -SolutionId $solutionId -SchemaDir (Join-Path $PSScriptRoot '../assets/dataverse/schema')
& "$PSScriptRoot/generate-bpf.ps1" -EnvironmentUrl $EnvironmentUrl -SolutionId $solutionId -BpfDir (Join-Path $PSScriptRoot '../assets/bpf')
& "$PSScriptRoot/generate-flows.ps1" -EnvironmentUrl $EnvironmentUrl -SolutionId $solutionId -FlowsDir (Join-Path $PSScriptRoot '../assets/flows')

Write-Host "==> Exporting MANAGED solution" -ForegroundColor Cyan
$outDir = (Join-Path $PSScriptRoot '../out')
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
pac solution export --name ($SolutionName -replace '[^A-Za-z0-9_]','') --path $outDir --managed true --async false --processCanvasApps false
Write-Host "==> Done: managed zip in /out" -ForegroundColor Green
