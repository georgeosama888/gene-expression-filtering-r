gene_names <- c("BRCA1", "TP53", "EGFR", "MYC", "PTEN", "KRAS")
control <- c(5.2, 7.8, 3.1, 9.4, 6.0, 4.5)
treated <- c(8.9, 7.6, 6.7, 12.1, 2.3, 9.8)

names(control) <- gene_names
names(treated) <- gene_names

fold_change <- treated / control
high_fc_genes <- gene_names[fold_change > 1.5]
high_fc_values <- fold_change[fold_change > 1.5]
expression_matrix <- matrix(c(control, treated),
                            nrow = length(gene_names),
                            ncol = 2,
                            dimnames = list(gene_names,
                                            c("control","treated")
                                            )
                            )
mean_expression <- rowMeans(expression_matrix)
classification_text <- ifelse(
  fold_change >1.2,
  "upregulated",
  ifelse(
    fold_change < 0.8,
    "downregulated",
    "stable"
  )
)
classification <- factor(
  classification_text,
  levels = c(
    "downregulated",
    "stable",
    "upregulated"
  ) 
)
results <- data.frame(
  gene = gene_names,
  control = (control),
  treated = (treated),
  fold_change = round(fold_change, 4 ),
  mean_expression = round(mean_expression, 4 ),
  classification = classification,
  row.names = NULL
)
high_fc_results <- data.frame(
  gene = high_fc_genes,
  fold_change = round(high_fc_values,4),
  row.names = NULL
)
print(results)
cat("\nGenes with fold change > 1.5:\n")
print(high_fc_results)
write.table(
  results,
  file = "results.txt",
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)
cat("Gene expression analysis completed.\n")
cat("Results saved to results.txt\n")
