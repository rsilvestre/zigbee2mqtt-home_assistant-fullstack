# Create zigbee2mqtt / mqtt / homeassistant stack with docker-compose on Raspberrypi

## Explain

The stack is using zigbee2mqtt, mosquitto and home assistant.

I find inspiration in [that tutorial](https://www.zigbee2mqtt.io/guide/installation/02_docker.html)

## Pre requisit

### Install docker and docker-compose

By following [this tutorial](https://dev.to/elalemanyo/how-to-install-docker-and-docker-compose-on-raspberry-pi-1mo)

```shell
sudo apt-get update && sudo apt-get upgrade
curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker ${USER}
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose
sudo systemctl enable docker
sudo systemctl start docker
```

### Have a zigbee dongle

My favorite : [Zonoff ZBDongle-E](https://www.sonoff.be/a-69235043/zigbee-modules/sonoff-zigbee-3-0-dongle-plus-e/#description)

But [pay attention](https://haade.fr/fr/blog/zb-dongle-p-vs-zb-dongle-e-zigbee-sonoff) that there is the Plus-E and the Plus-P where the last one is an older version of the dongle that not support Matter protocole


## Collect information before to deploy

### user and group id

As we user a rootless user to install zigbee2mqtt, we need some user informations

```shell
id -u ${USER}
id -g ${USER}
```

### Edit zigbee2mqtt config file

open the file in docker-compose.yaml and replace in environment section TZ=Europe/Brussels by [your timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

### Find your devices

Find and replace the device in docker-compose.yaml

```shell
ls -alh /dev/serial/by-id
```

Replace /dev/serial/by-id/**zigbee_dongle**:/dev/ttyACM0

## Install

Execute the script create_directory.sh

```shell
./create_directories.sh
```

Get images

```shell
docker-compose pull
```

## Start

```shell
docker-compose up -d
```



## Conclusion

Enjoy
