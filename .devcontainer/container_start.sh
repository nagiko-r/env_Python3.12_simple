#!/bin/bash

CONTAINER_NAME=$(grep CONTAINER_NAME .env | cut -d "=" -f2)

docker cp /home/nemu/.ssh/id_ed25519 ${CONTAINER_NAME}:/app/.ssh/

docker-compose exec ${CONTAINER_NAME} bash -c '
    eval "$(ssh-agent)"
    ssh-add .ssh/id_ed25519
    expect -c "
        spawn ssh -T git@github.com
        expect \"Are you sure you want to continue\" { send yes }
    "
    bash
'