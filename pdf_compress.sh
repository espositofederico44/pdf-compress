#!/bin/bash

# Funzione ricorsiva per attraversare tutte le sottodirectory
function leggi_cartelle() {
    local directory="$1"
    
    # Loop attraverso tutti i file e le directory nella directory data
    for entry in "$directory"/*; do
        if [[ -f "$entry" && ${entry##*.} == "pdf" ]]; then
            # Se è un file PDF, comprimilo con Ghostscript e sovrascrivi il file originale
            gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$entry.tmp" "$entry" && mv "$entry.tmp" "$entry"
            echo "Il file $(basename "$entry") è stato compresso."
        elif [[ -d "$entry" ]]; then
            # Se è una directory, chiama ricorsivamente questa funzione
            leggi_cartelle "$entry"
        fi
    done
}

# Directory di partenza
directory="a"

# Chiamata iniziale alla funzione per leggere tutte le cartelle
leggi_cartelle "$directory"
