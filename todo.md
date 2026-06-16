# Att göra

## Planerat

- [ ] **Manuellt:** gör GitHub Packages-paketet `hrplus-lon` publikt efter första
  CI-bygget, annars krävs `docker login ghcr.io` för att pulla imagen.

## Klart

- [x] **CI till GHCR.** GitHub Actions bygger/pushar `ghcr.io/armandur/hrplus-lon`
  (latest, sha, branch, semver). `docker-compose.yml` pekar på GHCR-imagen,
  `docker-compose.dev.yml` bygger lokalt.
- [x] **Versionsinfo i appen.** Hjälp -> Om programmet visar repo, branch, commit
  (länk) och byggtid från `version.json` som bakas in vid bygget.
- [x] **Container.** `Dockerfile` (multi-stage: Node bygger `dist/`, nginx serverar),
  `nginx.conf` med säkerhetsheaders + SPA-fallback, `docker-compose.yml`, `DOCKER.md`.
- [x] **Demo-drift på port 8848.** Kör via containern på http://ubuntu-ai:8848
  (`docker compose up -d`). Peka reverse proxy dit.
- [x] Virtualisera "Visa alla" (lazy rendering över 40 anställda, print fyller alla).
- [x] Ta bort hårdkodat företagsnamn ("Lerums församling") i transaktionslist-parsningen.
- [x] Plattformsoberoende bygge (`build.mjs` i Node, vid sidan av `build.ps1`).
- [x] `aria-label` på sökfältet.
