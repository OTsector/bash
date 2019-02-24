#!/bin/bash

if (( $# == 0 )); then
	echo "use: "$0" [ location ]"
	echo -e "\nfor example:\n"$0" ~/Desktop"
	exit 1
fi

dir=$1

if [[ ${dir:00:01} == "~" ]]; then
	dir=$HOME${dir:1}
fi
if ! [ -d $dir ]; then
	echo -e "\terror: location not exsist!\n"; exit 1
fi
fileArray=(
	$(
		ls -l $dir | \
			while read a; do
				if [[ ${a:0:1} != "d" ]];then
					echo $a | awk '{print $9}'
				fi;
			done
	)
)
for (( i=0; i < ${#fileArray[@]}; i++)); do
	file=${fileArray[$i]}
	if [[ $(echo $file|grep "\.") != "" ]]; then
		extensionArray+=(${file##*.})
	fi
done
extensionArray=($(
	echo ${extensionArray[@]} |tr " " "\n" | uniq)
)
for (( i=0; i < ${#extensionArray[@]}; i++ )); do
	(
		mkdir -p $dir/${extensionArray[$i]}
		mv $dir"/"*.${extensionArray[$i]} $dir/${extensionArray[$i]}
	) &> /dev/null
done
echo "done!"
exit 0

