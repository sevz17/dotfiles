#!/bin/sh

set -e
fifoname="/tmp/dwltags-$1";

title=""
taginfo="0 0"
isactive="0"
layout=""
ctags="0"
mtags="0"
outclass="inactive"

if [ ! -p "$fifoname" ]
then
        mkfifo "$fifoname"
fi




while true
do

	line=`cat <$fifoname`

	dtype=`echo $line | cut -d ' ' -f 1`


	case "$dtype" in
		title)
			title=`echo $line | cut -s -d ' ' -f 2-`
			;;

		tags)
			taginfo=`echo $line | cut -d ' ' -f  2-`
			;;

		selmon)
			isactive=`echo $line | cut -d ' ' -f 2`
			;;

		layout)
			layout=`echo $line | cut -d ' ' -f 2-`
			;;
	esac




    ctags=`echo "$taginfo" | cut -d ' ' -f 1`

    mtags=`echo "$taginfo" | cut -d ' ' -f 2`

    outstring=""

    for i in {0..9};
    do

        mask=$((1<<i))
        if (( "$ctags" & $mask ));
        then
            n="*$((i+1))"
        else
            n=" $((i+1))"
        fi
        if (( "$mtags" & $mask ));
        then
            outstring="$outstring[$n]"
        else
            outstring="$outstring $n "
        fi
    done
    outstring="$outstring $layout $title"

	if [ $isactive -eq 1 ]
	then
		outclass='active'
	else
		outclass='inactive'
	fi

    #GTK CSS doesn't do left alignment, so we have to pad to make it constant width.
    #135 looks good on my system, change it to adjust the size of the module on the bar.
    #Remove if you want the text of the module centered, or change %-ns to %ns for right align.
    outstring=`printf "%-135s" "$outstring"`

    echo "{\"text\":\"$outstring\", \"class\":\"$outclass\"}"

done
