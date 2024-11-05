#!/bin/bash

# Warna untuk output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Log function
log() {
    echo -e "${2:-$YELLOW}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

# Status check
status_check() {
    if systemctl is-active --quiet o11; then
        log "O11 service is running" "$GREEN"
        systemctl status o11
    else
        log "O11 service is not running" "$RED"
        return 1
    fi
}

# Service setup
setup() {
    log "Setting up O11 service..."
    systemctl daemon-reload
    systemctl enable o11
    log "Service setup completed" "$GREEN"
}

# Start service
start() {
    log "Starting O11 service..."
    systemctl start o11
    sleep 2
    status_check
}

# Stop service
stop() {
    log "Stopping O11 service..."
    systemctl stop o11
    sleep 2
    status_check
}

# Restart service
restart() {
    log "Restarting O11 service..."
    systemctl restart o11
    sleep 2
    status_check
}

# Show logs
logs() {
    log "Service Log:"
    tail -n 50 /var/log/o11/service.log
    echo ""
    log "Error Log:"
    tail -n 50 /var/log/o11/error.log
}

# Main
case "$1" in
    setup)
        setup
        ;;
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    status)
        status_check
        ;;
    logs)
        logs
        ;;
    *)
        echo "Usage: $0 {setup|start|stop|restart|status|logs}"
        exit 1
        ;;
esac

exit 0
