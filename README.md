# netdata-coreelec-sensors
Monitoring SBC temperature in CoreElec with [Netdata](https://www.netdata.cloud/) in Docker

![Netdata screenshot](netdata.PNG)

# About

This script is based on [LinuxServer.io](http://linuxserver.io) shell script from [libreelec-addon-repo](https://github.com/linuxserver/libreelec-addon-repo/tree/master/docker.linuxserver.netdata).

Script was modified to mount additional config files allowing temperature monitoring on SBC's like Khadas VIM3 and Raspberry Pi.
Modifications are based on following sources:
1. [Netdata for IoT](https://docs.netdata.cloud/docs/netdata-for-iot/) for activating temperature sensors
2. [CoreElec HW monitor](https://discourse.coreelec.org/t/coreelec-hw-monitor) discussion ( thanks to Martynet,  relkai and Uukrul for scripts and hints)
3. [Anonymous Statistics](https://github.com/netdata/netdata/blob/master/docs/anonymous-statistics.md) page for disabling statistics.

# Requirements

1. SBC running CoreElec OS.
2. Installed CoreElec Docker service.

# How to run

1. SSH into your CoreElec device:
   ```
   ssh root@YOUR.COREELEC.IP
   ```
   and enter your root password
2. Under SSH session execute:
   ```
   wget https://raw.githubusercontent.com/SthPhoenix/netdata-coreelec-sensors/master/install.sh
   ```
   to download install script.
3. Execute downloaded script:
   ```
   bash install.sh
   ```
4. Open `http://YOUR.COREELEC.IP:19999` in your browser, enjoy!
   
 Executing this script will create new directory `netdata`, download all required files into it and execute `run_netdata.sh`.
 `run_netdata.sh` will stop and remove existing `netdata` docker containers and start new one with mounted config files.
 
 If you want to disable Netdata anonymous statistics manualy add mount `-v $ASSETS/.opt-out-from-anonymous-statistics:/etc/netdata/.opt-out-from-anonymous-statistics:ro\` to `run_netdata.sh` file and execute it.
 
 # Notes
 
 1. Script was tested on CoreELEC-Amlogic-ng.arm-9.2-nightly_20200103 build, but should work on other Amlogic builds too.
 2. Script was tested on Khadas VIM3 Pro SBC, but should work on other Amlogic devices.
 3. File `main.js` is responsible for drawing temperature gauge on main dashboard and is based on file from Netdata v1.19.0-238, modification of this file might be required for future versions of Netdata
