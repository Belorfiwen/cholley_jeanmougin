#! /bin/sh

if [ $# -eq 0 ] 
then
	for i in *
	do
		if test -f $i
		then 
			echo $i ": file"
		else
			echo $i ": directory"
		fi
	done
elif [ $# -eq 1 ]
then
	cd $1
	for i in *
	do
		if test -f $i
		then 
			echo $i ": file"
		else
			echo $i ": directory"
		fi
	done
else
	echo "Usage : ./ls.sh [dir]\n"
fi
