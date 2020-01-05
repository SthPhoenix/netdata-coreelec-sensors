#! /bin/bash

REPO=https://raw.githubusercontent.com/SthPhoenix/netdata-coreelec-sensors/master

curl $REPO/run_netdata.sh --create-dirs -o netdata/run_netdata.sh
curl $REPO/assets/charts.d.conf --create-dirs -o netdata/assets/charts.d.conf
curl $REPO/assets/main.js --create-dirs -o netdata/assets/main.js
curl $REPO/assets/loopsleepms.sh.inc --create-dirs -o netdata/assets/loopsleepms.sh.inc

touch netdata/assets/.opt-out-from-anonymous-statistics

cd netdata
bash run_netdata.sh
