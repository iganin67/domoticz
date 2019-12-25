#!/bin/bash
#  check if DS9404 is connected, if not restart owfs


if [ -d "/mnt/1wire/81.74AD30000000" ] 
then
    echo "Directory /path/to/dir exists." 
else
    echo "Error: Directory /path/to/dir does not exists."
    PID=`ps -eaf | grep owfs | grep -v grep | awk '{print $2}'`
    if [[ "" !=  "$PID" ]]; then
       echo "killing owfs"
       kill -9 $PID
    fi
    sleep 2
    /usr/lib/owfs/owfs -c /etc/owfs.conf -C -uall -m /mnt/1wire 
fi

