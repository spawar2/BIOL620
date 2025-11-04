#Author: Pawar; Date: 08/29/2022; Purpose: Testing R script

# Install microarray packages
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("affy")

# Load the package affy
library(affy)

# Read CEL microarray files in R using library affy

# Setting the working directory
setwd("/Users/pawar/Desktop")

# Read the CEL files from current working directory
eset <- ReadAffy()

# Extracting expression values using following function
rma <- exprs(eset)

# Boxplot to view the expression of samples
boxplot(rma)

# Pre-processing/Normalization of the chips: Mas5.0, RMA, Quantile Normalization

# Install package oligo
if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager");BiocManager::install("oligo")

# Applying RMA normalizaton function
library(oligo)
celFiles = list.celfiles()
affyRaw <- read.celfiles(celFiles)
eset <- rma(affyRaw)
boxplot(eset)

# Differential gene expression analysis

# Control and Treatment: up regulation and down regulation.
# Fold change analysis: Treatment-Control

# GSM3097139_RNA1.CEL: Treatment; GSM3097140_RNA2.CEL: Control

rma_normalized <- exprs(eset)
Fold_change <- rma_normalized[,1] - rma_normalized[,2]

# Significant Threshold (up-regulated) >1.5 and (Down-regulated) <-1.5

Fold_change <- as.data.frame(Fold_change)
Up_regulated <- Fold_change[Fold_change > 1.5,]
Down_regulated <- Fold_change[Fold_change < -1.5,]











