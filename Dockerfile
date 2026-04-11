FROM node:20-bullseye

# =========================
# Install n8n globally
# =========================
RUN npm install -g n8n

# =========================
# Core settings
# =========================
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=7860
ENV NODE_ENV=production

# Public URLs (IMPORTANT)
ENV N8N_EDITOR_BASE_URL=https://<space-name>.hf.space
ENV WEBHOOK_URL=https://<space-name>.hf.space

# =========================
# HF + OAUTH FIX (CRITICAL)
# =========================
ENV N8N_PROTOCOL=https
ENV N8N_PROXY_HOPS=1
ENV N8N_TRUST_PROXY=true
ENV N8N_SECURE_COOKIE=false

# =========================
# Disable unwanted features
# =========================
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_BASIC_AUTH_ACTIVE=false
ENV N8N_USER_MANAGEMENT_DISABLED=true

# =========================
# Stability
# =========================
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_USER_FOLDER=/home/node/.n8n
ENV NODE_OPTIONS=--max-old-space-size=512
# =========================
# Working directory
# =========================
WORKDIR /home/node

RUN mkdir -p /home/node/.n8n

# =========================
# Port
# =========================
EXPOSE 7860

# =========================
# Start n8n
# =========================
CMD ["node", "/usr/local/bin/n8n"]