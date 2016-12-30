#!/bin/bash

# Script to convert IRMS output files to db input format.

if [ "${1:0:1}"  == "P" ]
then
	csvcut -H -c 6,15 $1 |\
	sed -e '/INST3 GAS/d' -e '1d' -e 's/$/,Prism/' | csvformat -T \
	> final$1
else
	csvcut -c 1,49 $1 |\
	sed -e '/INST3 GAS/d' -e '1d' -e 's/$/,Optima/' | csvformat -T \
	> final$1
fi
