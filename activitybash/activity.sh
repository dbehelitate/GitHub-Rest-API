#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Errore: Username mancante."
    echo "Uso: ./github-activity.sh <username>"
    exit 1
fi

USERNAME="$1"
ENDPOINT="users/${USERNAME}/events"

# Controlliamo prima se l'utente esiste per evitare falsi positivi
if ! gh api "users/${USERNAME}" &>/dev/null; then
    echo "Errore: L'utente '$USERNAME' non esiste o non è raggiungibile."
    exit 1
fi

# Eseguiamo la query gestendo i valori nulli con l'operatore '//' di jq
gh api "$ENDPOINT" --jq '.[:10] | .[] | 
    if .type == "PushEvent" then 
        "- Pushed " + ((.payload.size // 0) | tostring) + " commits to " + .repo.name
    elif .type == "IssuesEvent" then 
        "- " + (.payload.action | ascii_upcase[0:1] + .payload.action[1:]) + " a new issue in " + .repo.name
    elif .type == "WatchEvent" then 
        "- Starred " + .repo.name
    elif .type == "CreateEvent" then 
        "- Created " + (.payload.ref_type // "resource") + " in " + .repo.name
    else 
        "- " + .type + " in " + .repo.name
    end' 2>/dev/null || true

# Controllo se la chiamata API precedente è fallita
if [ $? -ne 0 ]; then
    echo "Errore: Impossibile recuperare i dati dell'attività."
    exit 1
fi
