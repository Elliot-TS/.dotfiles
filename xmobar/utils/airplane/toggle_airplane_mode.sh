#!/bin/bash

am=$(cat airplane_mode)
if [[ $am == "off" ]]
then
    echo "on" > airplane_mode
    rfkill block all
else
    echo "off" > airplane_mode
    rfkill unblock all
fi
