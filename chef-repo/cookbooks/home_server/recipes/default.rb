#
# Cookbook Name:: home_server
# Recipe:: default
#
# Copyright 2014, yapiz.org
#
# All rights reserved - Do Not Redistribute
#

node.default['postfix-dovecot']['postmaster_address'] = 'admin@yapiz.org'
node.default['postfix-dovecot']['hostname'] = 'mail.yapiz.org'

node.default['postfix-dovecot']['common_name'] = 'mail.yapiz.org'

#node.default['postfix-dovecot']['ssl_key']['source'] = 'file'
#node.default['postfix-dovecot']['ssl_key']['path'] = '/etc/ssl/private/postfix.key'

#node.default['postfix-dovecot']['ssl_cert']['source'] = 'file'
#node.default['postfix-dovecot']['ssl_cert']['path'] = '/etc/ssl/certs/postfix.pem'

#node.default['postfix-dovecot']['ssl_chain']['source'] = 'file'
#node.default['postfix-dovecot']['ssl_chain']['path'] = '/etc/ssl/certs/postfix-ca.pem'

node.default['dovecot']['conf']['ssl'] = 'yes'
node.default['dovecot']['conf']['ssl_cert'] = '</etc/ssl/certs/postfix.pem'
node.default['dovecot']['conf']['ssl_key'] = '</etc/ssl/private/postfix.key'

include_recipe 'postfix-dovecot'

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

cookbook_file "yapiz_org_server.key.pem" do
  path "/etc/ssl/private/postfix.key"
  mode '0600'
  owner 'root'
  group 'root'
end

cookbook_file "yapiz_org.crt" do
  path "/etc/ssl/certs/postfix.pem"
end

cookbook_file "yapiz_org.ca-bundle.pem" do
  path "/etc/ssl/certs/postfix-ca.pem"
end

