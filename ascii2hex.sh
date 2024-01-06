#!/bin/bash

function ascii2hex {
	local inputString="$1" buf= hex= int= out=
	for ((i=0; i<${#inputString}; i++)); do
			char="${inputString:$i:1}"
			hex=$(printf "%04x" "'$char")
			int="$((0x$hex))"
			if ((int >= 0 && int <= 0x7F)); then
				buf+=$(printf '%02x' "$int")
			elif ((int >= 0x80 && int <= 0x7FF)); then
				buf+=$(printf '%02x%02x' $((0xC0 | ((int >> 6) & 0x1F))) $((0x80 | (int & 0x3F))))
			elif ((int >= 0x800 && int <= 0xFFFF)); then
				buf+=$(printf '%02x%02x%02x' $((0xE0 | ((int >> 12) & 0x0F))) $((0x80 | ((int >> 6) & 0x3F))) $((0x80 | (int & 0x3F))))
			fi
	done
	for((i=0; i<${#buf}; i+=2)); do
		out+="\x${buf:$i:2}"
	done
	echo $out
}

ascii2hex "$@"
