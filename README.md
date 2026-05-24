# GitHub User Activity CLI

Una semplice interfaccia a riga di comando (CLI) per recuperare e visualizzare l'attività recente di un utente GitHub. Questo progetto è una soluzione per la sfida [GitHub User Activity](https://roadmap.sh/projects/github-user-activity) di roadmap.sh.

Il progetto include due implementazioni indipendenti:
1. **Bash** (Script classico o tramite estensione/alias della GitHub CLI `gh`).
2. **JavaScript** (Node.js nativo).

---

## 🚀 Funzionalità
- Mostra gli ultimi eventi dell'utente (Push, Issues, Star, Fork, Creazione di repository/branch).
- Formatta i messaggi in modo leggibile.
- Gestisce gli errori (es. utente non trovato o problemi di rete).

---

## ⬜ Soluzione 1: BASH & GitHub CLI

Puoi eseguire questa soluzione in due modi differenti: tramite uno script classico o configurando un alias globale se utilizzi la CLI ufficiale di GitHub (`gh`).

### Opzione A: Script Bash Classico
Assicurati che lo script abbia i permessi di esecuzione.

#### Uso:
```bash
# Dai i permessi di esecuzione allo script (solo la prima volta)
chmod +x github-activity.sh

# Esegui lo script passando lo username
./github-activity.sh dbehelitate ⬜
```

### Opzione B: Alternativa rapida con GitHub CLI (`gh`) e `jq`
Se hai installato la [GitHub CLI](https://cli.github.com/) e lo strumento `jq`, puoi eseguire questa riga direttamente nel terminale:

Istruzioni nel file "Guida veloce ALIAS gh CLI.txt"

gh gossip-activity nilbuild ⬜
```

---

## 🟨 Soluzione 2: JavaScript (Node.js)

Questa versione utilizza JavaScript nativo moderno (con l'API `fetch` integrata a partire da Node.js 18+). Non richiede la configurazione di un `package.json` o l'installazione di moduli esterni (`npm install`).

### Prerequisiti
- [Node.js](https://nodejs.org) (Versione 18 o superiore consigliata)

### Uso
Salva il codice in un file chiamato `github-activity.js` ed eseguilo passando il nome utente come argomento:

```bash
node github-activity.js <username>
```

#### Esempio:
```bash
node github-activity.js dbehelitate
```

