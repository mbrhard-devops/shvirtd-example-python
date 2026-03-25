#!/bin/bash

# Остановить старые контейнеры 
docker compose -f compose.yaml down --remove-orphans 2>/dev/null || true

# Собрать и запустить
docker compose -f compose.yaml up --build -d

# Показать статус
docker compose -f compose.yaml ps

echo -e "\n Завершение скрипт!"
