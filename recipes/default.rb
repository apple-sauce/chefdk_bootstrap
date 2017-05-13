#
# Cookbook:: chefdk_bootstrap
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#include_recipe 'virtualbox'
#
include_recipe 'chocolatey'
include_recipe 'vs_code'
include_recipe 'vagrant'
include_recipe 'virtualbox'

# chocolatey_package 'conemu' do
#   # If conemu was installed outside chocolatey, it could be running this
#   # installation script and we don't want to touch it
#   not_if '(& "C:\Program Files\ConEmu\ConEmu\ConEmuC.exe" /IsConEmu); $LASTEXITCODE -eq 1'
#   guard_interpreter :powershell_script
# end

