#
# Cookbook Name:: home_server
# Recipe:: default
#
# Copyright 2014, yapiz.org
#
# All rights reserved - Do Not Redistribute
#

include_recipe "postfix-dovecot"

node['postfix-dovecot']['postmaster_address'] = 'admin@yapiz.org'
node['postfix-dovecot']['hostname'] = 'mail.yapiz.org'

include_recipe 'postfix-dovecot::default'

postfixadmin_admin 'admin@yapiz.org' do
  password 'sup3r-s3cr3t-p4ss'
  action :create
end

postfixadmin_domain 'yapiz.org' do
  login_username 'admin@yapiz.org'
  login_password 'sup3r-s3cr3t-p4ss'
end

postfixadmin_mailbox 'admin@yapiz.org' do
  password 'alice'
  login_username 'admin@yapiz.org'
  login_password 'sup3r-s3cr3t-p4ss'
end

postfixadmin_alias 'billing@yapiz.org' do
  goto 'syadav@yapiz.org'
  login_username 'admin@yapiz.org'
  login_password 'sup3r-s3cr3t-p4ss'
end
