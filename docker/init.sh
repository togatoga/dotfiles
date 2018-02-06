#!/bin/bash

if [ "$IS_LINUX" -eq '1' ]; then
	sudo groupadd docker
	sudo gpasswd -a $USER docker
	sudo systemctl restart docker

fi
