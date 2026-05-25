echo -e "What you like to do?, enter a Task Id from list below: \n"
echo -e "TaskID\tFile\t\tDescription"
echo -e "1\t Run - Docker Test Enviroment "
echo -e "2\t Clean Docker - Clean the docker containers and volumes "
echo -e "3\t Clean All - Clean the docker containers and volumes and images "
echo -e "4\t"
echo -e "5\t"
echo -e "6\t"
echo -e "7\t"
echo -e "8\t"
echo -e "9\t"

until [ "$task" = "0" ]; do
  read task

  if [ "$task" = "1" ]; then
    echo "...${task}"
    cd dockers
    docker-compose up -d
    echo "Go to:"
    echo "http:/127.0.0.1:85"
    cd ../

  elif [ "$task" = "2" ]; then
    echo "...${task}"
    docker rm --force $(docker ps -qa)
    docker volume rm $(docker volume ls -q --filter dangling=true)
    docker network prune --force

  elif [ "$task" = "3" ]; then
    echo "...${task}"
    docker rm --force $(docker ps -qa)
    docker volume rm $(docker volume ls -q --filter dangling=true)
    docker network prune
    docker rmi --force $(docker images -aq)

  elif [ "$task" = "4" ]; then
    echo "...${task}"
    cd dockers
    docker-compose down
    cd ../

  elif [ "$task" = "5" ]; then
    echo "...${task}"

  elif [ "$task" = "6" ]; then
    echo "...${task}"

  elif [ "$task" = "7" ]; then
    echo "...${task}"

  elif [ "$task" = "8" ]; then
    echo "...${task}"

  elif [ "$task" = "9" ]; then
    echo "...${task}"

  else
    echo "Goodbye! - Exit"
  fi

  sleep 3

  ./ask.sh

done
