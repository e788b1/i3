#!/bin/bash
#
while true
do
    BGCOLOR=`printf '#%06X\n' $(($RANDOM * 512))`
    # BGCOLOR=`shuf -i 1-16777215 -n 1`
    echo "Set backgroud color $BGCOLOR"
    hsetroot -solid $BGCOLOR
    sleep 300
done
