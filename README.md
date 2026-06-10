# Löneunderlagsgranskare HR+

En statisk webbapp för att granska Excel-exporter från Hr+ lokalt i webbläsaren.

## Dataskydd

Importerade Excel-filer behandlas lokalt i användarens webbläsare. Appen laddar inte upp lönefiler till någon server.

## Publicering

Publicera mappen `dist` i Cloudflare Pages.

Rekommenderad Cloudflare Pages-inställning:

- Build command: lämna tomt
- Build output directory: `dist`

## Uppdatera publiceringsversionen

Kör detta lokalt efter ändringar i `index.html` eller `source-notice.html`:

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
```

Commita sedan både källfilerna och den uppdaterade `dist`-mappen.

## Filer som inte ska in i Git

Excel-exporter, PDF:er och andra lönefiler ska inte läggas i repot. `.gitignore` blockerar vanliga filtyper som `.xlsx`, `.xls`, `.csv` och `.pdf`.
