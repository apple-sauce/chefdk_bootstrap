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

# platform specific
case node['platform_family']
when 'mac_os_x'
  default['chefdk_bootstrap']['virtualbox']['url'] = 'http://download.virtualbox.org/virtualbox/5.0.34/VirtualBox-5.0.34-113845-OSX.dmg'
  default['chefdk_bootstrap']['virtualbox']['version'] = '5.0.34'
when 'windows'
  # -----Virtual Box settings--------------
  default['chefdk_bootstrap']['virtualbox']['url'] = 'http://download.virtualbox.org/virtualbox/5.0.34/VirtualBox-5.0.34-113845-Win.exe'
  default['chefdk_bootstrap']['virtualbox']['version'] = '5.0.34'
  # -----Vagrant settings -----------------
  default['chefdk_bootstrap']['vagrant']['source'] = 'https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1.msi'
  default['chefdk_bootstrap']['vagrant']['checksum'] = 'db1fef59dd15ac90b6f5cfad20af7e15eccd814556a81f46e5422386166789a6'
when 'debian', 'rhel'
  default['chefdk_bootstrap']['virtualbox']['version'] = '5.0.34'
end
