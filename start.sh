#!/bin/bash
export JEKYLL_VERSION=3.5
set -x
IP=`ifconfig eth0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'`
nohup docker run --name=webdevcr -e VIRTUAL_HOST=webdevcr.david.vm -e CERT_NAME=david.vm --rm --add-host webdevcr-api.david.vm:127.0.0.1 -v $(pwd):/usr/src/app -P --expose 4000 jekyll:docker bash -c 'cd /usr/src/app; sudo bundle update; sudo jekyll serve -d _site --watch --host=0.0.0.0 --port 4000' > ../logs/webdevcr.log
