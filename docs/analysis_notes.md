# Analysis Notes

## Project

**Project:** *Klebsiella pneumoniae* Pangenome and Phylogenomics

**Author:** Martha Nabukyu

**Dataset:** 27 assembled *Klebsiella pneumoniae* genomes

**Analysis environment:** HPC

---

## 1. Project Objective

The project aims to investigate the genomic diversity, pangenome structure, and phylogenetic relationships of *Klebsiella pneumoniae* isolates.

The computational workflow includes genome annotation, pangenome analysis, core-gene alignment, maximum-likelihood phylogenetic inference, and integration of relevant genomic metadata.

---

## 2. Dataset

The current dataset contains 27 assembled *Klebsiella pneumoniae* genomes in FASTA format.

The genome assemblies consist of contigs and were used as input for genome annotation.

---

## 3. Genome Annotation

### Tool

**Prokka version:** 1.15.6

### Input

27 assembled genome FASTA files.

### Output

The genomes were annotated using both a SLURM batch workflow and manual Prokka runs on the HPC.

The initial SLURM job did not complete within the allocated walltime, which was subsequently increased. The annotation was subsequently completed manually for the individual genomes.

Each genome was independently annotated using Prokka, producing GFF files and other annotation outputs.

A total of **27 GFF files** were generated.

### Purpose

The Prokka annotations provide standardized gene and feature information required for downstream pangenome analysis with Panaroo.

---

## 4. Pangenome Analysis

### Tool

**Panaroo version:** 1.8.0

### Input

27 Prokka-generated GFF files. The initial Panaroo job reached the time limit during core-gene alignment.

A second run was subsequently submitted with an increased walltime of 72 hours.

The current Panaroo analysis is ongoing.

### Parameters

The Panaroo analysis was configured using:

```text
--clean-mode strict
-a core

```

## 5. Planned Core-Genome Phylogenetic Analysis

Following successful completion of the Panaroo analysis, the core-gene alignment will be used for phylogenetic inference.

The planned workflow is:

Panaroo core-gene alignment
        ↓
Alignment quality assessment
        ↓
IQ-TREE model selection
        ↓
Maximum-likelihood tree inference
        ↓
Bootstrap analysis
        ↓
Tree visualization using iTOL

## 6. Planned Downstream Analyses

The resulting phylogenetic tree will be interpreted together with relevant genomic and epidemiological metadata where available.

Planned analyses include assessment of:

-Antimicrobial resistance-associated genes

-Virulence-associated genes

-Plasmid-associated features

-Phylogenetic clustering

-Relationships between genomic features and phylogenetic groups

## 7. Reproducibility

Analysis scripts are maintained in the GitHub repository:

Klebsiella-pneumoniae-pangenome-phylogenomics

The repository contains the scripts used for genome annotation and pangenome analysis.

Large genomic datasets and intermediate analysis files are not stored in the repository.

## 8. Analysis Log

### 2026-09-22

-GitHub repository connected to the HPC using SSH authentication.

-Prokka analysis scripts added to the repository.

-Panaroo analysis script added to the repository.

-Project README updated and pushed to GitHub.

-Analysis notes initiated.

-Panaroo analysis currently ongoing.
