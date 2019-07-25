#!/bin/bash

if [ -f /usr/bin/hexdump ]; then
	if [ $# -gt 0 ]]; then
		hexdump -v -e '"\\""x" 1/1 "%02x" ""' $1
	else
		echo "use: "$0" [file.bin]"; exit 1
else
	echo "ERROR: hexdump is not installed"; exit 1
	echo -e "install command: \"sudo apt install hexdump\""
fi
done
exit 0
