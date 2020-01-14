#!/bin/bash
cd

if [ -n "$DRUID_BROKER_URL" ]; then
  echo "Arguments provided: DRUID_BROKER_URL = $DRUID_BROKER_URL"
  # User is supplying broker URL
  echo "About to execute:turnilo --druid ${DRUID_BROKER_URL} "
  turnilo --druid ${DRUID_BROKER_URL}
else
  # No arguments supplied; Making an assumption that Druid is running at the linked container druid_host and default port
  echo "About to execute:turnilo --druid http://druid_host:8082"
  turnilo --druid http://druid_host:8082
fi
