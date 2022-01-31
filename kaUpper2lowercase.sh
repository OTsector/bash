#!/bin/bash

if [ -p /dev/stdin ]; then
	read -ra text
else
	text="$@"
fi

sed 's/\xE1\xB2/\xE1\x83/g' <<EOF
$text
EOF
