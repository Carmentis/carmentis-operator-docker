#!/bin/bash

GIT_BRANCH="main"

DOCKER_COMPOSE_FILE="./docker-compose.yml"

start_app_alone() {
    docker-compose -f $DOCKER_COMPOSE_FILE up -d --build operator
}

start_app() {
    if [ ! -f ./.data/operator/admin-public-key.txt ] ; then
      echo "The file 'admin-public-key.txt' holding the administrator public key was not found."
      echo "See https://docs.carmentis.io/how-to/deploy-operator to learn more."
      echo "Please provide the administrator public key: "
      read -r key

      # Todo: use a regex to validate the key given in input /^0(2|3)[a-f\d]{64}$/i

      mkdir -p ./.data/operator
      echo "$key" > ./.data/operator/admin-public-key.txt

      echo "Administrator public key saved."
    fi
    docker-compose -f $DOCKER_COMPOSE_FILE up -d --build
}

stop_app() {
    docker-compose -f $DOCKER_COMPOSE_FILE down
}

show_logs() {
    docker-compose -f $DOCKER_COMPOSE_FILE logs
}

check_status() {
    docker-compose -f $DOCKER_COMPOSE_FILE ps
}

update() {
    git pull origin $GIT_BRANCH
    docker-compose pull
}

case "$1" in
    start)
        start_app
        ;;
    start:alone)
        start_app_alone
        ;;
    stop)
        stop_app
        ;;
    restart)
        stop_app
        start_app
        ;;
    reset:db)
        echo "This command will delete all data in the database. Are you sure? (y/n)"
        read answer
        if [ "$answer" != "${answer#[Yy]}" ] ;then
          stop_app
          rm -rf ./.data/db
          start_app
        else
          echo "Aborted."
        fi
        ;;
    update)
        stop_app
        update
        start_app
        ;;
    logs)
        show_logs
        ;;
    status)
        check_status
        ;;
    *)
        echo "Usage: $0 {start|start:alone|stop|restart|update|logs|status|reset:db}"
        exit 1
esac

exit 0
