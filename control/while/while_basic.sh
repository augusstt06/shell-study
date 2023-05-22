#! /bin/zsh

A=1

while [ $A -lt 5 ]
do
	echo "A = $A"
	A=`expr $A + 1`
done
