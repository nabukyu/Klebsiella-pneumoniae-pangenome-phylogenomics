#!/bin/bash

#SBATCH --job-name=read_qc
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=12:00:00
#SBATCH --output=read_qc_%j.out
#SBATCH --error=read_qc_%j.err

set -e

mkdir -p fastqc_results
mkdir -p multiqc_results

fastqc \
    fastq_files/*.fastq \
    -o fastqc_results \
    -t 4

multiqc \
    fastqc_results/ \
    -o multiqc_results

echo "Read quality control completed."
