import nap
import strutils
import times
import protocol

let timer = use_arg(name="timer", kind="value", alt="t")
let r = use_arg(name="reason", kind="argument")
#let date = use_arg(name="date", kind="value", alt="d")
#date argument is here for future purposes

parse_args()

const infos = "\nRenimders made by dBasdk with nim.\nFor help use rmd --help."

if not timer.used:
    echo "You must set a valid timer with --timer."
    echo infos
else:
    let time = getSec(timer.value) + now().toTime().toUnix()
    if r.used:
        let reason = r.value & " " & join(argtail(), " ")
        addRmd(reason, time)
    else:
        echo "You must set a reason for your remind."
        echo infos
