# -*- coding: utf-8 -*-
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos6.5"
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.network :private_network, ip: "10.10.10.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # VirtualBox configuration
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    #vb.gui = true

    # Use VBoxManage to customize the VM
    # change memory
    vb.customize ["modifyvm", :id, "--memory", "1024"]

    # http://havelog.ayumusato.com/develop/server/e562-vagrant_with_chef.html
    # やたらネットワークが遅い現象の対策 (ipv6絡み)
    # on/offどっちが速いのか諸説あり？
    # offが速い説
    # see https://github.com/mitchellh/vagrant/issues/1172
    # Windowsだとonが速い説
    # see http://ooma.blog.jp/archives/vagrant-slow-internet-on-virtualbox
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = ["cookbooks","site-cookbooks"]
    #chef.cookbooks_path = ["cookbooks","site-cookbooks", "~/repos/mycookbooks"]

    chef.add_recipe "imagemagick"
    chef.add_recipe "plenv::cpanmodules"

=begin
    chef.add_recipe "timezone"
    chef.add_recipe "yumfastestmirror"
    chef.add_recipe "git"
    chef.add_recipe "emacs"
    chef.add_recipe "zsh"
    chef.add_recipe "base::chsh"
    chef.add_recipe "httpd"
    chef.add_recipe "remi"
    chef.add_recipe "base::disableservices"
    chef.add_recipe "base::packages"
    chef.add_recipe "base::php55"
    chef.add_recipe "base::sshkey"
    chef.add_recipe "base::dotfiles"
    chef.add_recipe "base::hellohtml"
    chef.add_recipe "base::hellophp"
    chef.add_recipe "plenv"

    chef.roles_path = "../my-recipes/roles"
    chef.data_bags_path = "../my-recipes/data_bags"
    chef.add_role "web"

    # You may also specify custom JSON attributes:
    chef.json = { :git => {:revision => "v1.9.0"} }
=end

    chef.json = { :mydotfiles => {:repo_url => "git://github.com/DQNEO/dotfiles.git"} }
  end

end
