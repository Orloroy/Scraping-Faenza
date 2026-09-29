# Scraper Immobiliare - Faenza (< 80.000€)

Script Python avanzato per l'estrazione e il monitoraggio degli annunci immobiliari in vendita a Faenza (RA) con prezzo inferiore o uguale a **80.000€**.

## Portali supportati
- **Immobiliare.it**
- **Subito.it**
- **Idealista.it**
- **Casa.it**

## Caratteristiche principali
- **Playwright con Stealth Mode**: emulazione di browser reale con mascheramento di `navigator.webdriver`, User-Agent realistici e ritardi casuali per aggirare le protezioni anti-bot (Cloudflare / DataDome).
- **Riconoscimento Aste Giudiziarie**: colonna dedicata `Asta` (`Sì` / `No`) per distinguere immediatamente compravendite ordinarie da procedure esecutive / tribunale.
- **Deduplicazione intelligente**: gli annunci identici pubblicati su più portali vengono raggruppati in un'unica riga con i link unificati.
- **Salvataggio automatico CSV**: esporta direttamente sul Desktop nel file `IA.csv` (codifica `utf-8-sig`, separatore `;` compatibile al 100% con Microsoft Excel in italiano).

## Colonne del file CSV (`IA.csv`)
1. `Portale`: Portale/i su cui è presente l'annuncio
2. `Titolo`: Titolo dell'annuncio
3. `Prezzo (€)`: Prezzo normalizzato in Euro
4. `Superficie (mq)`: Metratura dell'immobile
5. `Locali`: Numero locali / vani
6. `Piano`: Piano dell'immobile (terra, 1°, ecc.)
7. `Zona/Quartiere`: Zona o quartiere a Faenza
8. `Tipologia`: Agenzia o Privato
9. `Asta`: `Sì` se asta giudiziaria, `No` se compravendita ordinaria
10. `Link`: Link diretto all'annuncio (o link multipli unificati)

## Come avviare lo scraper

### 1. Se non hai ancora installato Python:
1. Scarica l'installer di **Python 3.12 o 3.11** dal sito ufficiale: [https://www.python.org/downloads/](https://www.python.org/downloads/)
2. Avvia l'installer e **spunta la casella fondamentale**:
   > `[X] Add python.exe to PATH` (in basso nella prima schermata)
3. Completa l'installazione.

### 2. Avvio con 1 clic:
Fai doppio clic sul file [`avvia_scraper.bat`](file:///c:/Users/acer/Desktop/DIMENSIONE/IA/avvia_scraper.bat):
Il file installerà automaticamente le librerie (`playwright`, `beautifulsoup4`, `pandas`), scaricherà il motore Chromium di Playwright ed eseguirà lo scraping generando `IA.csv` sul Desktop.

### 3. Avvio manuale da terminale:
```powershell
pip install -r requirements.txt
playwright install chromium
python scrape_faenza.py
```
