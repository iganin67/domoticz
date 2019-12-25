# Domoticz
Docker for Domoticz (an open source home automation system) including 1wire/owfs support.

Domoticz - http://www.domoticz.com/

Based on the latest stable version of Domoticz. The docker exposes logs, backups, scripts and plugin folders to the host. The docker is customised for my own Domoticz setup.
Added support 1wire vai owfs including the cron task to check is DS9404 is recable by checking the file presents (/mnt/1wire/81.74AD30000000) 


sudo docker run -d "\"
  --network host \
  -v /volume1/docker/domoticz/config:/config \
  -v /volume1/docker/domoticz/plugins:/opt/domoticz/plugins \
  -v /volume1/docker/domoticz/backups:/opt/domoticz/backups \
  -v /volume1/docker/domoticz/scripts:/opt/domoticz/scripts \
  -v /etc/localtime:/etc/localtime:ro \
  --privileged -v /dev/bus/usb:/dev/bus/usb \ 
  --name=<container name> \ 
iganin67/domoticz:$VERSION
