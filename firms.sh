#!/bin/bash

# Script to convert IRMS output files to db input format.
# Will pick correct system based on first char of file
# Still need correct column for Optima data
a=$(basename $1)
if [ "${a:0:1}"  == "P" ]
then
	csvcut -H -c 6,15 $1 |\
	sed -e '/INST3 GAS/d' -e '1d' -e 's/$/,Prism/' | csvformat -T
else
	csvcut -c 1,49 $1 |\
	sed -e '/INST3 GAS/d' -e '1d' -e 's/$/,Optima/' | csvformat -T
fi
