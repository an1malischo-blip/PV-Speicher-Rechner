# Statische Auslieferung von pv-speicher-rechner.de mit Caddy (Sliplane, Region Deutschland)
FROM caddy:2.11.4-alpine

COPY Caddyfile /etc/caddy/Caddyfile

# Nur der öffentliche Ordner (wie bisher outputDirectory "public" bei Vercel)
COPY public /srv

# Ohne Root-Rechte laufen; Caddy braucht nur Schreibzugriff auf /config und /data
RUN addgroup -S web && adduser -S -D -H -G web web && chown -R web:web /config /data
USER web

EXPOSE 8080
