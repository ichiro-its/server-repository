#!/bin/bash

wget -O - https://repository.ichiro-its.org/conf/nightly.gpg.key | apt-key add -
sh -c 'echo "deb [arch=amd64] https://repository.ichiro-its.org/debian nightly main" > /etc/apt/sources.list.d/ichiro-its-nightly.list'
