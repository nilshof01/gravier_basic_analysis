source("augment_data/dependencies.R")
source("augment_data/upload_data.R")
source("augment_data/augment_table.R")
source("augment_data/choose_random_genes.R")

gravier_table <- load_data_as_tibble()
gravier_table_long <- wrangle_gravier(gravier_table)
chosen_genes <- choose_genes(gravier_table_long,
                             seed = 123)

