#!/usr/bin/env sh
MyCommand=${COMMAND:="echo $ADDR"}

./detect-new-ip6 eth0 | while read ADDR; do
    eval $MyCommand
done