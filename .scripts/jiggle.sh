#!/bin/env bash
user_interrupt(){
	echo -e "\\n\\nKeyboard Interrupt detected. Exiting...\\n"
	exit
}
trap user_interrupt SIGINT
trap user_interrupt SIGTSTP
clear
toilet --metal -f sblood -t Jiggling...
while true
do
	xte 'mousermove 1 1'
	sleep 1m
	xte 'mousermove -1 -1'
	sleep 1m
done
