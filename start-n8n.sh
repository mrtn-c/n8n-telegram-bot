#!/usr/bin/env bash
set -e

# 1. Arranca ngrok en background (Compose must esté configurado)
docker-compose up -d ngrok

# 2. Espera a que ngrok esté listo y toma la URL pública
echo "Esperando ngrok…"
sleep 10

RESPONSE=$(curl -s http://localhost:4040/api/tunnels)

echo "ngrok está listo"
echo $RESPONSE

NGROK_URL=$(curl -s http://localhost:4040/api/tunnels \
  | jq -r '.tunnels[] | select(.proto=="https") | .public_url')

echo "ngrok público: $NGROK_URL"

# 3a. Opción A: actualizás .env con sed
sed -i '' "s|^WEBHOOK_URL=.*|WEBHOOK_URL=$NGROK_URL|" .env
echo ".env actualizado: WEBHOOK_URL=$NGROK_URL"


# 4. Reinicia n8n
docker-compose up -d --no-deps --build n8n
echo "✅ n8n reiniciado, ingresa por: $NGROK_URL"
