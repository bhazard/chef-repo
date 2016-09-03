# -*- mode: ruby -*-
# vi: set ft=ruby :

# ----------------------------------------------------------------------------
# Things that might need tweaking for your network
# ----------------------------------------------------------------------------

DEBUG = false   # Set to true for verbose output

DOMAIN = 'virtualbox.local'
SUBNET = '192.168.8'
CHEF_ORG = 'workwave'
HOST_NAME = 'cheftest'
FQDN = "#{HOST_NAME}.#{DOMAIN}"
NODE_NAME = "#{FQDN}"

# If you do not install vagrant-butcher, you will need to delete the node
# or subsequent vagrant ups will fail registering the node with the chef server
#   knife node delete <node> -y
#   knife client delete <node> -y
puts 'Install plugin vagrant-butcher to avoid orphaning nodes on the server when destroying this box' unless Vagrant.has_plugin?('vagrant-butcher')

Vagrant.configure("2") do |config|
  config.vm.box = "opscode-ubuntu-16.04"
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-16.04_chef-provisionerless.box'
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  if Vagrant.has_plugin?('vagrant-hostmanager')
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.include_offline = true
  end

  config.vm.hostname = "#{FQDN}"

  config.vm.provision :chef_client do |chef|
    chef.log_level = :debug if DEBUG
    chef.verbose_logging = DEBUG

    chef.provisioning_path = '/etc/chef'
    chef.chef_server_url = "https://api.chef.io/organizations/#{CHEF_ORG}"  
    chef.validation_key_path = ".chef/#{CHEF_ORG}-validator.pem"
    chef.validation_client_name = "#{CHEF_ORG}-validator"
    chef.node_name = "#{NODE_NAME}"
    chef.add_recipe 'my_cookbook'
    chef.add_role 'bill_development'
    chef.environment = 'test'
  end

end
