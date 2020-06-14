#!/bin/sh
#
# Start the docker container which will keep looking for images inside
# the inputs/ directory and spew out results into outputs/

PORT=80
docker run --name deepdream-files --label deepdream -v //c/Users/slant/clouddream/deepdream:/usr/share/nginx/html:ro -d -p ${PORT}:80 nginx

docker run --name deepdream-compute --label deepdream -v //c/Users/slant/clouddream/deepdream:/opt/deepdream -d   visionai/clouddream bash -c "cd /opt/deepdream && ./process_images.sh 2>&1 > log.html"

docker run --name deepdream-json --label deepdream --volumes-from deepdream-compute -d ubuntu:14.04 bash -c "cd /opt/deepdream && ./make_json.sh"
