FROM n8nio/n8n:latest

USER root
RUN npm i -g playwright && playwright install --with-deps chromium

COPY render.js /usr/local/bin/render.js

USER node
