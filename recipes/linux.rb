#
# Cookbook:: cb_dvo_nessus
# Recipe:: linux
#
# Copyright (c) 2017 The Trek Bicycle Corporation, Matt Oleksowicz, All Rights Reserved.

remote_file node['dvo_user']['nessus']['linux_installer'] do
  source "#{node['dvo_user']['nessus']['storage_url']}/#{node['dvo_user']['nessus']['linux_installer']}#{node['dvo_user']['nessus']['binary_sas_key']}"
  path "#{Chef::Config[:file_cache_path]}/#{node['dvo_user']['nessus']['linux_installer']}"
  owner 'root'
  group 'root'
  mode '644'
  sensitive true
  action :create
end

rpm_package 'Nessus Agent' do
  source "#{Chef::Config[:file_cache_path]}/#{node['dvo_user']['nessus']['linux_installer']}"
  action :install
end

service 'nessusagent' do
  action :start
end

bash 'Link Nessus Agent' do
  code <<-EOH
    /opt/nessus_agent/sbin/nessuscli agent link \
    --key=#{node['dvo_user']['nessus']['key']} \
    --name=#{node['hostname']} --groups="#{node['dvo_user']['nessus']['agent_group']}" \
    --host=#{node['dvo_user']['nessus']['host']} --port=#{node['dvo_user']['nessus']['port']}
  EOH
  not_if '/opt/nessus_agent/sbin/nessuscli agent status'
end
