include .env
run: up join down

join:
	-docker exec -w ${WORK_DIR_INSIDE_DOCKER} -it ${CONTAINER_NAME} /bin/bash

up: host-allow
	docker-compose up -d
	docker exec -ti ${CONTAINER_NAME} /bin/bash -c 'echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc'
	docker exec -ti ${CONTAINER_NAME} /bin/bash -c 'echo "export ROS_DOMAIN_ID=${ROS_DOMAIN_ID}" >> ~/.bashrc'
	docker exec -ti ${CONTAINER_NAME} /bin/bash -c 'sudo apt -y install ~nros-humble-rqt*'

down: host-restrict
	docker-compose down

ps:
	docker-compose ps

rm:
	-docker stop ${CONTAINER_NAME}
	-docker rm ${CONTAINER_NAME}

host-allow:
	xhost + ${hostname}
	export HOSTNAME=`hostname`

host-restrict:
	xhost - ${hostname}

install:
	brew install --cask xquartz
