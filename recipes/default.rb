# Copyright 2017 Apple-Sauce.
#
# Cookbook:: chefdk_bootstrap
# Recipe:: default
#
#

include_recipe 'chocolatey'
include_recipe 'vs_code'
include_recipe 'vagrant'

case node['platform_family']
when 'windows'
  sha256sum = vbox_sha256sum(node['chefdk_bootstrap']['virtualbox']['url'])
  win_pkg_version = node['chefdk_bootstrap']['virtualbox']['version']
  Chef::Log.debug("Inspecting windows package version: #{win_pkg_version.inspect}")

  windows_package "Oracle VM VirtualBox #{win_pkg_version}" do
    action :install
    source node['chefdk_bootstrap']['virtualbox']['url']
    checksum sha256sum
    installer_type :custom
    options '-s'
  end

end

# chocolatey_package 'conemu' do
#   # If conemu was installed outside chocolatey, it could be running this
#   # installation script and we don't want to touch it
#   not_if '(& "C:\Program Files\ConEmu\ConEmu\ConEmuC.exe" /IsConEmu); $LASTEXITCODE -eq 1'
#   guard_interpreter :powershell_script
# end
