#!/bin/bash

DEBIAN_DIR="$1/debian"
ROSDEP_DIR="$1/rosdep"

cp ./scripts/debian/*.bash $DEBIAN_DIR

mkdir -p $ROSDEP_DIR
cp ./scripts/rosdep/*.bash $ROSDEP_DIR
cp ./data/*.yaml $ROSDEP_DIR
