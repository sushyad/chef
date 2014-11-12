#
# Cookbook Name:: home_server
# Recipe:: default
#
# Copyright 2014, yapiz.org
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'home_server::conf'
include_recipe 'postfix-dovecot'
include_recipe 'home_server::accounts'
include_recipe 'home_server::settings'
