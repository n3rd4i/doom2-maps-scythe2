$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'ftp://ftp.fu-berlin.de/pc/games/idgames/levels/doom2/Ports/megawads/scythe2.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Join-Path $toolsDir wad)"
  url           = $url
  checksum      = '0D5C1AB9D0152F5F1CF7A0D4CA2F41F5A6AC2986FA6EE850504D1D49E020CD8D'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
