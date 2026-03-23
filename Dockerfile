FROM ghcr.io/home-assistant/home-assistant:stable

COPY configuration.yaml /config/configuration.yaml

EXPOSE 8123
