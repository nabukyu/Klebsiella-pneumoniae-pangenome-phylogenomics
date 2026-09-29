#!/bin/bash

#SBATCH --job-name=spades_batch
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=24:00:00
#SBATCH --output=spades_%j.out
#SBATCH --error=spades_%j.err

set -e

source ~/miniconda3/etc/profile.d/conda.sh
conda activate spades_env

mkdir -p new_assemblies

for R1 in new_fastqs/*_1.fastq.gz
do
    SAMPLE=$(basename "$R1" _1.fastq.gz)

    R2="new_fastqs/${SAMPLE}_2.fastq.gz"
    OUTDIR="new_assemblies/${SAMPLE}"

    echo "Running SPAdes for $SAMPLE..."

    spades.py \
        -1 "$R1" \
        -2 "$R2" \
        -o "$OUTDIR" \
        --threads 4 \
        --memory 16

    echo "$SAMPLE completed."
    echo "---------------------"
done

echo "All assemblies completed."
