# ===========================================
# n8n on Hugging Face Spaces + Supabase
# ===========================================
FROM node:22-bookworm-slim

RUN apt-get update && \
    apt-get install -y ca-certificates curl && \
    update-ca-certificates

# Install n8n
RUN npm install -g n8n@latest

# Create data directory
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node

# HF Spaces
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=7860
ENV NODE_ENV=production

# ✅ FIXED: Combined both flags together
ENV NODE_OPTIONS="--dns-result-order=ipv4first --openssl-legacy-provider"

# ✅ ADDED: Disable TLS rejection globally
ENV NODE_TLS_REJECT_UNAUTHORIZED=0

# Proxy
ENV N8N_PROXY_HOPS=1
ENV N8N_SECURE_COOKIE=false

# Supabase
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_PORT=5432
ENV DB_POSTGRESDB_SSL_ENABLED=true
ENV DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false

# Timezone
ENV TZ=Asia/Colombo
ENV GENERIC_TIMEZONE=Asia/Colombo

# Disable telemetry
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_PERSONALIZATION_ENABLED=false

EXPOSE 7860
CMD ["n8n", "start"]