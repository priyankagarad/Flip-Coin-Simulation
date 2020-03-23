
#!/bin/bash -x
echo "Welcome Flip Coin Simulation"

#variable
h=0
t=0

#declare dictionary
declare -A dictionar
	coin=$((RANDOM%2))
	if [[ $coin -eq 0 ]]
	then
		printf "head"
	else
		printf "tail"
	fi

#combination of coin 
functioncombination()
{
for (( i=0;i<$1;i++ ))
do
	string=" "
	for(( j=0;j<$2;j++ ))
	do
		coin=$((RANDOM%2))
		if [ $coin -eq 0 ]
		then
			string+=h
		else
			string+=t
		fi
done

dictionary[$string]=$(( ${dictionary[$string]}+1 ))
done
echo "${!dictionary[@]}":"${dictionary[@]}"
}

#percentage  calculated

function percentage()
{
	for keys in {!dictionary[@]}
	{
		percentage=`echo "scale=2; $((${dictionary[$keys]}))/$flipCoin*100" | bc`
		echo "$keys = $percentage"
   }
}
read -p  "How many time you flip coin" flipCoin

























