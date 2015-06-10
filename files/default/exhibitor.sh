#!/bin/bash
. /etc/env_vars
if [[ $CONFIG_TYPE == "s3" ]]; then
  if [[ -n ${AWS_ACCESS_KEY_ID} ]]; then
    exec java -jar /opt/exhibitor/exhibitor.jar \
      --port ${PORT} --defaultconfig /opt/exhibitor/defaults.conf \
      --configtype s3 --s3config ${S3_BUCKET}:${S3_PREFIX} \
      --s3credentials /opt/exhibitor/credentials.properties \
      --s3region ${S3_REGION} --s3backup true --hostname ${HOSTNAME}
  else
    exec java -jar /opt/exhibitor/exhibitor.jar \
      --port ${PORT} --defaultconfig /opt/exhibitor/defaults.conf \
      --configtype s3 --s3config ${S3_BUCKET}:${S3_PREFIX} \
      --s3region ${S3_REGION} --s3backup true --hostname ${HOSTNAME}
  fi
elif [[ $CONFIG_TYPE == "file" ]]; then
    exec java -jar /opt/exhibitor/exhibitor.jar \
      --port ${PORT} --defaultconfig /opt/exhibitor/defaults.conf \
      --configtype file  --fsconfigdir ${FS_CONFIG_DIR} \
      --hostname ${HOSTNAME}
fi
