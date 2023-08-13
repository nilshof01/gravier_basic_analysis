choose_genes <- function(table_gravier_long, seed = 123){
  set.seed(seed)  # for reproducibility
  selected_genes <- sample(unique(table_gravier_long$gene), 100)
  table_gravier_long <- table_gravier_long %>%
                        filter(gene %in% selected_genes)
  return(table_gravier_long)
}

