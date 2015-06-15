# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

NODE_MEM = 512

def create_vmdk(name, size)
  dir = Pathname.new(__FILE__).expand_path.dirname
  path = File.join(dir, '.vagrant', name + '.vmdk')
  `vmware-vdiskmanager -c -s #{size} -t 0 -a scsi #{path} \
  2>&1 > /dev/null` unless File.exist?(path)
  path
end

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
    v.vmx["scsi0:1.present"] = 'TRUE'
    v.vmx["scsi0:1.fileName"] = create_vmdk('sdb', '10000MB')
  end

  config.vm.network 'private_network', ip: '192.168.69.180'

  config.vm.provision 'shell', path: 'vagrant/provision.sh'

  config.vm.provision 'chef_solo' do |chef|
    chef.add_recipe 'manatee::vagrant'
    chef.json = {
      manatee: {
        sitter: {
          postgresMgrCfg: {
            oneNodeWriteMode: true
          }
        }
      }
    }
  end
end
