#!/usr/bin/env bash

echo "Compton?"
read -r -p " " yn
case $yn in
	[Yy]* ) exec compton &;;
esac

echo "Dunst?"
read -r -p " " yn
case $yn in
	[Yy]* ) exec dunst &;;
esac

echo "Polybar?"
read -r -p " " yn
case $yn in
	[Yy]* ) exec polybar herb &;;
esac

echo "an2linux?"
read -r -p " " yn
case $yn in
	[Yy]* ) systemctl start --user an2linux.service;;
esac

echo "mpd?"
read -r -p " " yn
case $yn in
	[Yy]* ) systemctl start --user mpd.service;;
esac

echo "mopidy?"
read -r -p " " yn
case $yn in
	[Yy]* ) systemctl start --user mopidy.service;;
esac

echo "bitlbee?"
read -r -p " " yn
case $yn in
	[Yy]* ) systemctl start bitlbee.service;;
esac

urxvtd -q -f -o &
