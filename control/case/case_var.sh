#! /bin/zsh

B="$1"

case $B in
	apple | banana)
		echo "this is fruit";;
	carrot | cabbage)
		echo "this is vegetable";;
	*)
		echo "Neither vegetable nor fruits";;
esac
