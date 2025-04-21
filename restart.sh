#!/bin/bash

declare -i lines=$(docker compose ls | awk '$1=="high-availability-wordpress" {print}' | wc -l)
if [[ $lines -eq 1 ]]; then
	sudo docker compose -f /opt/docker-compose.yml up -d
fi
