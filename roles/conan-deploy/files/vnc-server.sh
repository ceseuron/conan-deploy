#!/bin/sh
export PATH="/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin"
agent_user=conan_agent

start() {
    echo -n "Starting VNC Server: "
    su -c "vncserver :1 -geometry 800x600 -depth 24" $agent_user
    RETVAL=$?
    return $RETVAL
}

stop() {
    echo -n "Stopping VNC Server: "
    su -c "vncserver -kill :1 >/dev/null 2>&1" $agent_user
    RETVAL=$?
    return $RETVAL
}

case "$1" in
    start)
    start
    RETVAL=$?
    ;;
    stop)
    stop
    RETVAL=$?
    ;;
    restart)
    stop
    sleep 1
    start
    RETVAL=$?
    ;;
    condrestart)
    stop
    sleep 1
    start
    ;;
    status)
    status $service
    RETVAL=0
    ;;
    *)
    echo "Usage: $service {start|stop|restart|condrestart|status}"
    RETVAL=1
    ;;
esac

exit $RETVAL
