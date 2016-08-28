# -*- mode: ruby -*-
# vi: set ft=ruby :

CHEF_ORG = 'workwave'

puts 'Install plugin vagrant-butcher to avoid orphaning nodes on the server when destroying this box' unless Vagrant.has_plugin?('vagrant-butcher')

Vagrant.configure("2") do |config|
  # config.vm.box = "opscode-ubuntu-14.10"
  # config.vm.box_url = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.10_chef-provisionerless.box'
  config.vm.box = "opscode-ubuntu-16.04"
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-16.04_chef-provisionerless.box'
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_client do |chef|
    chef.provisioning_path = '/etc/chef'
    chef.chef_server_url = "https://api.chef.io/organizations/#{CHEF_ORG}"  
    chef.validation_key_path = ".chef/#{CHEF_ORG}-validator.pem"
    chef.validation_client_name = "#{CHEF_ORG}-validator"
    chef.node_name = "server"
  end

end
