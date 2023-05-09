!#/bin/zsh

sudo mkdir -p /data/homeassistant
sudo mkdir -p /data/mqtt/data /data/mqtt/log /data/mqtt/config
sudo mkdir -p /data/zigbee2mqtt

sudo chmod -R 777 /data

cp data/mqtt/mosquitto.conf /data/mqtt/config
cp data/zigbee2mqtt/configuration.yaml /data/zigbee2mqtt
