docker-start() {
	local container
	container="$(docker ps -a -f status=exited | sed -e '1d' | peco | awk '{print $1}')"
	if [ -n "${container}" ]; then
		echo 'starting container...'
		docker start ${container}
	fi
}

docker-stop() {
	local container
	container="$(docker ps -a -f status=running | sed -e '1d' | peco | awk '{print $1}')"
	if [ -n "${container}" ]; then
		echo 'stopping container...'
		docker stop ${container}
	fi
}

docker-exec-bash() {
	local container
	container="$(docker ps -a -f status=running | sed -e '1d' | peco | awk '{print $1}')"
	if [ -n "${container}" ]; then
		docker exec -it ${container} /bin/bash
	fi
}
docker-rm() {
	local container
	container="$(docker ps -a -f status=exited | sed -e '1d' | peco | awk '{print $1}')"
	if [ -n "${container}" ]; then
		echo 'removing container...'
		docker rm ${container}
	fi
}
docker-rmi() {
	local image
	image="$(docker images -a | sed -e '1d' | peco | awk '{print $3}')"
	if [ -n "${image}" ]; then
		echo 'removing container image...'
		docker rmi ${image}
	fi
}
