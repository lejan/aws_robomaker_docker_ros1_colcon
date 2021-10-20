#!/bin/bash

docker="bionic_melodic_gaz9_chapa_robomaker_starting_nvidia"
uid=$(id -u $USER)
repository="/home/lejan/Documents/21-10-06_MISO/21-10-20_ChapaDocker/chapa_colcon_ws"
workspace="/home/lejan/project_ws/"

xhost +local:root

docker run -it --rm --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
           --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --name=$docker \
           --privileged --ipc="host" --cap-add=IPC_LOCK --cap-add=sys_nice --user $uid:$uid \
           -e HOME=/home/lejan -e ROS_HOSTNAME=localhost -e ROS_MASTER_URI=http://localhost:11311 \
           --workdir $workspace --volume $repository:$workspace \
           --network="host" --gpus all $docker
           
xhost -local:root
