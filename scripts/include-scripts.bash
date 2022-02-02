#!/bin/bash

DEBIAN_DIR="$HOME/repository/debian"
ROSDEP_DIR="$HOME/repository/rosdep"

cp ./scripts/debian/*.bash $DEBIAN_DIR

mkdir -p $ROSDEP_DIR
cp ./scripts/rosdep/*.bash $ROSDEP_DIR
cp ./data/*.yaml $ROSDEP_DIR
