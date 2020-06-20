#!/bin/bash
# Make settings from template

echo Script name: $0
echo $# arguments 
if [ "$#" -ne 5 ]; 
    then echo "Usage: $0 <maxwidth px> <stepsize> <jitter> <layer1> <layer2>"
fi

maxwidth=$1
stepsize=$2
jitter=$3
layer1=$4
layer2=$5
echo maxwidth is $maxwidth stepsize is $stepsize jitter is $jitter layer is $layer $layer2

cp settings.json settings.bak
sed -e "s/MAXWIDTH/$maxwidth/g" -e "s/STEPSIZE/$stepsize/g" -e "s/JITTER/$jitter/g" -e "s/LAYER/$layer1\/$layer2/g" settings.template.json > settings.json
echo sed -e "s/MAXWIDTH/$maxwidth/g" -e "s/STEPSIZE/$stepsize/g" -e "s/JITTER/$jitter/g" -e "s/LAYER/$layer1\/$layer2/g" settings.template 

