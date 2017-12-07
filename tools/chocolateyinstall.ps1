$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.newrelic.com/infrastructure_agent/windows/newrelic-infra.1.0.818.msi'
$url64      = 'https://download.newrelic.com/infrastructure_agent/windows/newrelic-infra.1.0.818.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'newrelic-infra*'

  checksum      = '94aaed72457c8c7dfedb1cb22d592368fa9a4e1a6f807f9fc284ecbec23b87a6'
  checksumType  = 'sha256'
  checksum64    = '94aaed72457c8c7dfedb1cb22d592368fa9a4e1a6f807f9fc284ecbec23b87a6'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs