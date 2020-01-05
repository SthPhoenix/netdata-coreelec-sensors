#! /bin/bash
name='netdata'
DOCKERIMAGE='netdata/netdata'
P_port=19999
ASSETS=$PWD/assets

if [ -f /storage/.cache/timezone ]; then
 . /storage/.cache/timezone
else
 TIMEZONE="America/New_York"
fi

docker stop $name
docker rm $name
docker run -d --name=$name \
           -e TZ=$TIMEZONE \
           -p $P_port:19999 \
           -v /proc:/host/proc:ro \
           -v /sys:/host/sys:ro \
           -v /var/run/docker.sock:/var/run/docker.sock:ro \
           -v $ASSETS/main.js:/usr/share/netdata/web/main.js:ro \
           -v $ASSETS/charts.d.conf:/etc/netdata/charts.d.conf:ro\
           -v $ASSETS/loopsleepms.sh.inc:/usr/lib/netdata/plugins.d/loopsleepms.sh.inc:ro\
           -v $ASSETS/.opt-out-from-anonymous-statistics:/etc/netdata/.opt-out-from-anonymous-statistics:ro\
           --cap-add SYS_PTRACE \
           --security-opt apparmor=unconfined \
           --restart unless-stopped \
           --hostname=$HOSTNAME \
           $DOCKERIMAGE

