# Bash File Integrity Monitor (FIM)

## Overview
A lightweight, OS-level File Integrity Monitor built in Bash. This tool takes a cryptographic snapshot (SHA-256) of a target directory and monitors it for unauthorized modifications, deletions, or tampering. 

**Author:** Vignesh Ganesan

## Features
* **Baseline Initialization:** Generates a secure ledger of SHA-256 hashes for all files in a target directory.
* **Integrity Verification:** Compares current file states against the baseline ledger to detect tampering.
* **Automated Alerting:** Flags specific modified files for incident response review.

## Usage
1. Make the script executable: `chmod +x fim.sh`
2. Initialize the baseline: `./fim.sh --init`
3. Run the integrity check: `./fim.sh --check`

## Security Concepts Demonstrated
* Cryptographic Hashing (SHA-256)
* System State Monitoring
* Bash Scripting & Automation