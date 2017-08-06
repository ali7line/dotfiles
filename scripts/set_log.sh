#!/bin/bash
if [[ ! -d $HOME/log  ]]; then
    echo "Adding log dir"
    mkdir $HOME/log
fi

if [[ ! -e $HOME/log/host_ping.log ]]; then
    echo "Adding host_ping.log"
    touch $HOME/log/host_ping.log
fi
