# Copyright 2017 Apple-Sauce Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$env:HOME = $env:USERPROFILE
$dotChefDKDir = Join-Path -path $env:LOCALAPPDATA -childPath 'chefdk'
$targetChefDk = '3.0.36' #Had to manually put in version in line 56. If you change this version here, change it there as well

#Set home environment path
[Environment]::SetEnvironmentVariable("HOME", $Env:USERPROFILE, "User")

# Make sure you're an admin of this machine 
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
  [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$OUTPUT= [System.Windows.Forms.MessageBox]::Show("Installing Chefdk will reboot your laptop as soon as the installation is complete. `r`n`r`nPlease save all work before hitting OK, `r`n`r`nOtherwise hit Cancel to abort.","Chefdk Install", 1)
if ($OUTPUT -eq "OK" ) 
{
	Write-Host "Your laptop will reboot after the installation."
} 
else
{ 
	Write-Warning "Cancelling the Chefdk install."
	Break 
}

try {
  # Install ChefDK from chef omnitruck, unless installed already
  Write-Host "Checking for installed ChefDK version"

  $app = Get-CimInstance -classname win32_product -filter "Name like 'Chef Development Kit%'"
  $installedVersion = $app.Version

  if ( $installedVersion -like "$targetChefDk*" ) 
    {
      Write-Host "The ChefDK version $installedVersion is already installed."
      Break
    } 
  elseif ( $installedVersion -eq $null ) 
        {
          Write-Host "No ChefDK found. Installing the ChefDK version $targetChefDk"
        }
  else 
    {
      Write-Host "Upgrading the ChefDK from $installedVersion to $targetChefDk"
      Write-Host "Uninstalling ChefDK version $installedVersion."
      Invoke-CimMethod -InputObject $app -MethodName Uninstall
      if ( -not $? ) { promptContinue "Error uninstalling ChefDK version $installedVersion" }
    }
  
  Write-Host "Installing ChefDK version $targetChefDk. This might take a while..."
 . { Invoke-WebRequest -useb https://omnitruck.chef.io/install.ps1 } | Invoke-Expression; install -version 3.0.36 -channel stable -project chefdk

  #Set path now that chefdk is installed 
  $env:Path += ";C:\opscode\chefdk\bin"

  # need to set location for downloading of chefdk_bootstrap as well as create folder cookbook 
  Set-Location "~\AppData\Local\Temp\"
  if(!(Test-Path -Path "~\AppData\Local\Temp\cookbooks"))
    {
      mkdir cookbooks
    }
  
  Set-Location  "~\AppData\Local\Temp\cookbooks"
  if(Test-Path -Path "~\AppData\Local\Temp\cookbooks\chefdk_bootstrap" )
    {
      Write-Host "Removing old chefdk_bootstrap folder"
      rmdir -Recurse -Force chefdk_bootstrap
    }

  # downloading of the chefdk_bootstrap cookbook to local machine
  C:\opscode\chefdk\embedded\git\bin\git.exe clone https://github.com/apple-sauce/chefdk_bootstrap.git

  # install chocolatey
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  
  # set location back to cookbook in order to run berks to get dependencies
  Set-Location "~\AppData\Local\Temp\cookbooks\chefdk_bootstrap"
  berks vendor

  # run chef client to converge machine
  chef-client -A -z -l error -o 'chefdk_bootstrap'

}
catch {
  write-output "Unable to install Chef tools. Please contact a Chef Admin"
  break
}

# Install successful!
Write-Host "`n`nCongrats fellow Chefee! Your workstation is now set up for Chef Development!"
