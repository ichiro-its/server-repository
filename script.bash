#!/bin/bash

CODENAME="$1"

bash ./scripts/generate_key.bash
bash ./scripts/configure_reprepro.bash "$CODENAME"
