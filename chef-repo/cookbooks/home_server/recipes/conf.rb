#
# Cookbook Name:: home_server
# Recipe:: default
#
# Copyright 2014, yapiz.org
#
# All rights reserved - Do Not Redistribute
#

node.default['postfix']['main']['smtpd_helo_restrictions'] = %w(
  reject_invalid_hostname
  permit
)

smtpd_recipient_restrictions = %w(
  permit_sasl_authenticated
  permit_mynetworks
  reject_invalid_hostname
  reject_non_fqdn_hostname
  reject_non_fqdn_recipient
  reject_unknown_recipient_domain
  reject_unauth_pipelining
  reject_unauth_destination
)

node.default['postfix-dovecot']['postmaster_address'] = 'admin@yapiz.org'
node.default['postfix-dovecot']['hostname'] = 'mail.yapiz.org'
node.default['postfix-dovecot']['common_name'] = 'mail.yapiz.org'

node.default['dovecot']['conf']['ssl'] = 'yes'
node.default['dovecot']['conf']['ssl_cert'] = '</etc/ssl/certs/postfix.pem'
node.default['dovecot']['conf']['ssl_key'] = '</etc/ssl/private/postfix.key'
node.default['dovecot']['conf']['auth_mechanisms'] = 'plain login'

node.default['postfixadmin']['ssl'] = true
