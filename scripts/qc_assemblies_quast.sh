#!/bin/bash

#SBATCH --job-name=quast
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=12:00:00
#SBATCH --output=quast_%j.out
#SBATCH --error=quast_%j.err

set -e

mkdir -p quast_results

quast.py \
    new_assemblies/*/contigs.fasta \
    -r reference.fasta \
    -o quast_results \
    -t 8

echo "Assembly quality assessment completed."
