#! /bin/zsh

DIR="/Users/chungyeonkim/Desktop/shell-study/create-dir"

if [ ! -d $DIR ]
then
	mkdir $DIR
	if [ -e $DIR/newfile.sh ]
		then
			echo "이미newfile.sh가 있습니다"
		else
			touch $DIR/newfile.sh
			echo "설정한 디렉토리에 newfile.sh를 생성하였습니다."
	fi
else
	echo "해당 경로에 디렉토리가 존재합니다"
fi
