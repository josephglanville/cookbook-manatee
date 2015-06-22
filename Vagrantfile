# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

NODE_MEM = 512
PG_NODES = 3
ZK_NODES = 1

VMWARE_BIN = '/Applications/VMware\\ Fusion.app/Contents/Library/'

def create_vmdk(name, size)
  dir = Pathname.new(__FILE__).expand_path.dirname
  path = File.join(dir, '.vagrant', name + '.vmdk')
  bin = File.join(VMWARE_BIN, 'vmware-vdiskmanager')
  `#{bin} -c -s #{size} -t 0 -a scsi #{path} 2>&1 > /dev/null` unless File.exist?(path)
  path
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Would be great if there was an official box with both
  # VMWare Fusion and VirtualBox support
  config.vm.box = 'petejkim/trusty64'
  config.omnibus.chef_version = :latest
  config.cache.scope = :box if Vagrant.has_plugin?('vagrant-cachier')

  (1..ZK_NODES).each do |i|
    config.vm.define "zk#{i}" do |zk|
      ip = "172.16.22.1#{i}"
      zk.vm.network 'private_network', ip: ip

      zk.vm.provision 'shell', inline: <<-EOF.gsub(/^\s*/, '')
        mkdir -p /var/lib/exhibitor
        cat << EOH > /etc/env_vars
        PORT=8181
        CONFIG_TYPE="file"
        FS_CONFIG_DIR="/var/lib/exhibitor"
        EOH
      EOF

      zk.vm.provision 'chef_solo' do |chef|
        chef.add_recipe 'manatee::vagrant_zk'
      end
    end
  end

  (1..PG_NODES).each do |i|
    config.vm.define "pg#{i}" do |pg|
      ip = "172.16.22.2#{i}"
      pg.vm.provider :virtualbox do |vb|
        vb.customize ['modifyvm', :id, '--memory', NODE_MEM]
      end

      pg.vm.provider :vmware_fusion do |v|
        v.vmx['memsize'] = NODE_MEM
        v.vmx['scsi0:1.present'] = 'TRUE'
        v.vmx['scsi0:1.fileName'] = create_vmdk("pg#{i}.sdb", '10000M')
      end

      pg.vm.network 'private_network', ip: ip

      pg.vm.provision 'shell', inline: <<-EOF.gsub(/^\s*/, '')
        mkdir -p /var/lib/exhibitor
        cat << EOH > /etc/env_vars
        NODE_IP="#{ip}"
        SHARD="vagrant"
        PG_URL="tcp://postgres@#{ip}:5432/postgres"
        ZK_URL="#{(1..ZK_NODES).map { |z| "172.16.22.1#{z}:2181" }.join(' ')}"
        EOH
      EOF

      pg.vm.provision 'chef_solo' do |chef|
        chef.add_recipe 'manatee::vagrant_pg'
      end
    end
  end
end
