#!/bin/bash -x
#VARIABLE
HH=0
HT=0
TT=0
TH=0
flip=0

echo "Flip Coin Simulation"
declare -A dictionary

#DOUBLET combination
while [ $flip -lt 10 ]
do
	coin1=$((RANDOM%2))
	coin2=$((RANDOM%2))
	if [[ $coin1 -eq 1 && $coin2 -eq 1 ]]
	then
		((HH++))

	elif [[ $coin1 -eq 1 && $coin2 -eq 0 ]]
	then
		((HT++))

	elif [[ $coin1 -eq 0 && $coin -eq 1 ]]
	then
		((TH++))

	else
		((TT++))
	fi
	((flip++))
done

#percentage of doublet

result1=`echo "scale=2; $HH*100/10" | bc `
result2=`echo "scale=2; $HT*100/10" | bc `
result3=`echo "scale=2; $TH*100/10" | bc `
result4=`echo "scale=2; $TT*100/10" | bc `





