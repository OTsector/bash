#!/bin/bash

if [[ $# < 2 ]]; then
	echo -e "usage: ./script.sh [website] [threads]"; exit 1
fi

url=$1
threads=$2
counter=0
while [[ true ]]; do

	function request {
		echo done with status code: $(curl $url -s -w "%{http_code}" -o /dev/null)
	}

		echo "building threads..."
		for (( i = 1; i <= $threads; i++ )); do
			request &
		done
		wait

		let counter=$counter+$threads
		echo sent: $counter request

done
exit 0
