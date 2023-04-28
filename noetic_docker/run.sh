#!/bin/bash
docker run --gpus all --rm -it --net host --ipc host\
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
    -v $HOME/ros2_ex:/root/ros2_ex \
    ros1:noetic bash