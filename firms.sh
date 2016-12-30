#!/bin/sh

# Script to convert IRMS output files to db input format.
# Currently just does Prism, but could do both by parsing
# input.

csvcut -H -c 6,15 $1 | sed -e '1d' -e 's/$/,Prism/' | csvformat -T
