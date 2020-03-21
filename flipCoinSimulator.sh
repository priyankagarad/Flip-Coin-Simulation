#!/bin/bash -x
echo "Flip Coin Simulation"
coin=$((RANDOM%2))
if [[ $coin -eq 1 ]]
then
		echo "Head"
else
		echo "Tail"
fi
