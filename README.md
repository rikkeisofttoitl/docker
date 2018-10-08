# docker_centos7_php7.0_apache

Build docker image centos7 php

// Build docker
docker-compose build

// Run server
docker-compose up

// Access SSH to server
docker exec -it jacpa_server bash

// Run with winpty when using gitbash

winpty docker exec -it jacpa_server bash
