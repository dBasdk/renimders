if ! type nim 2>/dev/null;then
	echo "need to install nim"
	exit 1
else
	echo "nim ok"
fi

if ! type notify-send 2>/dev/null;then
	echo "need to install libnotify"
	exit 1
else
	echo "libnotify ok"
fi


mkdir ~/.rmd;
touch ~/.rmd/rmds;

nim c renimders.nim; 
nim c checkrmd.nim;

