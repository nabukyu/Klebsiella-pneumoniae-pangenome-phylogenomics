#!/bin/bash

#SBATCH --job-name=iqtree_kp
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=72:00:00
#SBATCH --output=iqtree_%j.out
#SBATCH --error=iqtree_%j.err

set -e

# Load IQ-TREE
module load iqtree/3.1.3--h8471819_0

# Input alignment
ALIGNMENT="core_gene_alignment_filtered.aln"

# Output directory
OUTPUT_DIR="phylogeny"

# Check input
if [ ! -f "$ALIGNMENT" ]; then
    echo "ERROR: Alignment file '$ALIGNMENT' does not exist."
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

# Run IQ-TREE
iqtree3 \
    -s "$ALIGNMENT" \
    -m MFP \
    -B 1000 \
    -T AUTO \
    --prefix "$OUTPUT_DIR/kp_core"

echo "IQ-TREE analysis completed"

