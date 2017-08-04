#/bin/bash

echo Changing Brightness to: $1

# get neme of connected monitors
MONITORS=$(xrandr -q | grep " connected" | awk '{print $1}')

echo $MONITORS

for  m in $MONITORS
do
    echo Cahnging $m
    $(xrandr --output $m --brightness $1)
done
