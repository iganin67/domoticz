#!/bin/bash

# Start the first process: owfs
/usr/lib/owfs/owfs -c /etc/owfs.conf -C -uall -m /mnt/1wire  &&
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start 'owfs': $status"
  exit $status
fi


# Setup a cron schedule
echo "* * * * * /owcheck.sh >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
cron -f &



# Start the second process: domoticz
/opt/domoticz/domoticz -dbase /config/domoticz.db -log /config/domoticz.log -www 8084 -sslwww 0
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start 'domoticz': $status"
  exit $status
fi

