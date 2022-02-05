#!/bin/bash

wget -O - https://repository.ichiro-its.org/conf/ichiro.gpg.key | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://repository.ichiro-its.org/debian nightly main" > /etc/apt/sources.list.d/ichiro.list'
