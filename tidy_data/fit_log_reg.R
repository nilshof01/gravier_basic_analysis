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