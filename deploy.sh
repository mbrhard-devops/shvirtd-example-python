#!/bin/bash

# Установить Docker, если нет
if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com | sudo sh
fi

# Склонировать репозиторий в /opt
if [ ! -d "/opt/shvirtd-example-python" ]; then
    sudo git clone https://github.com/mbrhard-devops/shvirtd-example-python.git /opt/shvirtd-example-python
fi

echo "Репозиторий склонирован!"

cd /opt/shvirtd-example-python

# Выбрать команду: если есть новый docker-compose — использовать его
if [ -x /usr/local/bin/docker-compose ]; then
    COMPOSE_CMD="sudo /usr/local/bin/docker-compose"
else
    COMPOSE_CMD="sudo docker compose"
fi

# Запустить проект
$COMPOSE_CMD -f compose.yaml up --build -d
