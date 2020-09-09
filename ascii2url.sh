#!/bin/bash

function ascii2url {
	local text="$*"
	local out=
	for((i=0; i<${#text}; i++)); do
		c=${text:$i:1}
		case $c in
			[a-zA-Z0-9.~_-]) out+="$c" ;;
			*) out+=`printf '%%%02X' "'$c"` ;;
		esac
	done
	echo $out
}

ascii2url "$@"
