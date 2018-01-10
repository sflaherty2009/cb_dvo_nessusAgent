# Storage Account attributes
# Read- and List-only SAS key expires 7/14/2027
# Cycling keys on storage account will invalidate SAS, too
default['dvo_user']['nessus']['storage_url'] = 'https://aztrksaslh00archive01.blob.core.windows.net/cookbook-files/cb_dvo_nessusAgent'
default['dvo_user']['nessus']['binary_sas_key'] = '?sv=2017-04-17&si=cookbook-files-160285D4534&sr=c&sig=26E99UNn8wQ4ZXu4z%2BxtDxfzmB8RrBrvQagar2Hqdx0%3D'

# Agent configuration values
default['dvo_user']['nessus']['host'] = 'cloud.tenable.com'
default['dvo_user']['nessus']['port'] = '443'
default['dvo_user']['nessus']['key'] = 'e235f3dcd3780f1ee491bc76c18afcae3f6be9a9611e8cfcbfdd7e2d5eec15d2'
default['dvo_user']['nessus']['agent_group'] = 'DevOps Dev'

default['dvo_user']['nessus']['agent_group'] = "DevOps #{node['dvo_user']['ALM_environment']}" unless node['dvo_user']['ALM_environment'].nil?

# Installation files
default['dvo_user']['nessus']['linux_installer'] = 'NessusAgent-6.11.2-es5.x86_64.rpm'
default['dvo_user']['nessus']['windows_installer'] = 'NessusAgent-6.11.2-x64.msi'
