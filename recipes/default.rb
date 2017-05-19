# Copyright 2017 Apple-Sauce.
#
# Cookbook:: chefdk_bootstrap
# Recipe:: default
#
#

# include_recipe 'chocolatey'
# include_recipe 'vscode'

# windows_package 'chefdk' do
#   action :install
#   installer_type :msi
#   version '1.3.43'
#   source node['chefdk_bootstrap']['chefdk']['source']
#   checksum node['chefdk_bootstrap']['chefdk']['checksum']
# end
#
case node['platform_family']
when 'windows'
  chocolatey_package 'conemu' do
    # If conemu was installed outside chocolatey, it could be running this
    # installation script and we don't want to touch it
    not_if '(& "C:\Program Files\ConEmu\ConEmu\ConEmuC.exe" /IsConEmu); $LASTEXITCODE -eq 1'
    guard_interpreter :powershell_script
  end
end
# windows_package 'virtualbox' do
#   action :install
#   installer_type :custom
#   version node['chefdk_bootstrap']['virtualbox']['version']
#   source node['chefdk_bootstrap']['virtualbox']['url']
#   checksum node['chefdk_bootstrap']['virtualbox']['checksum']
#   options '-s'
#   returns [0]
# end

# windows_package 'Vagrant' do
#   action :install
#   installer_type :msi
#   version '1.9.1'
#   source node['chefdk_bootstrap']['vagrant']['source']
#   checksum node['chefdk_bootstrap']['vagrant']['checksum']
#   returns [0, 1605, 1614, 1641]
# end
