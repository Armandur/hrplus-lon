# Att göra

## Planerat

- [ ] **Bygg en container för projektet.** Paketera den statiska appen (`dist/`)
  i en enkel container (t.ex. nginx eller en liten statisk server) så att den
  kan köras lokalt/self-hostas utan Cloudflare. Lägg till `Dockerfile` och
  `docker-compose.yml`, och dokumentera i `DOCKER.md`.

- [~] **Kör igång forken på en vald port på VM:en för demo åt kollega.** Kör just
  nu på **port 8848** (http://ubuntu-ai:8848) via `python -m http.server` från
  `dist/` - peka reverse proxy dit. Bör ersättas av containern nedan för en mer
  varaktig drift.

## Klart

- [x] Virtualisera "Visa alla" (lazy rendering över 40 anställda, print fyller alla).
- [x] Ta bort hårdkodat företagsnamn ("Lerums församling") i transaktionslist-parsningen.
- [x] Plattformsoberoende bygge (`build.mjs` i Node, vid sidan av `build.ps1`).
- [x] `aria-label` på sökfältet.
