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
$env:Path += ";C:\opscode\chefdk\bin"

# Make sure you're an admin of this machine 
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
  [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}

try {
  # run chef-client to bootstrap this machine 
  . { Invoke-WebRequest -useb https://omnitruck.chef.io/install.ps1 } | Invoke-Expression; install -version 1.3.43 -channel stable  -project chefdk

  # need to set location for downloading of chefdk_bootstrap as well as create folder cookbook 
  Set-Location "~\AppData\Local\Temp\"
  mkdir cookbooks
  Set-Location "~\AppData\Local\Temp\cookbooks"

  # downloading of the chefdk_bootstrap cookbook to local machine
  C:\opscode\chefdk\embedded\git\bin\git.exe clone https://github.com/apple-sauce/chefdk_bootstrap.git

  # install chocolatey
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

  # set location back to cookbook in order to run berks to get dependencies
  Set-Location "~\AppData\Local\Temp\cookbooks\chefdk_bootstrap"
  berks vendor

  # run chef client to converge machine
  chef-client -A -z -l error -o 'chefdk_bootstrap'

  # add vagrant-winrm plugin
  vagrant plugin install vagrant-winrm
}
catch {
  write-output "Unable to install Chef tools. Please contact a Chef Admin"
  break
}

# Install successful!
Write-Host "`n`nCongrats fellow Chefee! Your workstation is now set up for Chef Development!"
