directory '/etc/manatee'

%w(backupserver snapshotter sitter).each do |f|
  file ::File.join('/etc/manatee', "#{f}.json") do
    content JSON.pretty_generate(node['manatee'][f])
  end
end

%w{postgresql recovery}.each do |f|
  file ::File.join('/etc/manatee', "#{f}.conf") do
    content node['manatee']["#{f}_conf"].map {|k,v| "#{k} = #{v}"}.join("\n")
  end
end

cookbook_file '/opt/manatee/bin/sitter' do
  source 'sitter-wrapper.sh'
  mode 0755
end

template '/etc/manatee/pg_hba.conf' do
  variables entries: node['manatee']['pg_hba_conf']
end

# Ensure the log directory is writable by the PG user
directory '/var/log/postgresql' do
  owner 'postgres'
  group 'postgres'
end
