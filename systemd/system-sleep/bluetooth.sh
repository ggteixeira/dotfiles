#!/usr/bin/bash

if [[ $1 == "pre" ]]
then
    /usr/sbin/rfkill block bluetooth
elif [[ $1 == "post" ]]
then
    /usr/sbin/rfkill unblock bluetooth
fi
