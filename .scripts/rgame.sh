#!/bin/bash

echo "Compton?"
read -p " " yn
case $yn in
	[Yy]* ) exec compton &;;
esac

echo "Dunst?"
read -p " " yn
case $yn in
	[Yy]* ) exec dunst &;;
esac

echo "Polybar?"
read -p " " yn
case $yn in
	[Yy]* ) exec polybar example &;;
esac

echo "an2linux?"
read -p " " yn
case $yn in
	[Yy]* ) systemctl start --user an2linux.service;;
esac

echo "mpd?"
read -p " " yn
case $yn in
	[Yy]* ) systemctl start --user mpd.service;;
esac

echo "spotblock?"
read -p " " yn
case $yn in
	[Yy]* ) systemctl start --user spotblock.service;;
esac

echo "bitlbee?"
read -p " " yn
case $yn in
	[Yy]* ) systemctl start bitlbee.service;;
esac

urxvtd -q -f -o &
