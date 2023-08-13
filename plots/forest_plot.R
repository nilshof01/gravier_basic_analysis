source("~/gravier_basic_analysis/tidy_data/tidy_forest_plot.R")

create_forest_plot <- function(chosen_genes){
  modelled_data <- tidy_forest_plot(chosen_genes)
  y_min_limit <- min(min(modelled_data$conf_low),
                     -max(modelled_data$conf_high))
  y_max_limit <- max(max(modelled_data$conf_high),
                     -min(modelled_data$conf_low))
  forest_plot <- ggplot(modelled_data,
                 aes(x = reorder(gene, -mean_conf_int),
                     y = beta_estimate,
                     ymin = conf_low,
                     ymax = conf_high,
                     color = as.factor(significance_label))) +
                geom_errorbar() +
                geom_hline(yintercept = 0,
                           color = "black") + 
                coord_flip() +
                scale_color_manual(values = c("High" = "#F58518",
                                              "Low" = "#4C78A8"),
                                   name = "Significance") +
                labs(x = "Gene ID",
                     y = "Change in log odds") +
                ylim(y_min_limit, y_max_limit) +
                theme(panel.background = element_rect(fill = "white",
                                                      colour = "grey50"),
                      panel.grid.major.x = element_line(color = "gray"),
                      plot.title = element_text(hjust = 0.5, size = 16),
                      axis.text.y = element_text(size = 5)) +
                ggtitle("Significance of log expressions for listed genes")
  return(forest_plot)
 }


