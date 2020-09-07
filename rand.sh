#!/bin/bash

function rand {
	[ $# -lt 2 ] && { echo "use: [string] [length]";return 1; }
	local s=$2
	local a="$1"
	local b=
	for((i=0;i<$s;i++));do
		b+=${a:$[$RANDOM % ${#a}]:1}
	done
	echo $b
}

rand "$1" $2
