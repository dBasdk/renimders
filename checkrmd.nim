import os
import osproc
import protocol
import times
import strutils

var c = 0

while true:
    let file = open(getHomeDir() & "/.rmds/rmds")
    c = 0
    for i in file.readAll().splitLines():
        if i== "":
            continue
        let infos = i.rsplit(" ~ ", 1)
        #echo infos
        let timer = infos[1].parseInt()
        if timer < now().toTime().toUnix():
            discard execCmd("notify-send -t=10 " & infos[0])
            rmRmd(c)
        c = c+1
    sleep(5000)
    
