wrangle_gravier <- function(table_gravier){
  table_gravier <- table_gravier %>%
                    relocate(y,
                             .before = everything()) %>%
                    rename(outcome = y) %>%
                    mutate(outcome = recode(outcome,
                                            "good" = 0,
                                            "poor" = 1)) %>%
                    unnest(cols = x) %>%
                    pivot_longer(-outcome, names_to = "gene", values_to = "expression")
  return(table_gravier)
}

