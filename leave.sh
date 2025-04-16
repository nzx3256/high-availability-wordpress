#!/bin/bash

sudo docker stack ls 2>&1 > /dev/null
declare -i ret=$?
if [[ $ret -eq 0 ]]; then
	sudo docker stack rm wordpress-stack
	sudo docker swarm leave --force
	exit
fi
