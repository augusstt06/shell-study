#! /bin/zsh

PS3="Seclet one option number : "

echo
select var in "A" "B" "C" "D"
do
	echo
	echo "you choose ${var}"
	echo
	break
done
