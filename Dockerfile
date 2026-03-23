FROM ghcr.io/home-assistant/home-assistant:stable

# Копируем наш скрипт и делаем исполняемым
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Переопределяем точку входа
ENTRYPOINT ["/entrypoint.sh"]
