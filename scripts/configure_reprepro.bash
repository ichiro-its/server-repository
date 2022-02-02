#!/bin/bash

CODENAME="$1"
KEY_ID=$(gpg --list-secret-key --with-subkey-fingerprint | tail -n2 | awk 'NR==1{print $1}')
DIR="$HOME/repository/debian/conf"
DISTRIBUTIONS="$DIR/distributions"
OPTIONS="$DIR/options"

sudo apt-get install reprepro -y
mkdir -p $DIR

touch $DISTRIBUTIONS
echo "Origin: repository.ichiro-its.org" >> $DISTRIBUTIONS
echo "Label: repository.ichiro-its.org" >> $DISTRIBUTIONS
echo "Codename: $CODENAME" >> $DISTRIBUTIONS
echo "Architectures: amd64" >> $DISTRIBUTIONS
echo "Components: main" >> $DISTRIBUTIONS
echo "Description: ROS 2 Debian Package Repository" >> $DISTRIBUTIONS
echo "SignWith: $KEY_ID" >> $DISTRIBUTIONS

touch $OPTIONS
echo "verbose" >> $OPTIONS
echo "basedir $HOME/repository/debian" >> $OPTIONS

mkdir -p "$HOME/repository/conf"
gpg --armor --output "$HOME/repository/conf/$CODENAME.gpg.key" --export-options export-minimal --export $KEY_ID
