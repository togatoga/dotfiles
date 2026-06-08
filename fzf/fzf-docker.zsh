docker-start() {
	local container="$(__fzf_docker_ps exited)"
	if [ -n "${container}" ]; then
		echo 'starting container...'
		docker start ${container}
	fi
}

docker-stop() {
	local container="$(__fzf_docker_ps running)"
	if [ -n "${container}" ]; then
		echo 'stopping container...'
		docker stop ${container}
	fi
}

docker-exec-bash() {
	local container="$(__fzf_docker_ps running)"
	if [ -n "${container}" ]; then
		docker exec -it ${container} /bin/bash
	fi
}

docker-rm() {
	local container="$(__fzf_docker_ps exited)"
	if [ -n "${container}" ]; then
		echo 'removing container...'
		docker rm ${container}
	fi
}

docker-rmi() {
	local image="$(docker images -a | sed -e '1d' | fzf | awk '{print $3}')"
	if [ -n "${image}" ]; then
		echo 'removing container image...'
		docker rmi ${image}
	fi
}
