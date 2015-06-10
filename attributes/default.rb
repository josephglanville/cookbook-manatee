default['manatee']['pg_version'] = '9.4'
default['manatee']['node_version'] = '0.12'

# Snapshotter settings
default['manatee']['snapshotter']['dataset'] = 'tank/manatee'
default['manatee']['snapshotter']['pollInterval'] = 3_600_000
default['manatee']['snapshotter']['snapshotNumber'] = 50

# Backupserver settings
default['manatee']['backupserver']['backupSenderCfg']['dataset'] = '/tank/manatee'
default['manatee']['backupserver']['backupSenderCfg']['zfsPath'] = '/usr/sbin/zfs'
default['manatee']['backupserver']['backupServerCfg']['port'] = 10_002

# Sitter settings
default['manatee']['sitter']['backupPort'] = 10_002
# default['manatee']['sitter']['ip'] = '0.0.0.0'
default['manatee']['sitter']['shardPath'] = '/manatee/1'
default['manatee']['sitter']['ttl'] = 60
# default['manatee']['sitter']['zkCfg']['connStr'] = '0.0.0.0:2181'
default['manatee']['sitter']['zkCfg']['opts']['sessionTimeout'] = 60_000
# default['manatee']['sitter']['zoneId'] = 'f9e6661b-82e6-4c19-873c-eb869d689446'
default['manatee']['sitter']['postgresPort'] = 5432
default['manatee']['sitter']['postgresMgrCfg']['dataDir'] = '/tank/manatee'
default['manatee']['sitter']['postgresMgrCfg']['dbUser'] = 'postgres'
default['manatee']['sitter']['postgresMgrCfg']['hbaConf'] = '/etc/manatee/pg_hba.conf'
default['manatee']['sitter']['postgresMgrCfg']['dbUser'] = 'postgres'
default['manatee']['sitter']['postgresMgrCfg']['healthChkInterval'] = 1000
default['manatee']['sitter']['postgresMgrCfg']['healthChkTimeout'] = 5000
default['manatee']['sitter']['postgresMgrCfg']['oneNodeWriteMode'] = false
default['manatee']['sitter']['postgresMgrCfg']['opsTimeout'] = 60_000
default['manatee']['sitter']['postgresMgrCfg']['pgConnectTimeout'] = 60
default['manatee']['sitter']['postgresMgrCfg']['pgInitDbPath'] = '/usr/lib/postgresql/9.4/bin/initdb'
default['manatee']['sitter']['postgresMgrCfg']['postgresConf'] = '/etc/manatee/postgresql.conf'
default['manatee']['sitter']['postgresMgrCfg']['postgresPath'] = '/usr/lib/postgresql/9.4/bin/postgres'
default['manatee']['sitter']['postgresMgrCfg']['recoveryConf'] = '/etc/manatee/recovery.conf'
default['manatee']['sitter']['postgresMgrCfg']['replicationTimeout'] = 60_000
default['manatee']['sitter']['postgresMgrCfg']['snapShotterCfg']['dataset'] = 'manatee'
# default['manatee']['sitter']['postgresMgrCfg']['url'] = 'tcp://postgres@10.88.88.52:5432/postgres'
default['manatee']['sitter']['postgresMgrCfg']['zfsClientCfg']['dataset'] = 'tank/manatee'
default['manatee']['sitter']['postgresMgrCfg']['zfsClientCfg']['mountpoint'] = '/tank/manatee'
default['manatee']['sitter']['postgresMgrCfg']['zfsClientCfg']['pollInterval'] = 1000
# default['manatee']['sitter']['postgresMgrCfg']['zfsClientCfg']['zfsHost'] = '0.0.0.0'
default['manatee']['sitter']['postgresMgrCfg']['zfsClientCfg']['zfsPath'] = '/sbin/zfs'
default['manatee']['sitter']['postgresMgrCfg']['zfsClientCfg']['zfsPort'] = 10_001
