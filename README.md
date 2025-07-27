# cd8_lipid_metabolism_Rcode
Supplementary R Code for the manuscript: "Lipid Metabolic Reprogramming Drives CD8⁺ T Cell Exhaustion in PD-L1⁺ NSCLC: A Systems Biology and Causal Inference Approach"
# cd8_lipid_metabolism_gsva

**Supplementary R Code** for the manuscript:  
**"Lipid Metabolic Reprogramming Drives CD8⁺ T Cell Exhaustion in PD-L1⁺ NSCLC: A Systems Biology and Causal Inference Approach"**

## Overview

This repository contains a single R script (`Code 5.R`) used for **Gene Set Variation Analysis (GSVA)** of lipid-associated pathways in CD8⁺ T cells. This analysis supports the pathway-level enrichment profiling described in the associated manuscript.

## File Description

- `Code 5.R`:  
  Performs GSVA using curated gene sets related to lipid accumulation, degradation, and exhaustion-associated metabolic reprogramming. Input data should be log2-transformed gene expression matrices.

## Requirements

This script requires the following R packages:

- `GSVA`  
- `GSEABase`  
- `limma`  
- `Biobase`

You can install them via Bioconductor:

```R
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install(c("GSVA", "GSEABase", "limma", "Biobase"))
