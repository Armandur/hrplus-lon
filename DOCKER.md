# Docker

Appen är helt statisk. Containern bygger `dist/` från källan (`index.html` via
`build.mjs`) och serverar den med nginx. Samma säkerhetsheaders som
`dist/_headers` sätts i `nginx.conf`, plus SPA-fallback.

## Kör med docker compose

```bash
docker compose up -d --build
```

Appen nås sedan på `http://<host>:8848` (t.ex. http://ubuntu-ai:8848).
Peka en reverse proxy mot den porten.

Stoppa:

```bash
docker compose down
```

## Byt port

Ändra host-porten i `docker-compose.yml`:

```yaml
ports:
  - "9000:80"   # <host>:<container>
```

## Bygg/kör utan compose

```bash
docker build -t hrplus-lon:local .
docker run -d --name hrplus-lon -p 8848:80 hrplus-lon:local
```

## Uppdatera efter kodändring

Containern bygger `dist/` själv vid image-bygget, så det räcker att bygga om:

```bash
docker compose up -d --build
```

## Filer

- `Dockerfile` - multi-stage: Node bygger `dist/`, nginx serverar.
- `nginx.conf` - root, säkerhetsheaders, SPA-fallback. Kopieras till
  `/etc/nginx/conf.d/default.conf`.
- `.dockerignore` - håller byggkontexten liten.
- `docker-compose.yml` - single-container på port 8848.
