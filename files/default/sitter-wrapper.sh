#!/bin/bash
set -a
. /etc/env_vars
/opt/manatee/bin/update_config
nodejs /opt/manatee/sitter.js -f /etc/manatee/sitter.json
