# docker build -t ros2:dashing .
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive

ENV ROS_DISTRO humble

# Locale
RUN apt-get update && apt-get install -y locales && \
    dpkg-reconfigure locales && \
    locale-gen ja_JP ja_JP.UTF-8 && \
    update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8
ENV LC_ALL   ja_JP.UTF-8
ENV LANG     ja_JP.UTF-8
ENV LANGUAGE ja_JP.UTF-8

# APT
RUN apt-get update && \
    apt-get install -y curl gnupg2 lsb-release && \
    curl http://repo.ros2.org/repos.key | apt-key add - && \
    sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu \
    `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    apt-get update

# ROS2 pkg
RUN export ROS_DISTRO=humble && \
    apt-get install -y ros-$ROS_DISTRO-desktop 

RUN apt-get update && apt-get install -y \
  build-essential \
  cmake \
  git \
  python3-colcon-common-extensions \
  python3-pip \
  python3-rosdep \
  python3-vcstool \
  wget

RUN pip3 install -U \
  argcomplete \
  flake8 \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest \
  pytest-cov \
  pytest-runner \
  setuptools

RUN rosdep init && \
    rosdep update

RUN apt-get install --no-install-recommends -y \
  libasio-dev \
  libtinyxml2-dev

RUN mkdir /root/workspace

RUN cd /root/workspace \
    && git clone https://github.com/takasehideki/ros_study.git


## env setting
RUN    echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
RUN echo "cd /root/workspace" >> ~/.bashrc