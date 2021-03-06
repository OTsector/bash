#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 
	exit 1
fi

if ! [ -f /usr/bin/updatedb ] || ! [ -f /usr/bin/locate ] || ! [ -f /usr/bin/bc ]; then
	echo "ERROR: for using this tool you need to install and setup \"updatedb\", \"locate\", \"bc\""
	return 1
fi

# https://github.com/OTsector/bash/blob/master/rand.sh
function rand {
	local length=$2
	local string="$1"
	local output=
	for((i=0;i<$length;i++));do
		output+=${string:$[$RANDOM % ${#string}]:1}
	done
	echo $output
}

temp="/tmp/."$(rand 0123456789abcdefghjklmnopqrstuvwxyz 10)

echo "INFO: updating database"
updatedb

echo "INFO: searching files and directories"
locate cache|grep 'cache/'|sed 's/cache\/.*/cache\//g;/\/usr\/share\//d;/\/opt\//d'|sort|uniq > $temp

while read path; do rm -rf "$path"*; done < $temp

out=$(
	while read path; do
		du -sb "$path"|awk '{print $1}'
	done < $temp|tr "\n" " "|rev|cut -c 2-|rev \
		|echo "("$(tr " " "+")")/1024/1024"|echo "INFO: "$(bc)" (MB) - deleted"
)

while read path; do rm -rf "$path"*; done < $temp

echo $out

rm -rf $temp
