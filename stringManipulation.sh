#!/bin/bash
#		 _
#	07	[|] 0ffensive 7ester
#
# GLP v3.0 by -07: https://github.com/OTsector

function substr {
	local text=$1
	local start=$2
	local end=$3
	if [ $start -lt 0 ] || [ $start -gt ${#text} ] || [ $start -gt $end ]; then
		echo ""; exit
	fi
	output=""
	for ((i=$start; i<$end; i++)); do
		output+=${text:$i:1}
	done
	echo $output
}

function strpos {
	local haystack=$1
	local needle=$2
	for ((i=0; $i<${#haystack}; i++ )); do
		if [[ $(substr "$haystack" $i $(($i+${#needle}))) == $needle ]]; then
			echo $i; exit
		fi
	done
	echo 0
}

