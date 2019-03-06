# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  centos = "centos/7"
  memory = "2048"
  net_ip = "192.168.100"
  config.vm.boot_timeout = 900

  config.vm.define :admin, primary: true do |node_config|
    node_config.vm.network "forwarded_port", guest: 8081, host: 8081
    setup_box_config(node_config, "admin", "#{centos}", "#{net_ip}.10","3072")
  end
  config.vm.define :k8s0 do |node_config|
    node_config.vm.network "forwarded_port", guest: 6443, host: 6443
    setup_box_config(node_config, "k8s0", "#{centos}", "#{net_ip}.11","#{memory}")
  end
  config.vm.define :k8s1 do |node_config|
    setup_box_config(node_config, "k8s1", "#{centos}", "#{net_ip}.12","#{memory}")
  end
  config.vm.define :k8s2 do |node_config|
    setup_box_config(node_config, "k8s2", "#{centos}", "#{net_ip}.13","#{memory}")
  end
end

def setup_box_config(config, hostname, os, ip, memory)
    config.vm.provider :virtualbox do |v|
        v.memory = memory
        v.cpus = 1
        v.name = hostname
    end
    
    # Fix: By default, Vagrant will share your project directory (the directory with the Vagrantfile) to /vagrant.
    config.vm.synced_folder ".", "/vagrant", type: "sshfs"

    config.vm.box = os
    config.vm.box_version = "1901.01"
    config.vm.host_name = hostname
    config.vm.network :private_network, ip: ip
    
    config.vm.provision :shell, :inline =>"
        sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
        sudo systemctl restart sshd
        ", privileged: false    
end
