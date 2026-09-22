#!/bin/bash

#SBATCH --job-name=prokka_batch
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=48:00:00
#SBATCH --output=prokka_%j.out
#SBATCH --error=prokka_%j.err

set -e

echo "=========================================="
echo "Starting Prokka batch annotation"
echo "Job ID: $SLURM_JOB_ID"
echo "Started: $(date)"
echo "=========================================="

# Load Anaconda
module load anaconda/2024.10

# Activate Prokka environment
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate prokka_env

# Check Prokka
echo "Prokka version:"
prokka --version

# Input and output directories
INPUT_DIR="Martha_contigs.fasta"
OUTPUT_DIR="prokka_results"

mkdir -p "$OUTPUT_DIR"

# Check input directory
if [ ! -d "$INPUT_DIR" ]; then
    echo "ERROR: Input directory '$INPUT_DIR' does not exist."
    exit 1
fi

# Count genomes
FILE_COUNT=$(find "$INPUT_DIR" -maxdepth 1 -type f -name "*_contigs.fasta" | wc -l)

echo "Found $FILE_COUNT genome FASTA files."

if [ "$FILE_COUNT" -eq 0 ]; then
    echo "ERROR: No *_contigs.fasta files found."
    exit 1
fi

echo "=========================================="

# Run Prokka on each genome
for FILE in "$INPUT_DIR"/*_contigs.fasta
do

    [ -f "$FILE" ] || continue

    BASENAME=$(basename "$FILE")
    SAMPLE=$(basename "$FILE" _contigs.fasta)

    OUTDIR="$OUTPUT_DIR/$SAMPLE"

    echo ""
    echo "=========================================="
    echo "Running Prokka for: $SAMPLE"
    echo "Input: $BASENAME"
    echo "Output: $OUTDIR"
    echo "=========================================="

    # Skip completed genomes
    if [ -f "$OUTDIR/$SAMPLE.gff" ]; then
        echo "$SAMPLE already annotated. Skipping..."
        continue
    fi

    prokka \
        --outdir "$OUTDIR" \
        --prefix "$SAMPLE" \
        --locustag "$SAMPLE" \
        --cpus 4 \
        "$FILE"

    echo "$SAMPLE completed successfully."

done

echo ""
echo "=========================================="
echo "Prokka batch annotation completed."
echo "Finished: $(date)"
echo "=========================================="

GFF_COUNT=$(find "$OUTPUT_DIR" -name "*.gff" -type f | wc -l)

echo "Total GFF files produced: $GFF_COUNT"
echo "=========================================="
