#!/bin/bash

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=x864] http://packages.ros.org/ros2/ubuntu main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

DIR="/etc/ros/rosdep/sources.list.d/"
if [ ! -d "$DIR" ]; then
  sudo mkdir -p "$DIR"
fi

sudo sh -c 'echo "yaml https://repository.ichiro-its.org/rosdep/packages.yaml" > /etc/ros/rosdep/sources.list.d/ichiro.list'
