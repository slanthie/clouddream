#!/bin/bash
# Make settings from template

echo Script name: $0
echo $# arguments 
if [ "$#" -ne 5 ]; 
    then echo "Usage: $0 <maxwidth px> <stepsize> <jitter> <layer>"
fi

$maxwidth=$1
$stepsize=$2
$jitter=$3
$layer=$4

cp settings.json settings.bak
sed -e "s/MAXWIDTH/$maxwidth/g" -e "s/STEPSIZE/$stepsize/g" -e "s/JITTER/$jitter/g" -e "s/LAYER/$layer/g" settings.template > settings.json

