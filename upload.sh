#!/bin/bash

function upload {
  if [ ! -f "$1" ]; then
  	echo "ERROR: file not found"; return 1
  fi
	local file="$1"
	local size=$(wc -c < "$file")
	for i in {1..5}; do
		data=$(
			pc curl -sLgk 'https://file.io/' \
				-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:76.0.1) Gecko/20100101 Firefox/76.0.1' \
				-H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.file.io/' \
				-H 'X-Requested-With: XMLHttpRequest' -H 'Cache-Control: no-cache' -H 'Origin: https://www.file.io' \
				-H 'Connection: keep-alive' -H 'Pragma: no-cache' -H 'TE: Trailers' \
				-X POST -F "qqtotalfilesize=$size" -F "file=@$1"
			)
		grep -q '"link":"' <<< $data && break
		if [ $i -eq 5 ]; then
			echo "ERROR: connection problems"; return 1
		fi
	done
	sed 's/.*"link":"//g;s/".*//g' <<< $data
}
	
upload "$1"
