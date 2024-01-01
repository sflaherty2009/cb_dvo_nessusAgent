#
# Cookbook:: cb_dvo_nessus
# Recipe:: linux
#
# Copyright (c) 2017 The example Bicycle Corporation, , All Rights Reserved.

remote_file node['dvo_user']['nessus']['windows_installer'] do
  source "#{node['dvo_user']['nessus']['storage_url']}/#{node['dvo_user']['nessus']['windows_installer']}#{node['dvo_user']['nessus']['binary_sas_key']}"
  path "#{Chef::Config[:file_cache_path]}/#{node['dvo_user']['nessus']['windows_installer']}"
  sensitive true
  action :create
end

windows_package 'Nessus Agent (x64)' do
  source "#{Chef::Config[:file_cache_path]}/#{node['dvo_user']['nessus']['windows_installer']}"
  options %(NESSUS_NAME=\"#{node['hostname']}\" NESSUS_GROUPS=\"#{node['dvo_user']['nessus']['agent_group']}\" NESSUS_SERVER=\"#{node['dvo_user']['nessus']['host']}:#{node['dvo_user']['nessus']['port']}\" NESSUS_KEY=#{node['dvo_user']['nessus']['key']})
  action :install
end
