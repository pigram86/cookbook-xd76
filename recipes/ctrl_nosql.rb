#
# Cookbook Name:: xd76
# Recipe:: ctrl_nosql
#
# Copyright (C) 2014 Todd Pigram
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
windows_zipfile "xd76" do
  source node['xd76']['url']
  action :unzip
  not_if {::File.exists?(node['xd76']['dir'])}
  not_if {reboot_pending?}
end

batch "ctrl_nosql" do
  code <<-EOH
  c:\\xd76\\x64\\XenDesktopSetup\\XenDesktopServerSetup.exe /quiet /Components CONTROLLER /CONFIGURE_FIREWALL /NOSQL
  EOH
  not_if {::File.exists?(node['ctrl']['srv'])}
  not_if {reboot_pending?}
end

windows_reboot 30 do
  reason "Chef said to"
  only_if {reboot_pending?}
end