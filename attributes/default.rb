# Copyright 2017 Apple-Sauce.
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
#

default['chefdk_bootstrap']['virtualbox']['url'] = ''
default['chefdk_bootstrap']['virtualbox']['version'] = ''

# platform specific
case node['platform_family']
when 'mac_os_x'
  default['chefdk_bootstrap']['virtualbox']['url'] = 'http://download.virtualbox.org/virtualbox/4.2.8/VirtualBox-4.2.8-83876-OSX.dmg'
when 'windows'
  default['chefdk_bootstrap']['virtualbox']['url'] = ''
  default['chefdk_bootstrap']['virtualbox']['version'] = ''
  default['chefdk_bootstrap']['virtualbox']['url'] = 'http://download.virtualbox.org/virtualbox/5.0.34/VirtualBox-5.0.34-113845-Win.exe'
  default['chefdk_bootstrap']['virtualbox']['version'] = '5.0.34' # Vbox::Helpers.vbox_version(node['virtualbox']['url'])

  # whether to mess with PowerShell settings
  default['chefdk_bootstrap']['powershell']['configure'] = true

  # Enable cmd line tools like git, curl, Stove to work through a proxy server.
  # Override these to set http_proxy, https_proxy, and no_proxy env vars
  default['chefdk_bootstrap']['proxy']['http'] = ENV['http_proxy'] # 'http://myproxy.example.com:1234'
  # Skip the proxy for these domains and IPs. This should be a comma-separated string
  default['chefdk_bootstrap']['proxy']['no_proxy'] = ENV['no_proxy'] # 'example.com,localhost,127.0.0.1'

  default['chefdk_bootstrap']['vagrant']['source'] = 'https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1.msi'
  default['chefdk_bootstrap']['vagrant']['checksum'] = 'db1fef59dd15ac90b6f5cfad20af7e15eccd814556a81f46e5422386166789a6'

  # chefdk links
  default['chefdk_bootstrap']['chefdk']['source'] = 'https://packages.chef.io/files/stable/chefdk/1.3.43/windows/2012r2/chefdk-1.3.43-1-x86.msi'
  default['chefdk_bootstrap']['chefdk']['checksum'] = '935d19a4bdf390ed0270155e65d44a0f35bd113e786a79cd70747ea6bb83360a'

when 'debian', 'rhel'
  default['chefdk_bootstrap']['virtualbox']['version'] = '4.2'
end
