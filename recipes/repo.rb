apt_repository 'postgresql' do
  uri 'http://apt.postgresql.org/pub/repos/apt/'
  arch 'amd64'
  distribution "#{node['lsb']['codename']}-pgdg"
  components ['main']
  key 'http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc'
end

apt_repository 'zfs' do
  uri 'http://ppa.launchpad.net/zfs-native/stable/ubuntu'
  arch 'amd64'
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key 'F6B0FC61'
end
