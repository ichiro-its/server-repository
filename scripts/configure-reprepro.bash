#!/bin/bash

DOMAIN="$2"
BASE_DIR="$1"
DIR="$BASE_DIR/debian/conf"
KEY_ID=$(gpg --list-secret-key --with-subkey-fingerprint | tail -n2 | awk 'NR==1{print $1}')

sudo apt-get install reprepro -y
mkdir -p $DIR

cat > "$DIR/distributions" <<EOL
Origin: $DOMAIN
Label: $DOMAIN
Codename: nightly
Architectures: amd64
Components: main
Description: Unstable ROS2 Debian Package Repository
SignWith: $KEY_ID

Origin: $DOMAIN
Label: $DOMAIN
Codename: stable
Architectures: amd64
Components: main
Description: Stable ROS2 Debian Package Repository
SignWith: $KEY_ID
EOL

cat > "$DIR/options" <<EOL
verbose
basedir $BASE_DIR/debian
EOL

mkdir -p "$BASE_DIR/conf"
gpg --armor --output "$BASE_DIR/conf/ichiro.gpg.key" --export-options export-minimal --export $KEY_ID
