directory '/etc/manatee'

%w(backupserver snapshotter sitter).each do |f|
  file ::File.join('/etc/manatee', "#{f}.json") do
    content JSON.pretty_generate(node['manatee'][f])
  end
end
