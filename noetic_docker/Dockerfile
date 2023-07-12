FROM osrf/ros:noetic-desktop-full

# ENV NVIDIA_VISIBLE_DEVICES \
#     ${NVIDIA_VISIBLE_DEVICES:-all}
# ENV NVIDIA_DRIVER_CAPABILITIES \
#     ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
# ENV DEBIAN_FRONTEND=noninteractive


########################
### INSTALL PACKAGES ###
########################
RUN apt-get update && apt-get install -y \
    sudo \
    vim \
    wget \
    unzip \
    git \
    iputils-ping net-tools \
    python3-tk \
    python3-pip

#####################
### INSTALL CMAKE ###
#####################
# Reference: https://apt.kitware.com/
RUN git clone https://gitlab.kitware.com/cmake/cmake.git \
	&& cd cmake \
	&& git checkout tags/v3.16.3 \
	&& ./bootstrap --parallel=8 \
	&& make -j8 \
	&& make install \
	&& cd .. \
	&& rm -rf cmake

###########################################
### INSTALL Universal_Robots_ROS_Driver ###
###########################################
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-rospkg \
    python3-catkin-pkg \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-rosdep \
    python3-catkin-tools \
    ros-noetic-moveit-commander \
    python3 \
    ros-noetic-universal-robots \
    build-essential


RUN /bin/bash -c "source /opt/ros/noetic/setup.bash"
RUN mkdir -p /root/workspace/catkin_ws/src
RUN cd /root/workspace \
    && git clone https://github.com/takasehideki/ros_study.git
RUN echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc
RUN echo "cd /root/workspace" >> ~/.bashrc
