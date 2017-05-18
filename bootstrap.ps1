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
#Requires -Version 3

new-module -name ChefDKBootstrap -scriptblock {
function promptContinue {
  param ($msg="Chefdk_bootstrap encountered an error")
  $yn = Read-Host "$Msg. Continue? [y|N]"
  if ( $yn -NotLike 'y*' ) {
    Break
  }
}

function die {
  param ($msg="Chefdk_bootstrap encountered an error. Exiting")
  Write-host "$msg."
  Break
}

function Install-Project {
  Param(
    [string] $version,
    [string] $json_attributes
  )
  # run chef-client to bootstrap this machine 
  . { Invoke-WebRequest -useb https://omnitruck.chef.io/install.ps1 } | Invoke-Expression; install -channel current -project chefdk

  chef-client -A -z -l error -c $chefConfigPath -o $bootstrapCookbook
  
  # End message to indicate completion of setup
  Write-Host "`n`nCongrats fellow Chefee!!! Your workstation is now set up for Chef Development!"
}
set-alias install -value Install-Project

Install-Project

export-modulemember -function 'Install-Project' -alias 'install'
}
