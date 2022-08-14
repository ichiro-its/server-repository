#!/bin/bash

[ -z "$1" ] && printf "Please, specify the target directory!\nUsage: bash script.sh [target directory]"

DIR="$1"

bash ./scripts/generate-key.bash
bash ./scripts/configure-reprepro.bash "$DIR"
bash ./scripts/include-scripts.bash "$DIR"
