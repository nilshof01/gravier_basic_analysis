source("tidy_data/fit_log_reg.R")
log_reg_data <- function(chosen_genes){
  chosen_genes_log <- chosen_genes %>%
                      mutate(log2_expr_lvl = log2(expression))%>%
                      drop_na() %>%
                      filter_all(all_vars(!is.infinite(.))) 
  modelled_data <- chosen_genes_log %>%
                   nest_by(gene) %>% # Nest the data by gene
                   mutate(results = list(fit_model(data))) %>%  
                   unnest(cols = results) # Unnest the results
  return(modelled_data)
  }

                   
                   