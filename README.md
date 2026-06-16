# Löneunderlagsgranskare HR+

Ett webbaserat granskningsverktyg för Excel-exporter från Hr+.

Publicerad version: <https://hrlon.lerumsforsamling.se>

## Kort om verktyget

Verktyget gör det enklare att granska löneunderlag per anställd i stället för att arbeta manuellt med filter i Excel.

Det stödjer export från:

- `Ekonomirutin → Bokföringsposter → Mer → Export → Kalkylprogram`
- `Rapporter & Dokument → Transaktionslista → Spara som Excel`
- `Ekonomirutin → Löneunderlagslista → Mer → Export → Kalkylprogram`

## Dataskydd

Importerade Excel-filer behandlas lokalt i användarens webbläsare. Verktyget laddar inte upp lönefiler eller löneuppgifter till någon server.

Källkoden är publik så att andra kan granska hur verktyget fungerar.

- [Dataskydd och teknisk säkerhet](docs/security.md)
- [Deployment och cache-beteende](docs/deployment.md)

## Viktigt

Excel-exporter, PDF:er och andra lönefiler ska inte läggas i repot. `.gitignore` blockerar vanliga filtyper som `.xlsx`, `.xls`, `.csv` och `.pdf`.
