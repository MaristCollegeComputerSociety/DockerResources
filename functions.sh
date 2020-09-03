# Remove all docker images
cleani(){
    echo "Cleaning all tagged Images"
    docker rmi $(docker images | awk '{print $1}')
    clean_untag
    docker images
}
# Kill and remove all containers
clean_kill(){
    docker kill $(docker ps -a | awk '{print $1}') &&
    docker rm $(docker ps -a | awk '{print $1}')
    docker ps -a
}
# Remove all docker containers
clean(){
    docker rm $(docker ps -a | awk '{print $1}')
    docker ps -a
}
# Remove all docker images that are untagged
clean_untag(){
    echo "Cleaning all Untagged images"
	docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
}
# Exec into a running docker container
dockex(){
    docker exec -it $1 bash
}