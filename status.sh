#!/bin/bash

echo "Status of deepdream containers..."
docker ps -a -f "label=deepdream"
