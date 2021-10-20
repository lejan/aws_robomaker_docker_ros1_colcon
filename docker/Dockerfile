FROM  osrf/ros:melodic-desktop-full
LABEL maintainer="lejan"

ARG user="lejan"
ARG uid="1000"
ENV ROS_DISTRO=melodic

USER root

RUN apt-get update
RUN apt-get install -y locales gnupg2
RUN locale-gen en_US.UTF-8
ENV \
    LANG=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

RUN adduser --disabled-password --gecos "Development User"  -u ${uid} ${user}
RUN adduser ${user} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${user}
RUN echo ". /opt/ros/${ROS_DISTRO}/setup.bash" >> /home/${user}/.bashrc

USER root
RUN apt-get install tmux -y
RUN apt-get install gdal-bin -y
RUN apt-get install libgdal-dev -y

RUN apt-get update
RUN apt-get upgrade -y

# Workspace
RUN mkdir -p /home/${user}/project_ws/src/ && \
    chown -R ${user} /home/${user}/project_ws
USER ${user}
WORKDIR /home/${user}/project_ws/
# RUN rosdep update


