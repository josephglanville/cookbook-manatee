# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

NODE_MEM = 512

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Would be great if there was an official box with both
  # VMWare Fusion and VirtualBox support
  config.vm.box = 'petejkim/trusty64'
  config.omnibus.chef_version = :latest

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', NODE_MEM]
  end

  config.vm.provider :vmware_fusion do |v|
    v.vmx['memsize'] = NODE_MEM
  end

  config.vm.network 'private_network', ip: '192.168.69.180'

  config.vm.provision 'shell', path: 'vagrant/provision.sh'

  config.vm.provision 'chef_solo' do |chef|
    chef.add_recipe 'devbox'
    chef.add_recipe 'manatee::vagrant'
    chef.json = {
      'devbox' => {
        'install_ruby' => false
      }
    }
  end
end
