#!/bin/sh
last1=1
last2=0
for((num=0;num<=30;num=num+1))
do
	echo $num > in.txt
	result=`qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq < in.txt | awk '{print $7}'`

	if [ "$num" -eq "0" ]; then
		answer=0
	elif [ "$num" -eq "1" ]; then
		answer=1
	else
		answer=`expr $last1 + $last2`
		last2=$last1
		last1=$answer
	fi
	
	echo "your result of fib("$num")="$result", answer is "$answer

	if [ "$result" -ne "$answer" ]; then
		echo "incorrect!"
	else
		echo "correct!"
	fi

done

rm in.txt
