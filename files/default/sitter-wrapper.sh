#!/bin/bash
set -a
source /etc/env_vars
/opt/manatee/update_config
nodejs /opt/manatee/sitter.js -f /etc/manatee/sitter.json
