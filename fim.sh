#!/bin/bash

# Define variables
TARGET_DIR="./secure_data"
BASELINE_FILE=".baseline_hashes.txt"

# Function: Initialize the baseline
create_baseline() {
    echo "[+] Scanning directory and generating SHA-256 hashes..."
    # Find all files in the target directory and calculate their hashes
    find "$TARGET_DIR" -type f -exec sha256sum {} + > "$BASELINE_FILE"
    echo "[+] Baseline successfully created: $BASELINE_FILE"
}

# Function: Verify file integrity
check_integrity() {
    echo "[+] Verifying file integrity against baseline..."
    
    # Ensure the baseline file exists before checking
    if [ ! -f "$BASELINE_FILE" ]; then
        echo "[-] Error: No baseline found. Please run ./fim.sh --init first."
        exit 1
    fi

    # Check the current file states against the baseline
    # The --quiet flag ensures it only prints files that fail the check
    sha256sum --quiet -c "$BASELINE_FILE"
    
    # Check the exit status of the previous command
    if [ $? -eq 0 ]; then
        echo "[+] ALL CLEAR: No file modifications detected."
    else
        echo "[-] ALERT: File tampering or corruption detected!"
    fi
}

# Main execution logic based on user arguments
if [ "$1" == "--init" ]; then
    create_baseline
elif [ "$1" == "--check" ]; then
    check_integrity
else
    echo "Usage: ./fim.sh [--init | --check]"
    exit 1
fi