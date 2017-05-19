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
  
   # run chef-client to bootstrap this machine 
 . { Invoke-WebRequest -useb https://omnitruck.chef.io/install.ps1 } | Invoke-Expression; install -channel current -project chefdk
  
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  
  Set-Location "~\AppData\Local\Temp\"
  mkdir cookbooks
  Set-Location "~\AppData\Local\Temp\cookbooks"
  C:\opscode\chefdk\embedded\git\bin\git.exe clone https://github.com/apple-sauce/chefdk_bootstrap.git
  # C:\opscode\chefdk\embedded\git\bin\git.exe clone https://github.com/chocolatey/chocolatey-cookbook.git chocolatey
  # C:\opscode\chefdk\embedded\git\bin\git.exe clone https://github.com/chef-cookbooks/windows.git windows
  # C:\opscode\chefdk\embedded\git\bin\git.exe clone https://github.com/chef/ohai.git

  # C:\opscode\chefdk\embedded\git\bin\git.exe clone https://github.com/Microsoft/vscode.git vscode
  Set-Location "~\AppData\Local\Temp\cookbooks\chefdk_bootstrap"
  berks vendor

  chef-client -A -z -l error -o 'chefdk_bootstrap'

  # Write-Host "`n`nCongrats fellow Chefee!!! Your workstation is now set up for Chef Development!"
