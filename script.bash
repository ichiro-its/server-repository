#!/bin/bash

if [ -z "$1" ]
then
  printf "Please, specify the target directory!\nUsage: bash script.sh [target directory] [domain]\n"
  exit 1
fi

if [ -z "$2" ]
then
  printf "Please, specify the domain!\nUsage: bash script.sh [target directory] [domain]\n"
  exit 1
fi

DIR="$1"
DOMAIN="$2"

bash ./scripts/generate-key.bash
bash ./scripts/configure-reprepro.bash "$DIR" "$DOMAIN"
bash ./scripts/generate-scripts.bash "$DIR" "$DOMAIN"
