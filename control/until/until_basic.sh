#! /bin/zsh

until [ "$A" = "end" ]
do
	echo -n "종료하려면 \"end\"를 입력하세요 : "
	read A
	echo $A
done
