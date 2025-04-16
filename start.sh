#!/bin/bash

sudo docker service ls 2> /dev/null
declare -i ret=$?
if [[ ! $ret -eq 0 ]]; then
	sudo docker swarm init 2>&1 > /dev/null
	sudo docker stack deploy -c docker-compose.yml wordpress-stack
fi
