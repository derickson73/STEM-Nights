<#
  Start-StemNight.ps1  -  offline STEM Night server (run on the laptop)

  What it does:
    1. Pulls the newest tutorials from GitHub (skipped quietly if there's no internet)
    2. Links this repo into pxt-arcade\docs\stem (one-time, no copying ever again)
    3. Prints the URLs to put on the board for the kid computers
    4. Starts pxt serve so other computers on the same network can connect

  Usage (or just double-click Start-StemNight.cmd in the repo root):
    .\tools\Start-StemNight.ps1
    .\tools\Start-StemNight.ps1 -PxtArcade "D:\code\pxt-arcade" -Port 3232 -SkipPull
#>
param(
    [string]$PxtArcade = "$HOME\Documents\GitHub\pxt-arcade",
    [int]$Port = 3232,
    [switch]$SkipPull
)

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot

# --- 0. Sanity checks -------------------------------------------------------
if (-not (Test-Path (Join-Path $PxtArcade 'pxtarget.json'))) {
    Write-Host "Can't find pxt-arcade at: $PxtArcade" -ForegroundColor Red
    Write-Host "Run again with:  -PxtArcade 'C:\path\to\pxt-arcade'"
    exit 1
}
if (-not (Get-Command pxt -ErrorAction SilentlyContinue)) {
    Write-Host "The 'pxt' command isn't installed. Run:  npm install -g pxt" -ForegroundColor Red
    exit 1
}

# --- 1. Get the latest tutorials -------------------------------------------
if (-not $SkipPull) {
    Write-Host "Checking GitHub for tutorial updates..." -ForegroundColor Cyan
    git -C $repo pull --ff-only
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  Couldn't pull (offline?). Using the tutorials already on this laptop." -ForegroundColor Yellow
    }
}

# --- 2. Link repo into pxt-arcade docs (one-time) ---------------------------
$link = Join-Path $PxtArcade 'docs\stem'
if (-not (Test-Path $link)) {
    New-Item -ItemType Junction -Path $link -Target $repo | Out-Null
    Write-Host "Linked $link -> $repo" -ForegroundColor Green
}

# --- 3. Print the URLs for kid computers ------------------------------------
$ips = Get-NetIPAddress -AddressFamily IPv4 |
    Where-Object { $_.IPAddress -notlike '127.*' -and $_.IPAddress -notlike '169.254.*' } |
    Select-Object -ExpandProperty IPAddress
$skip = @('README', 'CLAUDE', 'RUNBOOK')
$tutorials = Get-ChildItem $repo -Filter *.md |
    Where-Object { $skip -notcontains $_.BaseName } |
    Select-Object -ExpandProperty BaseName

Write-Host ""
Write-Host "================ PUT THESE ON THE BOARD ================" -ForegroundColor Green
foreach ($ip in $ips) {
    Write-Host "Network address $ip :" -ForegroundColor Cyan
    foreach ($t in $tutorials) {
        Write-Host ("  {0,-8} http://{1}:{2}/index.html#tutorial:/stem/{0}" -f $t, $ip, $Port)
    }
}
Write-Host "========================================================" -ForegroundColor Green
Write-Host "If Windows asks about the firewall for Node.js, click Allow (Private networks)."
Write-Host "Leave this window open. Press Ctrl+C to stop the server."
Write-Host ""

# --- 4. Start the server -----------------------------------------------------
Push-Location $PxtArcade
try {
    pxt serve --hostname 0.0.0.0 --port $Port
}
finally {
    Pop-Location
}
