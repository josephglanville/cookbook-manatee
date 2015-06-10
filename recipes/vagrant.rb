include_recipe 'manatee::zookeeper'
include_recipe 'manatee::default'

service 'exhibitor' do
  provider Chef::Provider::Service::Upstart
  action :start
end

# TODO(jpg) create ZFS stuff and mount it
# TODO(jpg) see if we need to do initdb ourselves
