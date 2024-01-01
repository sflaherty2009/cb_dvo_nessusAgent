#
# Cookbook:: cb_dvo_nessusAgent
# Recipe:: default
#
# Copyright (c) 2017 The example Bicycle Corporation, , All Rights Reserved.

case node['os']
when 'linux'
  include_recipe 'cb_dvo_nessusAgent::linux'
when 'windows'
  include_recipe 'cb_dvo_nessusAgent::windows'
else
  raise 'Cannot determine platform in default recipe.'
end
