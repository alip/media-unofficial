#!/sbin/runscript
# Copyright 2011 Jakub M. Kopański <jkopansk@gmail.com>
# Distributed under the terms of the GNU General Public License v2

depend() {
    use net
    need mysql
}

start() {
    ebegin "Starting MediaTomb"
    start-stop-daemon --start --quiet \
    --pidfile /var/run/mediatomb.pid --exec /usr/bin/mediatomb -- \
    -c /etc/mediatomb/config.xml -u mediatomb -g mediatomb \
    -P /var/run/mediatomb.pid -l /var/run/mediatomb.log -m /var/lib -f mediatomb \
    -d
    eend $?
}

stop() {
    ebegin "Stopping MediaTomb"
    start-stop-daemon --stop --quiet --exec /usr/bin/mediatomb
    eend $?
}
