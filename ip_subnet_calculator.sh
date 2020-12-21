#!/bin/bash

function ip2long {
	awk -F '.' '{printf "%d\n", ($1 * 2^24) + ($2 * 2^16) + ($3 * 2^8) + $4}' <<< "$1"
}

function long2ip {
	local ip dec="$1"
	for e in {3..0}; do
		((octet = dec / (256 ** e) ))
		((dec -= octet * 256 ** e))
		[ $e -eq 0 ] && delim='' || delim="."
		ip+=$octet$delim
	done
	printf '%s\n' "$ip"
}
	
ip2long 192.168.100.2
long2ip 3232261122
