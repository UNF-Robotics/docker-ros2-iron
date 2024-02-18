FROM ros:iron-ros-core-jammy

# update base system
RUN apt-get update && apt-get upgrade -y --no-install-recommends

# install ros2 packages
RUN apt-get update && apt-get install -y --no-install-recommends \
	python3-colcon-devtools \
	python3-colcon-package-selection \
	python3-colcon-ros \
	ros-iron-desktop \
	ros-iron-controller-manager \
	ros-iron-joint-limits \
	ros-iron-joint-state-publisher \
	ros-iron-joy-linux \
	ros-iron-joy-teleop \
	ros-iron-ros2-controllers \
	ros-iron-rplidar-ros \
	ros-iron-slam-toolbox \
	ros-iron-teleop-twist-keyboard \
	ros-iron-xacro \
	&& rm -rf /var/lib/apt/lists/*

# ros 2 env
RUN echo "source /opt/ros/iron/setup.bash" >> /root/.bashrc
RUN echo "[[ -d /opt/ros_ws/install ]] && source /opt/ros_ws/install/setup.sh" \
	>> /root/.bashrc

# ros 2 workspace
RUN mkdir -p /opt/ros_ws/src

# common commands added to history
RUN echo "ros2 run teleop_twist_keyboard teleop_twist_keyboard" \
        >> /root/.bash_history
RUN echo "ros2 launch osprey_ros gamepad.launch.py" \
        >> /root/.bash_history
RUN echo "ros2 launch osprey_ros osprey_ros.launch.py sim:=true" \
        >> /root/.bash_history
RUN echo "source /opt/ros_ws/install/setup.sh" \
        >> /root/.bash_history
RUN echo "rm -r build; colcon build --symlink-install --packages-select  osprey_ros" \
        >> /root/.bash_history
RUN echo "cd /opt/ros_ws" \
        >> /root/.bash_history
