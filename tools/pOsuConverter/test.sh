#!/bin/bash

./cp.sh
if [[ st==0 ]]; then
	if [[ -f 1.txt ]]; then
		rm -f ./1.txt
	fi
	
	if [[ "$1" == "r" ]]; then # Run the test
		./poct -i audio.txt -o 1.txt
		cat 1.txt
	fi
fi