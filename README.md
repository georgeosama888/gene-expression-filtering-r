# Gene Expression Filtering in R

This project analyzes gene-expression values for two conditions:

- Control
- Treated

It calculates the fold change for each gene, selects genes with a fold change greater than 1.5, and classifies every gene as upregulated, downregulated, or stable.

## Files

- `gene_analysis.R`: The main R script.
- `results.txt`: The output generated after running the script.
- `README.md`: Instructions for running the project.

## Requirements

- R
- RStudio is optional but recommended.

No additional R packages are required.

## How to Run in RStudio

1. Open RStudio.
2. Open `gene_analysis.R`.
3. Make sure the working directory is the project folder.
4. Click **Source** to run the complete script.

You can check the current working directory using:

```r
getwd()
```

If necessary, change it using:

```r
setwd("path/to/project/folder")
```

## How to Run from the Terminal

Open the terminal inside the project folder and run:

```bash
Rscript gene_analysis.R
```

## Analysis Steps

The script performs the following steps:

1. Stores gene names and expression values in vectors.
2. converts `control` and `treated` into named vectors.
3. Calculates fold change using:

```text
fold_change = treated / control
```

4. Selects genes where:

```text
fold_change > 1.5
```

5. Creates a gene-by-condition expression matrix.
6. Calculates the mean expression of each gene using `rowMeans()`.
7. Classifies each gene according to these rules:

| Fold-change condition | Classification |
|---|---|
| Greater than 1.2 | upregulated |
| Less than 0.8 | downregulated |
| Between 0.8 and 1.2 | stable |

8. Saves the final results in `results.txt`.

## Expected Genes with Fold Change Greater Than 1.5

- BRCA1
- EGFR
- KRAS

## Output Columns

The `results.txt` file contains:

- `gene`: Gene name.
- `control`: Expression in the control condition.
- `treated`: Expression in the treated condition.
- `fold_change`: Treated expression divided by control expression.
- `mean_expression`: Mean expression across the two conditions.
- `classification`: Expression-change category.

## Biological Note

This is a simplified educational example. Real RNA-seq differential-expression analysis normally requires biological replicates, normalization, and statistical tools such as DESeq2 or edgeR.
