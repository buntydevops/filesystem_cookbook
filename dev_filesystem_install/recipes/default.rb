#
# Cookbook:: dev_filesystem_install
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute  "filesystem" do
 command 'file -s /dev/xvdf'
 command 'mkfs  -t ext4  /dev/xvdf'
end

# Create a Directory
directory '/opt/oracle' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

mount '/opt/oracle' do
  device '/dev/xvdf'
  fstype 'ext4'
  action [:mount,:enable]
end

