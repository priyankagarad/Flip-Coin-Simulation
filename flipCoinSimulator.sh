#!/bin/bash -x
echo "Flip Coin Simulation"

#declare dictionary
declare -A dictionary

HEAD=0
TAIL=1

random=$((RANDOM%2))

if [ $random -eq $HEAD ]
then
   printf "Head"
else
	printf "Tail"
fi

# Combinations of  coin
function combination(){
	for (( i=0; i<$1; i++ ))
	do
		string=""
      for (( j=0; j<$2; j++ ))
      do
         random=$((RANDOM%2))
         if [ $random -eq $HEAD ]
         then
            string+=H
         else
            string+=T
         fi
		done
      dictionary[$string]=$(( ${dictionary[$string]}+1 ))
	done
   echo "All Combination : ${dictionary[@]}"
   echo  "All keys : ${!dictionary[@]}"
}

#find percentage
function percentageFind(){
   for keys in ${!dictionary[@]}
   {
      persentage=`echo "scale=2; $((${dictionary[$keys]}))/$flipCoin*100" | bc`
      echo  "$keys =  $persentage"
   }
}
read -p  "How many time you flip coin" flipCoin
read -p "Combination Single press for singlet_combination 1) double press for doublet_combination 2) third press for triplet_combination 3)" choice

# Check choice 
if [ $choice -eq 1 ]
then
   combination $flipCoin $choice
   percentageFind
elif [ $choice -eq 2 ]
then
   combination $flipCoin $choice
   percentageFind
elif [ $choice  -eq 3 ]
then
   combination $flipCoin $choice
   percentageFind
else
   printf "Please Enter a Right Choice" 
fi

