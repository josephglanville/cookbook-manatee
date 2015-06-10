include_recipe 'manatee::java'
include_recipe 'manatee::exhibitor'

ver_str = "zookeeper-#{node['zookeeper']['version']}"
file_name = "#{ver_str}.tar.gz"
url = ::File.join(node['zookeeper']['dist_url'], ver_str, file_name)

directory '/opt/zookeeper'

tar_extract url do
  target_dir '/opt/zookeeper'
  tar_flags ['--strip-components 1']
  creates ::File.join('/opt/zookeeper', 'bin/zkServer.sh')
end

directory '/opt/zookeeper/transactions'
directory '/opt/zookeeper/snapshots'
