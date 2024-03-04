#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'

NC='\033[00m'

log() {
    script_shell="$(readlink /proc/$$/exe | sed "s/.*\///")"
    if [ "${script_shell}" = "bash" ]; then
        echo -e "$1$2${NC}"
    else
        echo "$1$2${NC}"
    fi
}

warn() {
    log $YELLOW "$1"
}

start() {
    log $GREEN "$1"
}

finish() {
    SELECTED_COLOR="$RED"
    if [ "$2" -eq "0" ]; then
        SELECTED_COLOR="$GREEN"
    fi

    log $SELECTED_COLOR "$1"
    echo ""
}