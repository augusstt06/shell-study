#! /bin/zsh

if [ 1 -eq 1 -a 1 -eq -1 ]
then
	echo true
else
	echo false
fi

if [ 1 -eq 1 -o 1 -eq -1 ]
then
	echo true
else
	echo false
fi

