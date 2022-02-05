#!/bin/bash

DIR="/var/www/repository.ichiro-its.org"

bash ./scripts/generate-key.bash
bash ./scripts/configure-reprepro.bash "$DIR"
bash ./scripts/include-scripts.bash "$DIR"
