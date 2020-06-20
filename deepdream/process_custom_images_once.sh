#!/bin/bash
# Simple script to process all of the images inside the inputs/ folder
# We will be running this script inside the visionai/clouddream Docker image
# Copyright vision.ai, 2015
# Modified slanthie 2020

echo Script name: $0
echo $# arguments 
if [ "$#" -ne 1 ]; 
    then echo "Usage: $0 suffix"
fi
suffix=$1
cd /opt/deepdream/inputs
mkdir -p /opt/deepdream/outputs/thumbnails/
find . -type f -not -path '*/\.*' -print0 | while read -d $'\0' f;
do
	output_filename=`echo ${f}|sed -e "s/\.jpg//" -e "s/\.jpeg//" -e "s/\.JPG//" -e "s/\.JPEG//"`"_${1}"    #should just do case insensitive!
	echo "[deepdream.py] Input file is ${f}. Suffix is ${suffix}. Output file will be $output_filename. "
    cd /opt/deepdream
    if [ -e outputs/thumbnails/$output_filename.jpg ];
    then
		echo "File $output_filename.jpg already processed"
    else
		echo "[deepdream.py]" $output_filename.jpg
		chmod gou+r inputs/${f}
		cp inputs/${f} input.jpg
		python deepdream.py
		ERROR_CODE=$?
		echo "deepdream.py exited with Error Code  " ${ERROR_CODE}
		cp output.jpg outputs/thumbnails/$output_filename.jpg
		rm output.jpg
		echo "Just created" outputs/thumbnails/$output_filename.jpg
    fi
done


