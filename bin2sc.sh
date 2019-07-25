#!/bin/bash

if [ -f /usr/bin/hexdump ]; then
	hexdump -v -e '"\\""x" 1/1 "%02x" ""' $1
else
	echo "ERROR: hexdump is not installed"; exit 1
	echo -e "install command: \"sudo apt install hexdump\""
fi
done
exit 0
