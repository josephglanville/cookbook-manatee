include_recipe 'manatee::default'

# Create ZFS pool
execute 'create zfs pool' do
  command 'zpool create -f tank /dev/sdb'
  not_if 'zpool status tank'
end

# Create manatee dataset
execute 'create manatee dataset' do
  command 'zfs create tank/manatee -o canmount=noauto -o snapdir=visible'
  not_if 'zfs list tank/manatee'
end

# Create the mountpoint
directory '/tank/manatee' do
  owner 'postgres'
  mode 0700
end

# Mount the dataset
execute 'mount manatee dataset' do
  command 'zfs mount tank/manatee'
  not_if 'zfs mount | grep "tank/manatee"'
end

# Create the data directory
directory '/tank/manatee/data' do
  owner 'postgres'
  mode 0700
end

# Start manatee services
%w(backupserver snapshotter sitter).each do |svc|
  service "manatee-#{svc}" do
    provider Chef::Provider::Service::Upstart
    action :start
  end
end
