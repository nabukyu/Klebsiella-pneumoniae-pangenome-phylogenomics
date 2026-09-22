#!/bin/bash

#SBATCH --job-name=panaroo
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=72:00:00
#SBATCH --output=panaroo_%j.out
#SBATCH --error=panaroo_%j.err

set -e

echo "=========================================="
echo "Starting Panaroo"
echo "Job ID: $SLURM_JOB_ID"
echo "Started: $(date)"
echo "=========================================="

# Load Anaconda
module load anaconda/2024.10

# Initialize Conda
source "$(conda info --base)/etc/profile.d/conda.sh"

# Activate Panaroo environment
conda activate panaroo_env

echo "Panaroo version:"
panaroo --version

# Check that GFF directory exists
if [ ! -d "gffs" ]; then
    echo "ERROR: gffs directory does not exist."
    exit 1
fi

# Count GFF files
GFF_COUNT=$(find gffs -maxdepth 1 -type f -name "*.gff" | wc -l)

echo "Found $GFF_COUNT GFF files."

if [ "$GFF_COUNT" -ne 27 ]; then
    echo "ERROR: Expected 27 GFF files but found $GFF_COUNT."
    exit 1
fi

echo "All 27 GFF files found."
echo "Starting Panaroo analysis..."

panaroo \
    -i gffs/*.gff \
    -o panaroo_results \
    --clean-mode strict \
    -a core

echo "=========================================="
echo "Panaroo completed successfully."
echo "Finished: $(date)"
echo "=========================================="

echo "Panaroo output:"
ls -lh panaroo_results/
