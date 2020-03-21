#!/bin/bash -x
echo "Flip Coin Simulation"
declare -A dictionary
for (( i=0;i<10;i++ ))
do
	coin=$((RANDOM%2))
	if [[ $coin -eq 1 ]]
	then
		((head++))
	else
		((tail++))
	fi
done

dictionary[0]=$head
dictionary[1]=$tail
echo "${!dictionary[@]}":"${dictionary[@]}"

result1=$((($head*100)/10))
result2=$((($tail*100)/10))



