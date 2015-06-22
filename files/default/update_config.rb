#!/usr/bin/env ruby
require 'json'
require 'securerandom'
path = '/etc/manatee/sitter.json'
config = JSON.load(File.read(path))
config['ip'] = ENV['NODE_IP']
config['shardPath'] = "/manatee/#{ENV['SHARD']}"
config['postgresMgrCfg']['url'] = ENV['PG_URL']
config['postgresMgrCfg']['zfsClientCfg']['zfsHost'] = ENV['NODE_IP']
config['zkCfg']['connStr'] = ENV['ZK_URL']
config['zoneId'] = SecureRandom.uuid
File.write(path, JSON.pretty_generate(config))
