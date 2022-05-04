#!/bin/bash

# stop on error
set -e

function main () {
  remove_dist_folder

  build_unity3d_webgl
  build_unity3d_linux
}

########

function remove_dist_folder () {
  rm -rf ./dist
  mkdir -p ./dist
}

function build_unity3d_webgl () {
  echo "- build unity3d project (WebGL)"
  unity-editor -batchmode -nographics -quit -logfile -projectPath "${PWD}/src/unity3d" -executeMethod ExportTool.ExportProjectWebGl
}

function build_unity3d_linux () {
  echo "- build unity3d project (Linux)"
  unity-editor -batchmode -nographics -quit -logfile -projectPath "${PWD}/src/unity3d" -executeMethod ExportTool.ExportProjectLinux
}

# go!
main


