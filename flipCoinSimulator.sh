#!/bin/bash -x
#VARIABLE
echo "Flip Coin Simulation"
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
   for (( i=0;i<$1; i++ ))
   do
      string=""
      for (( j=0;j<$2;j++ ))
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
read -p "Combination Single press 1) double press 2) Tripal press 3)" choice

# call method
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
   findPercentage
else
   printf "Please Enter a Right Choice" 
fi

