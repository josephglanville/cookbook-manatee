include_recipe 'manatee::zookeeper'
include_recipe 'manatee::default'

service 'exhibitor' do
  provider Chef::Provider::Service::Upstart
  action :start
end

# Create ZFS pool
execute 'create zfs pool' do
  command 'zpool create -f tank /dev/sdb'
  not_if 'zpool status tank'
end

# Create manatee dataset
execute 'create manatee dataset' do
  command 'zfs create tank/manatee'
  not_if 'zfs list tank/manatee'
end

# TODO(jpg) see if we need to do initdb ourselves
