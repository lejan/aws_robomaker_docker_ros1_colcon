# aws_robomaker_docker_ros1_colcon
A getting started guide to generate an output.tar file (using colcon bundle) to be uploaded to AWS RoboMaker platform and simulate a ROS1 (melodic) job.

# Docker
In this repo the base image has Ubuntu Bionic full desktop version, ROS Melodic and Gazebo 9.

## Build
First of all you need to create the docker image based on the docker file. So after cloning this repo do:
```bash
cd aws_robomaker_docker_ros1_colcon/docker
make build
```

## Configuring
There is one main file to be modified:
* Dockerfile

Replace "lejan" with your current user name:
For example:

```bash
ARG user="your_user_name"
```


## Usage
Now you can instantiate a container and run it every time you want.
```bash
make run
```


# Script
After runing the docker container you need to run a script that will setup your workstation:

 ```
 source src/scriptpost_installation.sh
  ```