FROM ghcr.io/home-assistant/home-assistant:stable

# Копируем конфигурацию в образ
COPY configuration.yaml /config/configuration.yaml

# Создаём папку для персистентных данных (если том не подключён)
RUN mkdir -p /config

# Порт по умолчанию
EXPOSE 8123
