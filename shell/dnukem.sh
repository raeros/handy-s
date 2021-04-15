#!/bin/sh	

# A nuke to kill them all!!
# or at least to try
dnuke(){
	docker system prune -a --volumes
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
	docker network prune -f
	docker rmi -f $(docker images --filter dangling=true -a -q)
	docker volume rm $(docker volume ls --filter dangling=true -q)
	docker rmi -f $(docker images -a -q)
}

read -p "Nuke them all? y/n" answer
test "${answer}" = "y" && dnuke



