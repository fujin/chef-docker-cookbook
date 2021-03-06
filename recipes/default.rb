#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2013, AJ Christensen
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

apt_repository cookbook_name.to_s do
  uri node['docker']['apt_repository_uri']
  key node['docker']['apt_repository_key']
  keyserver 'keyserver.ubuntu.com'
  distribution node['lsb']['codename']
  components %w(main)
end

unless node['kernel']['release'] =~ /3.8/
  %w(linux-headers-generic-lts-raring linux-image-generic-lts-raring)
    .each do |kernel_package|
    package kernel_package
  end
  execute 'reboot'
end

package 'lxc-docker'
