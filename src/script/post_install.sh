sudo apt-get update
sudo apt-get upgrade
rosdep update
rosdep install --from-paths src --ignore-src -r -y
sudo apt install python3-colcon-common-extensions -y
sudo apt install python3-pip -y
pip3 install colcon-ros-bundle
sudo apt-get install python3-apt -y
sudo pip3 install -U setuptools pip
sudo apt-get install wget
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
colcon build
cd /
./ros_entrypoint.sh
cd ~/project_ws
rosdep update
colcon bundle
