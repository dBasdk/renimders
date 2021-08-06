import json
import os
import strutils

let units = parseJson("""{
    "y": 31536000,
    "w": 604800,
    "d": 86400,
    "h": 3600,
    "m": 60,
    "s": 1
}
""")

const infos* = "\nRenimders made by dBasdk with nim.\nFor help use rmd --help."

proc isNumeric*(str:string) : bool =
    try:
        discard str.parseFloat()
        result = true
    except ValueError:
        result = false

proc getSec*(str:string) : int = 
    let unit = $str[^1]
    let n = $str[0..^2]
    let mult = units{unit}.getInt()
    if not n.isNumeric() or mult == 0:
        echo "Your timer looks like is not in a correct format"
        echo infos
        quit(1)
    else:
        return n.parseInt()*mult

proc addRmd*(reason : string, time : int64) = 
    let file = open(getHomeDir() & "/.rmds/rmds", fmAppend)
    file.writeLine(reason & " ~ " & $time)
    file.close()

proc rmRmd*(line : int) =
    var file = open(getHomeDir() & "/.rmds/rmds", fmRead)
    let l = file.readAll().splitLines()
    var list : seq[string] = @[]
    file.close()
    file = open(getHomeDir() & "/.rmds/rmds", fmWrite)
    for k, i in l:
        if k!=line:
            list.add(i)
    for i in list:
        if i == "":
            continue
        file.writeLine(i)
    file.close()
