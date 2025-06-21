# 🤖 n8n-Telegram-Bot

> A turnkey Docker Compose setup to run [n8n](https://n8n.io/) with HTTPS via ngrok, pre-configured for Telegram webhooks.

[![Docker](https://img.shields.io/badge/Docker-Required-blue?style=flat-square&logo=docker)](https://www.docker.com/)
[![n8n](https://img.shields.io/badge/n8n-Workflow%20Automation-orange?style=flat-square&logo=n8n)](https://n8n.io/)
[![Telegram](https://img.shields.io/badge/Telegram-Bot%20API-blue?style=flat-square&logo=telegram)](https://core.telegram.org/bots/api)

---

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- 🐳 **Docker** & **Docker Compose**
- 🔑 **ngrok** account & your **AuthToken**
- 🔧 **jq** (used by `start-n8n.sh` to parse ngrok's API)
- 🤖 A valid **Telegram Bot Token**

---

## ⚙️ Installation

### 1. Clone and Setup

```bash
# Clone the repository (if not already done)
git clone <repository-url>
cd n8n-telegram-bot

# Copy environment file
cp .env.example .env
```

### 2. Configure Environment

Open `.env` and configure the following variables:

```env
# ngrok configuration
NGROK_AUTHTOKEN=your_ngrok_token

# Telegram bot configuration
TELEGRAM_BOT_TOKEN=your_bot_token

# n8n authentication (if using basic auth)
N8N_USER=admin
N8N_PASSWORD=secret  # Use a strong password!

# Webhook URL (auto-populated by start-n8n.sh)
WEBHOOK_URL=
```

### 3. Make Script Executable

```bash
chmod +x start-n8n.sh
```

---

## 🚀 Usage

### Start Everything

```bash
./start-n8n.sh
```

This script will:

1. 🚀 Boot ngrok in the background
2. ⏳ Wait for an HTTPS tunnel to be established
3. 📝 Write the tunnel URL to `WEBHOOK_URL` in `.env`
4. 🔄 Restart the n8n service

### Stop Services (Preserve Data)

```bash
docker-compose stop
```

### Restart Only n8n

```bash
docker-compose restart n8n
```

### View Live Logs

```bash
docker-compose logs -f n8n
```

---

## 🔧 Configuration

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `NGROK_AUTHTOKEN` | Your ngrok authentication token | ✅ |
| `TELEGRAM_BOT_TOKEN` | Your Telegram bot token from @BotFather | ✅ |
| `N8N_USER` | Username for n8n basic auth | ❌ |
| `N8N_PASSWORD` | Password for n8n basic auth | ❌ |
| `WEBHOOK_URL` | HTTPS webhook URL (auto-generated) | ✅ |

### Services

- **n8n**: Workflow automation platform
- **ngrok**: HTTPS tunnel for webhook endpoints

---

## 📚 Resources

- [n8n Documentation](https://docs.n8n.io/)
- [Telegram Bot API](https://core.telegram.org/bots/api)
- [ngrok Documentation](https://ngrok.com/docs)
- [Docker Compose](https://docs.docker.com/compose/)

---

## 🤝 Contributing

Feel free to open issues or submit pull requests to improve this setup!

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).