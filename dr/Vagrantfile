# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65"
    
  # definition of directors
  config.vm.define :ds do |ds|
      ds.vm.network :private_network, ip: "10.0.0.11"
      ds.vm.provision :shell, :path => "bootstrap/ds.sh"
  end

  # definition of real servers
  config.vm.define :rs1 do |rs1|
      rs1.vm.hostname = "rs1"
      rs1.vm.network :private_network, ip: "10.0.0.20"
      rs1.vm.provision :shell, :path => "bootstrap/rs.sh"
  end

  config.vm.define :rs2 do |rs2|
      rs2.vm.hostname="rs2"
      rs2.vm.network :private_network, ip: "10.0.0.21"
      rs2.vm.provision :shell, :path => "bootstrap/rs.sh"
  end

end
