#!/bin/bash -x
echo "Flip Coin Simulation"

#declare dictionary
declare -A dictionary

#VARIABLE
HHH=0
HHT=0
TTT=0
TTH=0
THT=0
HTT=0
THH=0
HTH=0
flip=0

#triplet combination
while [ $flip -lt 10 ]
do
	coin1=$((RANDOM%2))
	coin2=$((RANDOM%2))
	coin3=$((RANDOM%2))
	if [[ $coin1 -eq 1 && $coin2 -eq 1 && $coin3 -eq 1 ]]
	then
		((HHH++))
	elif [[ $coin1 -eq 1 && $coin2 -eq 1 && $coin3 -eq 0 ]]
	then
		((HHT++))
	elif [[ $coin1 -eq 1 && $coin2 -eq 0 && $coin3 -eq 1 ]]
	then
		((HTH++))
	elif [[ $coin1 -eq 0 && $coin2 -eq 1 && $coin3 -eq 1 ]]
	then
		((THH++))
 	elif [[ $coin1 -eq 0 && $coin2 -eq 1 && $coin3 -eq 0 ]]
	then
		((THT++))
	elif [[ $coin1 -eq 0 && $coin2 -eq 0 && $coin3 -eq 0 ]]
	then
		((TTT++))
 	elif [[ $coin1 -eq 0 && $coin2 -eq 0 && $coin3 -eq 1 ]]
	then
		((TTH++))
	else
		((HTT++))
	fi
		((flip++))
done

#add value in dictionary
dictionary[0]=$HHH
dictionary[1]=$HHT
dictionary[2]=$HTH
dictionary[3]=$THH
dictionary[4]=$THT
dictionary[5]=$TTT
dictionary[6]=$TTH
dictionary[7]=$HTT

#print dictionary
echo "${!dictionary[@]}"
echo "${dictionary[@]}"

#percentage of triplet
result1=`echo "scale=2; $HHH*100/10" | bc `
result2=`echo "scale=2; $HHT*100/10" | bc `
result3=`echo "scale=2; $HTH*100/10" | bc `
result4=`echo "scale=2; $THH*100/10" | bc `
result5=`echo "scale=2; $THT*100/10" | bc `
result6=`echo "scale=2; $TTT*100/10" | bc `
result7=`echo "scale=2; $TTH*100/10" | bc `
result8=`echo "scale=2; $HTT*100/10" | bc `

#sorted triplet combination
for (( i=0;i<8;i++ ))
do
	for (( j=$((i+1));j<8;j++ ))
	do
		if [[ ${dictionary[$i]} -gt ${dictionary[$j]} ]]
		then
			temp=${dictionary[$i]}
			dictionary[$i]=${dictionary[$j]}
			dictionary[$j]=$temp
		fi
	done
done
echo "${dictionary[@]}"
echo "maximum time win combination:${dictionary[7]}"





