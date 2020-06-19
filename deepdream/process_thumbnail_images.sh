#!/bin/bash
# Simple script to process all of the images inside the inputs/ folder
# We will be running this script inside the visionai/clouddream Docker image
# Copyright vision.ai, 2015

while [ true ];
do
    ./create_settings.sh 300 0.5 27 inception_4c/output
    ./process_custom_images_once.sh inception_4c_output
    sleep 1
done