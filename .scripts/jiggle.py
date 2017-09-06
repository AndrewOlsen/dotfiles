#!/usr/bin/env python
from subprocess import call
from pymouse import PyMouse
from time import sleep

colors = ["CC0033", "FF6633", "FFFF00", "00CC00",
          "3399FF", "0000CC", "6600FF"]
m = PyMouse()
call('tput civis', shell=True)
while(True):
    for c in colors:
        print("\033]11;#{0}\007".format(c))
        print("\033]708;#{0}\007".format(c))
        x, y = m.position()
        m.move(x+1, y+1)
        m.move(x-1, y-1)
        sleep(10)
