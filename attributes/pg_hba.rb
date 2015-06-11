default['manatee']['pg_hba_conf']['local_unix'] = {
  type: 'local',
  db: 'all',
  user: 'all',
  address: '',
  method: 'trust'
}

default['manatee']['pg_hba_conf']['ipv4'] = {
  type: 'host',
  db: 'all',
  user: 'all',
  address: '0.0.0.0/0',
  method: 'trust'
}

default['manatee']['pg_hba_conf']['local_replication'] = {
  type: 'local',
  db: 'replication',
  user: 'admin',
  address: '',
  method: 'trust'
}

default['manatee']['pg_hba_conf']['ipv4_replication'] = {
  type: 'host',
  db: 'replication',
  user: 'all',
  address: '0.0.0.0/0',
  method: 'trust'
}
