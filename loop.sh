#! /bin/zsh

for ((i=0;i<=5;i++))

do

    echo "Normal loop $i"

done


for i in `seq 0 5`
do
	echo "seq+normal loop $i"
done

