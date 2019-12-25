
FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y unzip \
        libssl1.0.0 \
	owfs \
	nano \
        libudev-dev libusb-0.1-4 \
        curl libcurl4 libcurl4-gnutls-dev \
        cron \
        speedtest-cli \
        libpython3.7-dev


COPY domoticz/ /opt/domoticz/
COPY start.sh /start.sh
COPY owcheck.sh /owcheck.sh
WORKDIR /opt/domoticz

RUN chmod +x ./domoticz
RUN chmod +x /start.sh
RUN chmod +x /owcheck.sh
RUN mkdir -p /mnt/1wire
RUN mkdir -p /opt/domoticz/config


EXPOSE 8084 6144 1443 9898

VOLUME docker/domoticz/config /config
VOLUME docker/domoticz/plugins /opt/domoticz/plugins
VOLUME docker/domoticz/scripts /opt/domoticz/scripts
VOLUME docker/domoticz/backups /opt/domoticz/backups


CMD [ "/start.sh" ]
