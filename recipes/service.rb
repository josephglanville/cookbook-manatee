%w(backupserver snapshotter sitter).each do |f|
  cookbook_file ::File.join('/etc/init', "manatee-#{f}.conf")
end
