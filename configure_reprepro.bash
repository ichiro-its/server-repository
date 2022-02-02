#!/bin/bash

KEY_ID="$1"
DIR="$HOME/repository/debian/conf"
DISTRIBUTIONS="$DIR/distributions"
OPTIONS="$DIR/options"

sudo apt-get install reprepro
mkdir -p $DIR

touch $DISTRIBUTIONS
echo "Origin: repository.ichiro-its.org" >> $DISTRIBUTIONS
echo "Label: repository.ichiro-its.org" >> $DISTRIBUTIONS
echo "Codename: ichiro-its" >> $DISTRIBUTIONS
echo "Architectures: amd64" >> $DISTRIBUTIONS
echo "Components: main" >> $DISTRIBUTIONS
echo "Description: ICHIRO ITS APT Repository" >> $DISTRIBUTIONS
echo "SignWith: $KEY_ID" >> $DISTRIBUTIONS

touch $OPTIONS
echo "verbose" >> $OPTIONS
echo "basedir $HOME/repository/debian" >> $OPTIONS

mkdir -p "$HOME/repository/conf"
gpg --armor --output "$HOME/repository/conf/ichiro-its.gpg.key" --export-options export-minimal --export $KEY_ID
