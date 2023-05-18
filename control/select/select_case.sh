#! /bin/zsh

PS3="Select number #"

echo
select action in start stop status restart
do
	echo
	case $action in
		start)
			echo "service start";;
		stop)
			echo "service stop";;
		status)
			echo "service status";;
		restart)
			echo "service restart";;
		*)
			echo "Error!"
		exit 1;;
	esac
	break
done
