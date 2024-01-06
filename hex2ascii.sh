#!/bin/bash

function hex2ascii {
	local inputString="$1"

inputString=${inputString//\\x/}

	for((i=0; i<${#inputString}; i+=2)); do
		out+="\x${inputString:$i:2}"
	done
	echo -e $out
}

hex2ascii "$@"

