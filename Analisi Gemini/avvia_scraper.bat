@echo off
chcp 65001 >nul
title Scraper Immobiliari Faenza - IA

echo ========================================================
echo   SCRAPER IMMOBILIARE FAENZA (^< 80.000€)
echo   Portali: Immobiliare.it, Idealista, Casa.it, Subito.it
echo ========================================================
echo.

where python >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRORE] Python non e stato trovato nel sistema o nel PATH!
    echo.
    echo Per installare Python:
    echo 1. Vai su: https://www.python.org/downloads/
    echo 2. Scarica e avvia l'installer di Python 3.12 o 3.11
    echo 3. IMPORTANTE: Nella prima schermata dell'installatore, seleziona la spunta:
    echo    "[X] Add python.exe to PATH"
    echo 4. Concludi l'installazione e riavvia questo file avvia_scraper.bat.
    echo.
    pause
    exit /b 1
)

echo [1/3] Verifica e installazione dipendenze (Playwright, BeautifulSoup, Pandas)...
python -m pip install --upgrade pip
python -m pip install -r "%~dp0requirements.txt"
if %errorlevel% neq 0 (
    echo [ERRORE] Errore durante l'installazione delle dipendenze.
    pause
    exit /b 1
)

echo.
echo [2/3] Verifica browser Chromium di Playwright...
python -m playwright install chromium
if %errorlevel% neq 0 (
    echo [ATTENZIONE] Installazione automatica browser Playwright.
)

echo.
echo [3/3] Esecuzione scraper immobiliare...
python "%~dp0scrape_faenza.py"

echo.
echo ========================================================
echo   Completato! Controlla il file IA.csv sul tuo Desktop.
echo ========================================================
pause
