#!/bin/bash

function hex2ascii {
	local out= inputString="${1//\\x}"
	inputString="${inputString//0x}"
	inputString="${inputString// }";

	for((i=0; i<${#inputString}; i+=2)); do
		out+="\x${inputString:$i:2}"
	done
	echo -e $out
}

hex2ascii "$@"

