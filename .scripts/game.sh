#!/bin/bash

pkill dunst
pkill compton
pkill polybar
systemctl stop --user an2linux.service
systemctl stop --user mpd.service
systemctl stop --user mopidy.service
systemctl stop bitlbee.service
pkill urxvtd
