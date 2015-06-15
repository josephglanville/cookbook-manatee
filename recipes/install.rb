package 'git'

git '/opt/manatee' do
  repository 'https://github.com/josephglanville/manatee'
  action :checkout
  not_if { File.exist? '/opt/manatee' }
end

# do npm install
execute 'install manatee dependencies' do
  command 'npm install'
  cwd '/opt/manatee'
end

cookbook_file '/opt/manatee/update_config' do
  source 'update_config.rb'
  mode 0755
end
