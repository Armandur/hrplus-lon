param(
  [string]$OutDir = "dist"
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourceIndex = Join-Path $root "index.html"
$sourceVendor = Join-Path $root "vendor\xlsx.full.min.js"
$sourceNoticeFile = Join-Path $root "source-notice.html"
$dist = Join-Path $root $OutDir

$rootFull = [System.IO.Path]::GetFullPath($root)
$distFull = [System.IO.Path]::GetFullPath($dist)

if (-not $distFull.StartsWith($rootFull, [System.StringComparison]::OrdinalIgnoreCase)) {
  throw "Output directory must be inside the project folder."
}

if (-not (Test-Path -LiteralPath $sourceIndex)) {
  throw "Missing index.html."
}

if (-not (Test-Path -LiteralPath $sourceVendor)) {
  throw "Missing vendor/xlsx.full.min.js."
}

$utf8 = New-Object System.Text.UTF8Encoding($false)

if (Test-Path -LiteralPath $distFull) {
  Remove-Item -LiteralPath $distFull -Recurse -Force
}

New-Item -ItemType Directory -Path (Join-Path $distFull "vendor") | Out-Null

$sourceNotice = if (Test-Path -LiteralPath $sourceNoticeFile) {
  [System.IO.File]::ReadAllText($sourceNoticeFile, $utf8)
} else {
  "<!-- Lönefiler behandlas lokalt i webbläsaren och laddas inte upp. -->"
}

$html = [System.IO.File]::ReadAllText($sourceIndex, $utf8)
$html = $html -replace "(?i)^<!doctype html>", "<!doctype html>`r`n$sourceNotice"
$html = $html -replace "(\r?\n){3,}", "`r`n`r`n"

[System.IO.File]::WriteAllText((Join-Path $distFull "index.html"), $html, $utf8)
Copy-Item -LiteralPath $sourceVendor -Destination (Join-Path $distFull "vendor\xlsx.full.min.js") -Force

$headers = @"
/*
  X-Content-Type-Options: nosniff
  Referrer-Policy: no-referrer
  Permissions-Policy: camera=(), microphone=(), geolocation=()
  Content-Security-Policy: default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; object-src 'none'; base-uri 'none'; form-action 'none'
"@

[System.IO.File]::WriteAllText((Join-Path $distFull "_headers"), $headers, $utf8)

Write-Host "Created $distFull"
Write-Host "Publish this folder in Cloudflare Pages: $OutDir"
