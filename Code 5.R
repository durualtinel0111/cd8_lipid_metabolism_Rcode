# Supplementary Code 5:
# GSVA Analysis of Lipid-Associated Pathways Using msigdbr and GSVA R Packages

# 1. Install required packages if not already installed
if (!requireNamespace("msigdbr", quietly = TRUE)) {
  if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
  }
  BiocManager::install("msigdbr")
}

if (!requireNamespace("GSVA", quietly = TRUE)) {
  BiocManager::install("GSVA")
}

# 2. Load required libraries
library(msigdbr)
library(GSVA)

# 3. Retrieve lipid-related gene sets from MSigDB for Homo sapiens
# Optionally filter gene sets related to lipid metabolism
lipid_sets <- msigdbr(species = "Homo sapiens")

# If needed, filter for lipid-specific gene sets, e.g. by keyword in gs_name or gs_description
lipid_gene_sets <- lipid_sets[grep("lipid", lipid_sets$gs_name, ignore.case = TRUE), ]

# 4. Convert gene sets to list format (gene_symbol vector per gene set)
gene_sets_list <- split(lipid_gene_sets$gene_symbol, lipid_gene_sets$gs_name)

# 5. Load or prepare your gene expression matrix:
# - rows: gene symbols (matching those in gene sets)
# - columns: samples
# Example:
# expr_matrix <- readRDS("normalized_logCPM_expression.rds")
# expr_matrix should be a numeric matrix

# 6. Run GSVA
gsva_results <- gsva(expr = expr_matrix, gset.idx.list = gene_sets_list, method = "gsva")

# gsva_results: matrix of enrichment scores (rows = gene sets, columns = samples)

# 7. Save or further analyze the GSVA scores as needed
# write.csv(gsva_results, file = "GSVA_lipid_pathways_scores.csv")
