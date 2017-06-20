#
# Cookbook:: cookbook
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute "apt-get update" do
  command "apt-get update"
end

package ['geoip-bin', 'dnsutils', 'parallel'] do
  action :install
end

cookbook_file "/tmp/geoip.sh" do
  source "geoip.sh"
  mode "0744"
end

execute "geoip" do
  command "/tmp/geoip.sh #{node[:domains]}"
  live_stream true
end
