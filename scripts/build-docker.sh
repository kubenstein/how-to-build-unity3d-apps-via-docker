#!/bin/bash

docker run --rm \
  --name unity-docker-builder \
  --hostname unity-docker-builder \
  --memory 4gb \
  -v $PWD:/usr/app \
  -v unity-docker-builder-library:/usr/app/src/unity3d/Library \
  -v unity-docker-builder-temp:/usr/app/src/unity3d/Temp \
  unityci/editor:ubuntu-2021.1.7f1-webgl-0.15.0 \
  sh -c '
    cd /usr/app
    echo - activate unity3d license
    unity-editor -batchmode -nographics -quit -logfile -manualLicenseFile ./scripts/support/unity_license_docker.ulf

    ./scripts/build.sh
  '