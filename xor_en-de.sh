#!/bin/bash

function ascii2dec {
	printf '%d' "'$1"
}
function hex2ascii {
	str=$1
	for((i=-2; i<${#str}-2; i+=2)); do
		c=${str:$i+2:2}
		printf "\x$c"
	done
}
function xoren {
# source: https://stackoverflow.com/questions/2960136/bitwise-xor-a-string-in-bash#37313472
local key=$1 str=$2
local ptr out val1 val2
for ((ptr=0; ptr < ${#str}; ptr++)); do
	val1=$(ascii2dec "${str:$ptr:1}")
	val2=$(ascii2dec "${key:$(( ptr % ${#key} )):1}")
	out+=$(printf '%02x' "$(( val1 ^ val2 ))")
done
printf '%s\n' "$out"
}
function xorde {
	xoren "$1" "$2"
}
function xorenascii {
	hex2ascii "$(xoren $1 $2)"
}
function xordeascii {
	hex2ascii "$(xorde $1 `printf $2`)"
}

key="$1"
string="$2"

echo xoren: `xoren "$key" "$string"`
echo xorde: `xorde "$key" "$(xoren "$key" "$string")"`
echo xoren2ascii: `xorenascii "$key" "$string"`
echo xorde2ascii: `xordeascii "$key" "$(xorenascii "$key" "$string")"`

