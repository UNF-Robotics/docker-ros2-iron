# docker-ros2-iron
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=plastic)](https://github.com/Osprey-Robotics/docker-ros2-iron/blob/master/LICENSE.txt)
[![Docker Image Status](https://github.com/Osprey-Robotics/docker-ros2-iron/actions/workflows/main.yml/badge.svg/)](https://github.com/Osprey-Robotics/docker-ros2-iron/actions)

Docker image with ROS 2 Iron Development Environment for various robotics 
purposes at UNF, club, research, and development. This container contains the
initial base headless environment and minimum packages needed to build and
run ROS 2 packages.

[Latest](https://hub.docker.com/r/ospreyrobotics/docker-ros2-iron/tags)

## Docker Pull Command
```bash
docker pull ospreyrobotics/docker-ros2-iron
```

## Development Environment Usage
Inside the container, there is an initial folder `/opt/ros_ws/src` that is
intended for use for to build ROS 2 packages. Sources can either be
downloaded into the container, or the recommended local mount, which allows
for development using a local IDE. 

### Run Command on Linux
The following command will open a terminal to the newly created 
container that uses the host computers network. It also assumes that the
sources have been downloaded locally in `~/osprey_ros/` and shared as a
volume in the folder inside the container.
```bash
docker run --net=host --rm -it -v ~/osprey_ros/:/opt/ros_ws/src/osprey_ros ospreyrobotics/docker-ros2-iron:latest
```

Then, to proceed change to the shared source directory in the container
and proceed with building, running, etc.
```bash
cd /opt/ros_ws/src
```
