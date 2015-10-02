#!/bin/sh

# variable initialization
last1=1
last2=0

# check from 0 to 30
for((num=-2;num<=30;num=num+1))
do
	# get the result from test code
	echo $num > in.txt
	result=`qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq < in.txt | awk '{print $7}'`

	# calculate answer by iterative algorithm
	if [ "$num" -lt "0" ]; then
		answer=-1
	elif [ "$num" -eq "0" ]; then
		answer=0
	elif [ "$num" -eq "1" ]; then
		answer=1
	else
		answer=`expr $last1 + $last2`
		last2=$last1
		last1=$answer
	fi
	
	# print the data 
	echo "your result of fib("$num")="$result", answer is "$answer


	# compare result and answer
	if [ "$result" -ne "$answer" ]; then
		echo "incorrect!"
	else
		echo "correct!"
	fi

done

# clean trash
rm in.txt
