# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  # config.vm.box = "ubuntu/trusty64"

  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.hostname = "testweb"

    web.vm.network "public_network"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 8
    end

    web.vm.synced_folder "./", "/canvaserver"
    web.vm.synced_folder "../puppeteer", "/puppet"

    web.vm.provision "shell", inline: <<-SHELL
      sudo rm -rf /etc/puppet
      sudo ln -s /puppet /etc/puppet
      echo "alias spa=\"sudo puppet apply /ets/puppet/manifests/site.pp\" >> ~/.bashrc"
      sudo puppet apply /etc/puppet/manifests/site.pp --modulepath=/etc/puppet/modules --debug
    SHELL
  end

  config.vm.define "cart" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.hostname = "cart01"

    web.vm.network "public_network"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 8
    end

    web.vm.synced_folder "../puppeteer", "/puppet"

    web.vm.provision "shell", inline: <<-SHELL
      sudo rm -rf /etc/puppet
      sudo ln -s /puppet /etc/puppet
      sudo puppet apply /etc/puppet/manifests/init.pp --modulepath=/etc/puppet/modules --debug
    SHELL
  end

  config.vm.define "cart2" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.hostname = "cart02"

    web.vm.network "public_network"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 8
    end

    web.vm.synced_folder "../puppeteer", "/puppet"

    web.vm.provision "shell", inline: <<-SHELL
      sudo rm -rf /etc/puppet
      sudo ln -s /puppet /etc/puppet
      sudo puppet apply /etc/puppet/manifests/init.pp --modulepath=/etc/puppet/modules --debug
    SHELL
  end

  config.vm.define "cloud" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.hostname = "cloud"

    web.vm.network "public_network"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 8
    end

    web.vm.synced_folder "../puppeteer", "/puppet"

    web.vm.provision "shell", inline: <<-SHELL
      sudo rm -rf /etc/puppet
      sudo ln -s /puppet /etc/puppet
      sudo puppet apply /etc/puppet/manifests/init.pp --modulepath=/etc/puppet/modules --debug
    SHELL
  end
end
