#!/bin/bash


pihole_FTL='/etc/pihole/pihole-FTL.db'

if [ $# -lt 1 ]; then
	echo "use: $0 [domain]"; exit 1
fi

domain="$1"


echo "DATE, DOMAIN, IP, MAC, VENDOR"
sqlite3 "$pihole_FTL" <<< "SELECT client, domain, timestamp FROM queries WHERE domain == '"$domain"';"|sort -u \
	|awk -F '|' '{print $1" "$2" "$3}'|while read ip domain timestamp; do
		echo $ip $domain $timestamp
	done \
		|while read ip domain timestamp; do
			sqlite3 "$pihole_FTL" <<< "SELECT network_id FROM network_addresses WHERE ip == '"$ip"';" \
				|while read id; do
					echo $id $ip $domain $timestamp
				done
		done|sort -u \
		|while read id ip domain timestamp; do
			sqlite3 "$pihole_FTL" <<< "SELECT hwaddr, macVendor FROM network WHERE id == '"$id"';" \
				|sed 's/\ /\\ /g'|awk -F '|' '{print $1" "$2}'|while read mac vendor; do
					echo "\"$(date -d @$timestamp)\", \"$domain\", \"$ip\", \"$mac\", \"$vendor\""
				done
		done|sort -u

