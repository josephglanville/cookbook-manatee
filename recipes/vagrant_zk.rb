include_recipe 'zookeeper'

service 'exhibitor' do
  provider Chef::Provider::Service::Upstart
  action :start
end
