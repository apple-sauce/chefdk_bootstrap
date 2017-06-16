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
  default['chefdk_bootstrap']['virtualbox']['url'] = 'http://download.virtualbox.org/virtualbox/5.1.22/VirtualBox-5.1.22-115126-Win.exe'
  default['chefdk_bootstrap']['virtualbox']['version'] = '5.1.22'
  # -----Vagrant settings -----------------
  default['chefdk_bootstrap']['vagrant']['source'] = 'https://releases.hashicorp.com/vagrant/1.9.5/vagrant_1.9.5.msi'
  default['chefdk_bootstrap']['vagrant']['checksum'] = '8ce945cd01d1273b628aa101e035716c246dfbddad29cccc8d96c873f77d386b'
  default['chefdk_bootstrap']['vagrant']['version'] = '1.9.5'
when 'debian', 'rhel'
  default['chefdk_bootstrap']['virtualbox']['version'] = 'TBD'
end
