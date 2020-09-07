#!/bin/bash

function rand {
	[ $# -lt 2 ] && { echo "use: [string] [length]";return 1; }
	local length=$2
	local string="$1"
	local output=
	for((i=0;i<$length;i++));do
		output+=${string:$[$RANDOM % ${#string}]:1}
	done
	echo $output
}

rand "$1" $2
