FROM node:20-bullseye

# Dependencias necesarias para Playwright/Chromium
RUN apt-get update && apt-get install -y \
  wget gnupg ca-certificates \
  fonts-liberation \
  libasound2 libatk1.0-0 libatk-bridge2.0-0 libcups2 \
  libdbus-1-3 libdrm2 libgbm1 libgtk-3-0 libnspr4 libnss3 \
  libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxdamage1 libxext6 \
  libxfixes3 libxrandr2 libxshmfence1 libxss1 libxtst6 \
  xdg-utils \
  && rm -rf /var/lib/apt/lists/*

# Instala n8n y Playwright + Chromium
RUN npm i -g n8n playwright && playwright install chromium

# Copia tu render
COPY render.js /usr/local/bin/render.js

# n8n corre en 5678
EXPOSE 5678

# Railway
ENV N8N_PORT=5678

CMD ["n8n"]
