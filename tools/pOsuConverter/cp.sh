#!/bin/bash
# clear && g++ poct.cpp -o poct && ./poct -i audio.txt -o out.txt

CFLAG="-std=c++11 -Wall"

clear

src=$(ls -al | tr -s ' ' | cut -f 9 -d ' ' | grep .cpp)

if ! [[ "$(ls -al | grep .o$)"=="" ]]; then
	echo Object files cleaned.
	rm -f ./*.o
fi

st=0
echo Compiling...
for i in $src; do
	g++ -c $CFLAG $i -o ${i%%.*}.o
	if ! [[ "$?" == "0" ]]; then
		echo Compile Failed.
		st=1
		break
	fi
done

if [[ st==0 ]]; then
	obj=$(ls | grep ".o$")
	g++ $CFLAG -o poct $obj
	if [[ "$?" == "0" ]]; then
		echo Compile Completed.
	else
		echo Compile Failed.
	fi
fi