#! /bin/zsh

PS3="Select number #"

echo
number(){
select i
do
	echo
	echo "you choose $i"
	echo
	break
done
}
number one two three four five

