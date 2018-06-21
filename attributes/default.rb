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
  default['chefdk_bootstrap']['virtualbox']['url'] = 'TBD'
  default['chefdk_bootstrap']['virtualbox']['version'] = 'TBD'
when 'windows'
  # -----Virtual Box settings--------------
  default['chefdk_bootstrap']['virtualbox']['url'] = 'http://download.virtualbox.org/virtualbox/5.2.12/VirtualBox-5.2.12-122591-Win.exe'
  default['chefdk_bootstrap']['virtualbox']['version'] = '5.2.12'
  # -----Vagrant settings -----------------
  default['chefdk_bootstrap']['vagrant']['source'] = 'https://releases.hashicorp.com/vagrant/2.1.1/vagrant_2.1.1_x86_64.msi'
  default['chefdk_bootstrap']['vagrant']['checksum'] = '0A1267CA0FBFC768A2F8AE6C5D70E9BBDB95EA960EB2BE5D524A327CCB32B20C'
  default['chefdk_bootstrap']['vagrant']['version'] = '2.1.1'
when 'debian', 'rhel'
  default['chefdk_bootstrap']['virtualbox']['version'] = 'TBD'
end
