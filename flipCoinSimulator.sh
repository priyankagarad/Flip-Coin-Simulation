#!/bin/bash -x
echo " Welcome Flip Coin Simulation"

#declare dictionary
declare -A dictionary

#check head or tail
coin=$((RANDOM%2))
if [[ $coin -eq 1 ]]
then
		echo "Head"
else
		echo "Tail"
fi
