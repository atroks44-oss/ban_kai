#!/bin/bash
set -e

CONFIG_DIR="/config"
CONFIG_FILE="$CONFIG_DIR/configuration.yaml"

# Создаём папку конфигурации, если нет
mkdir -p "$CONFIG_DIR"

# Если файл не существует — создаём базовый с настройками прокси
if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" << 'EOF'
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 100.64.0.0/10
    - 172.16.0.0/12
    - 10.0.0.0/8
    - 127.0.0.1

# Включаем логирование для отладки
logger:
  default: info
  logs:
    homeassistant.components.http: debug

recorder:
  purge_keep_days: 7
EOF
  echo "✅ Created configuration.yaml with proxy settings"
fi

# Запускаем оригинальный entrypoint Home Assistant
exec hass "$@"
