include_recipe 'manatee::zookeeper'

service 'exhibitor' do
  provider Chef::Provider::Service::Upstart
  action :start
end
