#!/bin/bash
# Make settings from template

echo Script name: $0
echo $# arguments 
if [ "$#" -ne 4 ]; 
    then echo "Usage: $0 <maxwidth px> <stepsize> <jitter> <layer>"
fi

maxwidth=$1
stepsize=$2
jitter=$3
layer=$4
echo maxwidth is $maxwidth stepsize is $stepsize jitter is $jitter layer is $layer

cp settings.json settings.bak
echo sed -e "s/MAXWIDTH/$maxwidth/g" -e "s/STEPSIZE/$stepsize/g" -e "s/JITTER/$jitter/g" -e "s/LAYER/$layer/g" settings.template > settings.json

