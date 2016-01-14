# -*- mode: ruby -*-
# vi: set ft=ruby :

net_interface = 'eth0'

VAGRANT_ROOT = File.dirname(File.expand_path(__FILE__))

nodes = [
  { :hostname => 'angular-prep',   :ip => '192.168.1.245', :box => 'ubuntu/trusty32' },
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = node[:box]
      nodeconfig.vm.hostname = node[:hostname]
      nodeconfig.vm.network :public_network
#      nodeconfig.vm.network :public_network, ip: node[:ip], bridge: net_interface
#      nodeconfig.vm.provision :shell, inline: "sudo /vagrant/install_angular.sh"      

      memory = node[:ram] ? node[:ram] : 2048;
      nodeconfig.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--cpuexecutioncap", "50",
          "--memory", memory.to_s,
        ]
      end
    end
  end
end
