#!/bin/bash

# Absolute path to this script, e.g. /home/user/bin/run_script.sh
RUN_SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
RUN_SCRIPT_PATH=$(dirname "$RUN_SCRIPT")

docker="bionic_melodic_gaz9_robomaker_starting_nvidia"
uid=$(id -u $USER)
repository="$RUN_SCRIPT_PATH/../src"
workspace="/home/$USER/project_ws"


xhost +local:root

docker run -it --rm --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
           --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --name=$docker \
           --privileged --ipc="host" --cap-add=IPC_LOCK --cap-add=sys_nice --user $uid:$uid \
           -e ROS_HOSTNAME=localhost -e ROS_MASTER_URI=http://localhost:11311 \
           --workdir $workspace --volume $repository:$workspace/src \
           --network="host" --gpus all $docker
           
xhost -local:root
