mkdir -p /var/lib/exhibitor
cat << EOH > /etc/env_vars
PORT=8181
CONFIG_TYPE="file"
FS_CONFIG_DIR="/var/lib/exhibitor"
NODE_IP="192.168.69.180"
PG_URL="tcp://postgres@\$NODE_IP:5432/postgres"
ZK_URL="\$NODE_IP:2181"
EOH
