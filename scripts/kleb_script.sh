#!/bin/bash

#SBATCH --job-name=kleborate
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=08:00:00
#SBATCH --output=kleborate_%j.out
#SBATCH --error=kleborate_%j.err

set -e

# Load Anaconda
module load anaconda/2024.10

# Activate environment
source $(conda info --base)/etc/profile.d/conda.sh
conda activate kleb_env

# Input and output
INPUT_DIR="."
OUTPUT_DIR="kleborate_results"

mkdir -p "$OUTPUT_DIR"

# Run Kleborate v3
kleborate \
    -a "$INPUT_DIR"/*.fasta \
    -o "$OUTPUT_DIR" \
    -p kpsc \
    --trim_headers
