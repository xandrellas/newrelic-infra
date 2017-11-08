
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.newrelic.com/infrastructure_agent/windows/newrelic-infra.msi'
$url64      = 'https://download.newrelic.com/infrastructure_agent/windows/newrelic-infra.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'newrelic-infra*'

  checksum      = '35fe650cf958ef93b993cae7c8ffdfb463d5119280604b4e10804c9bd5d0bdce'
  checksumType  = 'sha256'
  checksum64    = '35fe650cf958ef93b993cae7c8ffdfb463d5119280604b4e10804c9bd5d0bdce'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








