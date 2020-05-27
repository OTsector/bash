#!/bin/bash

# based on: https://www.geeksforgeeks.org/permute-string-changing-case/

function permute {
	local input="$1"
	local n=${#input}
	local max=$((1 << $n))
	local combination=
	input=${input,,}

	for((i=0; i<$max; i++)); do
		combination="$input";
		for((j=0; j<$n; j++)); do
			if [ $((($i >> $j) & 1)) -eq 1 ]; then
				upper="${input:$j:1}"; upper=${upper^^}
				combination="${combination:0:$j}$upper${combination:$j+1}"
					
			fi
		done	
		printf "$combination "
	done

}

permute "abc"

