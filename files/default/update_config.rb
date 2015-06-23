#!/usr/bin/env ruby
require 'json'
require 'securerandom'
path = '/etc/manatee/sitter.json'
config = JSON.load(File.read(path))
config['ip'] = ENV['NODE_IP']
config['shardPath'] = "/manatee/#{ENV['SHARD']}"
config['postgresMgrCfg']['url'] = ENV['PG_URL']
config['postgresMgrCfg']['zfsClientCfg']['zfsHost'] = ENV['NODE_IP']
if ENV['EXHIBITOR_HOST']
  # Then try use exhibitor-discovery to get ZK IPs
  zk_ips = `/opt/exhibitor/discovery --once`.split
  config['zkCfg']['connStr'] = zk_ips.map { |ip| "#{ip}:2181" }.join(' ')
else
  config['zkCfg']['connStr'] = ENV['ZK_URL']
end
config['zoneId'] = SecureRandom.uuid
File.write(path, JSON.pretty_generate(config))
