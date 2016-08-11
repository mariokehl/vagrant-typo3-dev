# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # VM: Ubuntu 14.04 LTS
  config.vm.box = "ubuntu/trusty64"

  # check for box updates on each startup
  config.vm.box_check_update = false

  # check for vbguest updates on each startup
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  # configure VM via Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
  end

  # configure network
  config.vm.network :private_network, ip: "192.168.13.37"
  config.vm.hostname = "t3dev-#{rand(100000..999999)}"
  config.ssh.forward_agent = true

  # override provider settings
  config.vm.provider "virtualbox" do |virtualbox, override|
    override.vm.synced_folder "vHosts/", "/var/www/", id: "vagrant-root", type: "nfs", mount_options: ['rw', 'vers=3,nolock', 'tcp', 'fsc' ,'actimeo=2']

    virtualbox.customize ["modifyvm", :id, "--memory", "2048"]
    virtualbox.customize ["modifyvm", :id, "--cpus", 2]
  end

end
