#!/bin/bash

function url2ascii {
	local text="$*"
	local out=
	for((i=0; i<${#text}; i++)); do
		c=${text:$i:1}
		if [[ "$c" == "%" ]]; then
			out+="\x${text:$i+1:1}${text:$i+2:1}"
			let i+=2
		elif [[ "$c" == "+" ]]; then
			out+=" "
		else
			out+="$c"
		fi 
	done
	printf "${out}"
}

# easy way
function url2ascii {
  local input="${1//+/ }"
  printf '%b' "${input//%/\\x}"
}

url2ascii "$@"
