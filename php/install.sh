#!/bin/bash

if [ "$(uname)" = 'Linux' ]; then
	pushd /tmp
	curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
	chmod +x phpbrew

	# Move phpbrew to somewhere can be found by your $PATH
	sudo mv phpbrew /usr/local/bin/phpbrew
	popd
	phpbrew init
fi
