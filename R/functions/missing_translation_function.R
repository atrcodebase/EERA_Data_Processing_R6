missing_translation_func <- function(data, KEY) {
  data %>% 
    mutate(across(everything(), function(x)
      x = as.character(x)
    )) %>% 
    pivot_longer(-KEY, names_to = "question_name", values_to = "old_value") %>% 
    filter(grepl("[^\u0001-\u007F]+", old_value)) %>%
    mutate(new_value = NA, changed = "No", DM_comment = "Missing translation") %>% 
    relocate(KEY, .before = DM_comment)
}

log_translation_cols <- function(data, other_cols, key_col = "KEY") {
  if (any(other_cols %in% names(data))) {
    data |> 
      select(any_of(other_cols), all_of(key_col)) |> 
      pivot_longer(
        cols = -all_of(key_col),
        names_to = "question_name",
        values_to = "old_value"
      ) |>
      filter(!is.na(old_value) & old_value != "")
  }
}
