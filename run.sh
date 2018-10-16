#!/bin/bash


if [[ "$1" == "" ]]; then
	echo The arguement is empty!
else
	rm -rf /tmp/processing
	mkdir /tmp/processing
	processing-java --sketch="$(pwd)/src" --output=/tmp/processing --force --run
fi