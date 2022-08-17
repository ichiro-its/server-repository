#!/bin/bash

base_usage="Usage: bash script.sh [target directory] [domain]"

if [ -z "$1" ]
then
  printf "Please, specify the target directory!\n$base_usage\n"
  exit 1
fi

if [ -z "$2" ]
then
  printf "Please, specify the domain!\n$base_usage\n"
  exit 1
fi

DIR="$1"
DOMAIN="$2"

mkdir -p "$DIR"

read -e -p "Setup server using nginx through docker? [Y/n] (n) " YN

if [[ $YN == "y" || $YN == "Y" ]]
then
  bash ./scripts/setup-nginx.bash "$DIR" "$DOMAIN"
fi

bash ./scripts/generate-key.bash
bash ./scripts/configure-reprepro.bash "$DIR" "$DOMAIN"
bash ./scripts/generate-scripts.bash "$DIR" "$DOMAIN"
