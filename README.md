# Klebsiella pneumoniae Pangenome and Phylogenomics

Pangenome and phylogenomic analysis of Klebsiella pneumoniae

## Project Overview

This project investigates the genomic diversity, pangenome structure, and phylogenetic relationships of *Klebsiella pneumoniae* isolates.

The analysis combines genome annotation, pangenome analysis, core-gene alignment, and phylogenomic analysis to characterize relationships among the studied isolates.

## Study Dataset

The current dataset consists of **27 assembled *Klebsiella pneumoniae* genomes**.

## Analysis Workflow

```text
Genome assemblies
        ↓
Prokka genome annotation
        ↓
Annotated GFF files
        ↓
Panaroo pangenome analysis
        ↓
Core-gene identification and alignment
        ↓
Maximum-likelihood phylogenetic analysis
        ↓
Tree visualization and annotation
        ↓
Genomic interpretation

```
## Software

| Tool         | Version         | Purpose                     |
| ------------ | --------------- | --------------------------- |
| fasterq-dump | 3.4.1           | Down loading samples        |
| FastQC       | 0.12.1          | Read QC                     |
| multiqc      | 1.34            | Read QC aggregation         |
| SPAdes       | 4.2.0           | Genome assembly             |
| QUAST        | 5.3.0           | Assembly QC                 |
| kleborate    | 3.2.4           | Species/AMR/virulence       |
| Prokka       | 1.15.6          | Genome annotation           |
| Panaroo      | 1.8.0           | Pangenome analysis          |
| MAFFT        | 7.525           | Multiple sequence alignment |
| IQ-TREE      | 3.1.3           | Phylogenetic inference      |
| iTOL         | Web-based       | Tree visualization          |

## Current Progress

- [x] Genome assemblies prepared
- [x] 27 genomes annotated with Prokka
- [x] 27 GFF files generated
- [x] GFF files prepared for Panaroo
- [x] Panaroo pangenome analysis
- [x] Core-gene alignment
- [x] Maximum-likelihood phylogenetic tree
- [x] Bootstrap analysis
- [ ] Tree visualization and annotation
- [ ] Integration with genomic metadata
- [ ] Final genomic interpretation
 
## Repository Structure

```text
Klebsiella-pneumoniae-pangenome-phylogenomics/
│
├── README.md
│
├── scripts/
    └── download_reads.sh
    └── qc_reads.sh
    └── assemble_spades.sh
    └── qc_assemblies_quast.sh
    └── kleborate_script.sh
    └── prokka_script.sh
    └── panaroo_script.sh
    └── iqtree_script.sh
 
├── docs/
│   └── analysis_notes.md
│
└── results/
    └── README.md
```
## Reproducibility

Analysis scripts and documentation are maintained in this repository to document the computational workflow and support reproducibility.

Large genomic datasets and intermediate analysis files are not stored in this repository.

## Project Status

Analysis in progress

## Author

Martha Nabukyu

Bioinformatics | Microbial Genomics | Antimicrobial Resistance
