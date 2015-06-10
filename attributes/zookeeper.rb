default['zookeeper']['dist_url'] = 'http://www.apache.org/dist/zookeeper'
default['zookeeper']['version'] = '3.4.6'

default['exhibitor']['dist_url'] = 'https://github.com/Netflix/exhibitor/archive'
default['exhibitor']['version'] = '1.5.4'

# Set this to hostname Exbhibitor UI will be available at
# default['exhibitor']['hostname'] = 'exhibitor.hostname.com'

# If these are set they will be used when launching Exhibitor
# Otherwise the IAM role will be used.
# default['exhibitor']['s3']['access_key'] = 'access_key_id'
# default['exhibitor']['s3']['secret_key'] = 'secret_key_id'

default['exhibitor']['s3']['region'] = 'ap-southeast-2'
default['exhibitor']['s3']['key'] = 'exhibitor'

default['exhibitor']['defaults']['zookeeper-data-directory'] = '/opt/zookeeper/snapshots'
default['exhibitor']['defaults']['zookeeper-install-directory'] = '/opt/zookeeper'
default['exhibitor']['defaults']['zookeeper-log-directory'] = '/opt/zookeeper/transactions'
default['exhibitor']['defaults']['log-index-directory'] = '/opt/zookeeper/transactions'
default['exhibitor']['defaults']['cleanup-period-ms'] = 300_000
default['exhibitor']['defaults']['check-ms'] = 30_000
default['exhibitor']['defaults']['backup-period-ms'] = 600_000
default['exhibitor']['defaults']['client-port'] = 2181
default['exhibitor']['defaults']['cleanup-max-files'] = 20
default['exhibitor']['defaults']['backup-max-store-ms'] = 21_600_000
default['exhibitor']['defaults']['connect-port'] = 2888
# default['exhibitor']['defaults']['backup-extra'] = "throttle\=&bucket-name\=#{node['exhibitor']['s3']['bucket']}&key-prefix\=#{node['exhibitor']['s3']['key']}&max-retries\=4&retry-sleep-ms\=30000"
default['exhibitor']['defaults']['observer-threshold'] = 0
default['exhibitor']['defaults']['election-port'] = 3888
# default['exhibitor']['defaults']['zoo-cfg-extra'] = 'tickTime\=2000&initLimit\=10&syncLimit\=5&quorumListenOnAllIPs\=true'
default['exhibitor']['defaults']['auto-manage-instances-settling-period-ms'] = 0
default['exhibitor']['defaults']['auto-manage-instances'] = 1
