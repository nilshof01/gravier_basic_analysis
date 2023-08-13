model_summaries <- chosen_genes %>%
  mutate(log2_expr_lvl = log2(expression))%>%
  drop_na() %>%
  filter_all(all_vars(!is.infinite(.))) 

    group_by(gene) %>%
      do(model = glm(outcome ~ log2_expr_lvl, data = ., family = binomial)) %>%
      mutate(model_summary = map(model, glance)) %>%
  select(-data, -model)



    fit_model <- function(data) {

      model <- glm(outcome ~ log2_expr_lvl, data = data, family = "binomial")
      tidied <- tidy(model)
      beta_estimate <- tidied$estimate[2]
      conf_low <- tidied$conf.int[2, 1]
      conf_high <- tidied$conf.int[2, 2]
      p_value_signif <- tidied$p.value[2] <= 0.05
      tibble(
        beta_estimate = beta_estimate,
        conf_low = conf_low,
        conf_high = conf_high,
        p_value_signif = p_value_signif
      )
    }
    
    
    fit_model <- function(data) {
      
      model <- glm(outcome ~ log2_expr_lvl, data = data, family = "binomial")
      tidied <- tidy(model)
      result <- tidied %>%
        filter(term == "log2_expr_lvl") %>%
        transmute(
          beta_estimate = estimate,
          conf_low = estimate - 1.96 * std.error, # 95% CI lower bound 
          conf_high = estimate + 1.96 * std.error, # 95% CI upper bound
          p_value_signif = p.value <= 0.05
        )
    }
    modelled_data <- model_summaries %>%
         nest_by(gene) %>%
         summarise(results = fit_model(model_summaries),
                   .groups = "drop") %>%
         unnest(cols = results)
                   
                   
                   