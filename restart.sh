#!/bin/bash

declare -i lines=$(docker compose ls | awk '$1=="high-availability-wordpress" {print}' | wc -l)
if [[ $lines -eq 1 ]]; then
	sudo docker compose -f /home/tylermg640/final-project/high-availability-wordpress/docker-compose.yml up -d
fi
lines=$(docker compose ls | awk '$1=="final-project" {print}' | wc -l)
if [[ $lines -eq 1 ]]; then
	sudo docker compose -f /home/tylermg640/final-project/docker-compose.yml up -d
fi
