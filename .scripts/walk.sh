#!/usr/bin/env bash
# Simple reminder program to minimize sitting
#
# Example: walk.sh 30
# This will count down 30 minutes and send a notification.

user_interrupt(){
	tput cnorm
        exit
}
trap user_interrupt SIGINT
trap user_interrupt SIGTSTP
#https://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal
function countdown(){
   date1=$(date +%s)
   date1=$((date1 + $1)); 
   while [ "$date1" -ge "$( date +%s )" ]; do 
     echo -ne "$(date -u --date @$((date1 - $( date +%s ))) +%H:%M:%S)\\r";
     sleep 0.1
   done
}

if [[ $# == 0 ]]; then
	echo "usage: walk.sh [minutes]"
	echo "error: specify an amount of time"
	exit 1
fi

clear
tput civis

while :;
do
	countdown $(($1*60))
	notify-send "Walk It Out" "It's time to get up and move around."
	mpv --no-vid "$HOME/Music/tracker/my_dirty_old_kamel.wav" --really-quiet --loop
	read -r -n "1" -p "Restart? " "answer"
	if [ "$answer" == "n" ]; then
		tput cnorm
		exit 0
	fi
	printf "\\n"
done
