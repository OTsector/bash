#!/bin/bash

function ascii2url {
	local inputString="$1" buf= hex= int= out=
	for ((i=0; i<${#inputString}; i++)); do
		char="${inputString:$i:1}"
		hex=$(printf "%04X" "'$char")
		int="$((0x$hex))"
		if ((int >= 0x30 && int <= 0x39)) \
			|| ((int >= 0x41 && int <= 0x5A)) \
			|| ((int >= 0x61 && int <= 0x7A)); then
			out+=$char
		elif ((int >= 0x80 && int <= 0x7FF)); then
			buf=$(printf '%02X%02X' $((0xC0 | ((int >> 6) & 0x1F))) $((0x80 | (int & 0x3F))))
			for((j=0; j<${#buf}; j+=2)); do
				out+="%${buf:$j:2}"
			done
		elif ((int >= 0x00 && int <= 0x7F)); then
			buf=$(printf '%02X' $((int)))
			for((j=0; j<${#buf}; j+=2)); do
				out+="%${buf:$j:2}"
			echo buf $buf char: $char
			done
		elif ((int >= 0x800 && int <= 0xFFFF)); then
			buf=$(printf '%02X%02X%02X' $((0xE0 | ((int >> 12) & 0x0F))) $((0x80 | ((int >> 6) & 0x3F))) $((0x80 | (int & 0x3F))))
			for((j=0; j<${#buf}; j+=2)); do
				out+="%${buf:$j:2}"
			done
		fi
	done
	echo $out
}

ascii2url "$@"
