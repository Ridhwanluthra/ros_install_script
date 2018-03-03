#!/bin/bash

distro="random"
if [[ -r /etc/os-release ]]; then
    . /etc/os-release
    if [[ $ID = ubuntu ]]; then
	    if [[ $VERSION == *"14.04"* ]]; then
	    	distro="indigo"
	    elif [[ $VERSION == *"14.10"* ]]; then
	    	distro="jade"
	    elif [[ $VERSION == *"15.04"* ]]; then 
	    	distro="jade"
	    elif [[ $VERSION == *"15.10"* ]]; then
	    	distro="kinetic"
	    elif [[ $VERSION == *"16.04"* ]]; then
	    	distro="kinetic"
	    elif [[ $VERSION == *"16.10"* ]]; then
	    	distro="lunar"
	    elif [[ $VERSION == *"17.04"* ]]; then
	    	distro="lunar"
	    elif [[ $VERSION == *"17.10"* ]]; then
	    	echo "Beta tester?"
	    else
		    $us="RIP, "
		    $us.=$USER
		    echo '$us'
	    fi
	    if [[ $distro=="random" ]]; then
	    	sudo sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
			sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116 -y
			sudo apt get update -y
			sudo apt install ros-"$distro"-desktop-full -y
			sudo rosdep init
			rosdep update
			echo "source /opt/ros/$distro/setup.bash" >> ~/.bashrc
			source ~/.bashrc
	    fi
	else
	    echo "Not using Ubuntu"
    fi

else
    echo "Not running a distribution with /etc/os-release available"
fi
