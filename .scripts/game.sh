#!/bin/bash

pkill dunst
pkill compton
pkill polybar
systemctl stop --user an2linux.service
systemctl stop --user mpd.service
systemctl stop --user spotblock.service
systemctl stop bitlbee.service
sudo powertop
pkill urxvtd
