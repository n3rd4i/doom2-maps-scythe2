$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url        = 'ftp://ftp.fu-berlin.de/pc/games/idgames/levels/doom2/Ports/megawads/scythe2.zip'
$unzipLocation = "$(Join-Path $toolsDir wad)"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $unzipLocation
  url           = $url
  checksum      = '0D5C1AB9D0152F5F1CF7A0D4CA2F41F5A6AC2986FA6EE850504D1D49E020CD8D'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

# Cleanup link first (safely)
& $ENV:COMSPEC /C IF EXIST $wad_lnk DEL /S /Q $wad_lnk

# Install symbolic link for later use
$wad_src = "$(Join-Path $unzipLocation $wad)"
& $ENV:COMSPEC /C MKLINK $wad_lnk $wad_src
