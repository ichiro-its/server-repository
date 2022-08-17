#!/bin/bash

if [ -z "$1" ]
then
  printf "Please, specify the target directory!\nUsage: bash script.sh [target directory]\n"
  exit 1
fi

DIR="$1"

bash ./scripts/generate-key.bash
bash ./scripts/configure-reprepro.bash "$DIR"
bash ./scripts/include-scripts.bash "$DIR"
