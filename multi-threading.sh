#!/bin/bash
clear
echo -e "without threads:\n\n"
for (( j = 0; j<=5; j++ )); do
	pipe[$j]=$j
	sleep 1
	echo $j" "
done

echo -e "\n\nwith threads:";
for (( i=0; i<=5; i++ )); do # open ten processes
	echo -e "\n\nstage: $i\n\n"
	for (( j=0; j<=5; j++ )); do
		pipe[$j]=$j
		sleep 1
	done
	for (( j=0; j<=5; ++j )); do # wait for them to finish
		echo ${pipe[$j]}" "
	done
done

echo  -e "\n"