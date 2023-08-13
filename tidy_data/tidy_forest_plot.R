source("tidy_data/calc_log_exp.R")

tidy_forest_plot <- function(chosen_genes){
  modelled_data <- log_reg_data(chosen_genes)
  modelled_data <- modelled_data %>%
                   mutate(mean_conf_int = (conf_low + conf_high) / 2) %>%
                   arrange(desc(mean_conf_int)) %>%
                   mutate(significance_label = ifelse(p_value_signif,
                                                      "High",
                                                      "Low"))
 }
