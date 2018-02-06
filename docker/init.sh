#!/bin/bash

if [ "$(uname)" = 'Linux' ]; then
	sudo groupadd docker
	sudo usermod -aG docker $USER
	sudo /bin/systemctl restart docker.service
fi
