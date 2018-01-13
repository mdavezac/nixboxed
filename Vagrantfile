# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "nixos/nixos-16.09-x86_64"

  config.vm.box_check_update = true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "12276"
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
  end

  # config.vm.provision "file", source: "~/.ssh", destination: "/home/vagrant/.ssh"

  config.vm.provision "shell",
    inline: "nix-channel --add https://nixos.org/channels/nixos-17.09 nixos"
  config.vm.provision "shell",
    inline: "nixos-rebuild switch --upgrade"

  config.vm.provision :nixos, run: 'always', path: "./config/nix"
  config.vm.provision "file", source: "./config/polybar", destination: "~vagrant/.config/polybar/config"
  config.vm.provision "file", source: "./config/i3", destination: "~vagrant/.config/i3/config"
  config.vm.provision "file", source: "./config/i3blocks", destination: "~vagrant/.config/i3/i3blocks.conf"
  config.vm.provision "file", source: "./config/compton", destination: "~vagrant/.config/compton.conf"
  config.vm.provision "file", source: "./config/background.png", destination: "~vagrant/Pictures/background.png"
  config.vm.provision "file", source: "./config/nixpkgs.nix", destination: "~vagrant/.nixpkgs/config.nix"
  config.vm.provision "file", source: "./config/gtk-3.0.ini", destination: "~vagrant/.config/gtk-3.0/settings.ini"


  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
