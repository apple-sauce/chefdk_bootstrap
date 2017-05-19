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
  $tempInstallDir = Join-Path -path $env:TEMP -childpath 'chefdk_bootstrap'
  $chefConfigPath = Join-Path -path $tempInstallDir -childPath 'client.rb'
  $berksfilePath = Join-Path -path $tempInstallDir -childPath 'Berksfile'
  
   # run chef-client to bootstrap this machine 
 . { Invoke-WebRequest -useb https://omnitruck.chef.io/install.ps1 } | Invoke-Expression; install -channel current -project chefdk


  # Write out a local Berksfile for Berkshelf to use
  $berksfile | Out-File -FilePath $berksfilePath -Encoding ASCII

  # Write out minimal chef-client config file
  $chefConfig | Out-File -FilePath $chefConfigPath -Encoding ASCII

  Set-Location "~\AppData\Local\Temp\"
  mkdir cookbooks
  Set-Location "~\AppData\Local\Temp\cookbooks"
  C:\opscode\chefdk\embedded\git\bin\git.exe clone https://github.com/apple-sauce/chefdk_bootstrap.git

  Set-Location "~\AppData\Local\Temp\cookbooks\chefdk_bootstrap"
  $env:BERKSHELF_CHEF_CONFIG = $chefConfigPath
  berks vendor

  Set-Location "~\AppData\Local\Temp\"
  
  chef-client -A -z -l error -o 'chefdk_bootstrap' -c $chefConfigPath

  # Write-Host "`n`nCongrats fellow Chefee!!! Your workstation is now set up for Chef Development!"
