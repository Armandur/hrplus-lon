# Att göra

## Planerat

- [ ] (valfritt) GitHub Actions som bygger image till `ghcr.io/armandur/hrplus-lon`,
  så `docker-compose.yml` kan peka på GHCR-imagen i stället för att bygga lokalt.

## Klart

- [x] **Container.** `Dockerfile` (multi-stage: Node bygger `dist/`, nginx serverar),
  `nginx.conf` med säkerhetsheaders + SPA-fallback, `docker-compose.yml`, `DOCKER.md`.
- [x] **Demo-drift på port 8848.** Kör via containern på http://ubuntu-ai:8848
  (`docker compose up -d`). Peka reverse proxy dit.
- [x] Virtualisera "Visa alla" (lazy rendering över 40 anställda, print fyller alla).
- [x] Ta bort hårdkodat företagsnamn ("Lerums församling") i transaktionslist-parsningen.
- [x] Plattformsoberoende bygge (`build.mjs` i Node, vid sidan av `build.ps1`).
- [x] `aria-label` på sökfältet.
