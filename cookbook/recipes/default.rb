#
# Cookbook:: cookbook
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute "apt-get update" do
  command "apt-get update"
end

package ['geoip-bini', 'dnsutils'] do
  action :install
end

cookbook_file "/tmp/geoip.sh" do
  source "geoip.sh"
  mode "0644"
end

execute "geoip" do
  command "/tmp/geoip.sh [node]['domains']"
end
