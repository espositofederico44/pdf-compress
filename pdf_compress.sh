#!/bin/bash

# Recursive function to traverse all subdirectories
function scan_directory() {
    local directory="$1"
    
    # Loop through all the files and directories in the given directory
    for entry in "$directory"/*; do
        if [[ -f "$entry" && ${entry##*.} == "pdf" ]]; then
            # If it is a PDF file, compress it with Ghostscript and overwrite the original file
            gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$entry.tmp" "$entry" && mv "$entry.tmp" "$entry"
            echo "The file $(basename "$entry") has been compressed."
        elif [[ -d "$entry" ]]; then
            # If it is a directory, recursively call this function
            scan_directory "$entry"
        fi
    done
}

# Starting directory
directory="dir_name"

# Initial call to the function to read all folders
scan_directory "$directory"
