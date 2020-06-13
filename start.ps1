#!/bin/sh
#
# Start the docker container which will keep looking for images inside
# the inputs/ directory and spew out results into outputs/

#TODO change pwd to //drive/path_to_clouddream/

$PORT=80
$pwd=(Get-Location)
docker run --name deepdream-files -v //c/Users/slant/clouddream/deepdream:/usr/share/nginx/html:ro -d -p ${PORT}:80 nginx
docker run --name deepdream-compute -v //c/Users/slant/clouddream/deepdream:/opt/deepdream -d visionai/clouddream /bin/bash -c "cd /opt/deepdream && ./process_images.sh 2>&1 > log.html"
docker run --name deepdream-json --volumes-from deepdream-compute -d ubuntu:14.04 /bin/bash -c "cd /opt/deepdream && ./make_json.sh"

