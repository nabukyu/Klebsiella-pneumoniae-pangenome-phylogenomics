#!/bin/bash

#SBATCH --job-name=download_reads
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=24:00:00
#SBATCH --output=download_%j.out
#SBATCH --error=download_%j.err

set -e

mkdir -p fastq_files

while read SAMPLE
do
    echo "Downloading $SAMPLE..."

    fasterq-dump --split-files "$SAMPLE" -O fastq_files/

    echo "$SAMPLE completed."
done < samples_id

echo "All downloads completed."
