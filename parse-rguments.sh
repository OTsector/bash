#!/bin/bash

function help {
	echo -e "usage: ./parse-rguments.sh [options...] <input>\noptions:"
	echo -e "-h, --hostname \tfor set hostname"
	echo -e "-p, --port \tfor set port file"
	echo -e "-m, --method \tfor set method [get/post]"
	exit 1
}

if [[ ! $* =~ "-" ]]; then
	help
fi

while [ "$#" -gt 0 ]; do
	case "$1" in
		-h) hostname="$2"; shift 1;;
		-p) port="$2"; shift 1;;
		-m) method="$2"; shift 1;;
		--hostname) hostname="$2"; shift 1;;
		--port) port="$2"; shift 1;;
		--method) method="$2"; shift 1;;
		-*) help;;
		*) shift 1;;
	esac
done

echo -e "hostname: $hostname\nport: $port\nmethod: $method"

exit 0

