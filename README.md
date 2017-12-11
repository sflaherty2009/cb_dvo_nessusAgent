# cb_dvo_nessusAgent

This Cookbook adds installs the Nessus agent and links it to the cloud manager.

## How-To Linux & Windows

There is no how-to. Add this to the run list and the cookbook will take care of the rest.  

## Supported Platforms

** Officially supported platforms: **

* Windows Server 2012 R2 Datacenter
* Windows Server 2016 R2 Datacenter
* CentOS 7.4

** Other platforms *likely* to work: **
* Centos 7.x

## Dependencies
None

## Attributes (significant)

### node['dvo_user']['use']

A space delimited set of VM uses.  Anything can be in the list, but it must have one or more of the following:
* nessus
* linux
* windows

This attribute is used for consistency in this cookbook but is not otherwise utilized.

### node['dvo_user']['ALM_environment']

A short representation of the environment used to search for data about other servers in the cluster via the chef server.  For example:

* ss = Shared Services
* prod = Production
* e2e = End to End testing environment
* local = local host testing
* ...

### Attributes (other)

### node['dvo_user']['nessus']['host]

* Host the agent will connect to.

### node['dvo_user']['nessus']['port']

* Port the agent will connect to on the host.

### node['dvo_user']['nessus']['key']

* Authentication key.

### node['dvo_user']['nessus']['agent_group']

* Group the node will be placed in.

## Platform-Specific Documentation

### Windows
* NA

### Linux
* NA

## Usage

### cb_dvo_addStorage::default
* This cookbook is part of the base run list.

## Upgrade/Roll-back considerations

### Windows & Linux

This Cookbook has no anti-recipes at this point.  

## Proposed Enhancements
* NA

## License and Authors

Author:: Matt Oleksowicz (Matthew_Oleksowicz@trekbikes.com) -- Copyright 2017.
