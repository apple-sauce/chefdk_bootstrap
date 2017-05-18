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

 # run chef-client to bootstrap this machine 
# . { Invoke-WebRequest -useb https://omnitruck.chef.io/install.ps1 } | Invoke-Expression; install -channel current -project chefdk

  $bootstrapCookbook = 'chefdk_bootstrap'

  $userChefDir = Join-Path -path $env:USERPROFILE -childPath 'chef'
  $dotChefDKDir = Join-Path -path $env:LOCALAPPDATA -childPath 'chefdk'
  $tempInstallDir = Join-Path -path $env:TEMP -childpath 'chefdk_bootstrap'
  $berksfilePath = Join-Path -path $tempInstallDir -childPath 'Berksfile'
  $chefConfigPath = Join-Path -path $tempInstallDir -childPath 'client.rb'
  
 chef-client -A -z -l error -c $chefConfigPath -o $bootstrapCookbook

# Write-Host "`n`nCongrats fellow Chefee!!! Your workstation is now set up for Chef Development!"
