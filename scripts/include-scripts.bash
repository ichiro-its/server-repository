#!/bin/bash

DOMAIN="$2"
DEBIAN_DIR="$1/debian"
ROSDEP_DIR="$1/rosdep"

cat << EOF > "$DEBIAN_DIR/setup-nightly.bash"
#!/bin/bash

wget -O - http://$DOMAIN/conf/ichiro.gpg.key | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://$DOMAIN/debian nightly main" > /etc/apt/sources.list.d/ichiro.list'
EOF

cat << EOF > "$DEBIAN_DIR/setup.bash"
#!/bin/bash

wget -O - http://$DOMAIN/conf/ichiro.gpg.key | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://$DOMAIN/debian stable main" > /etc/apt/sources.list.d/ichiro.list'
EOF

mkdir -p $ROSDEP_DIR

cat << EOF > "$ROSDEP_DIR/setup.bash"
#!/bin/bash

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=x864] http://packages.ros.org/ros2/ubuntu main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

if [ ! -d "/etc/ros/rosdep/sources.list.d/" ]; then
  sudo mkdir -p "/etc/ros/rosdep/sources.list.d/"
fi

sudo sh -c 'echo "yaml http://$DOMAIN/rosdep/packages.yaml" > /etc/ros/rosdep/sources.list.d/ichiro.list'
EOF

cp ./data/*.yaml $ROSDEP_DIR
