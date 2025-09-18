create_bi_cols_lab <- function(df, sm_col, sep){
  df[[sm_col]] <- as.character(df[[sm_col]])
  
  df_long <- df %>% 
    filter(!is.na(!!sym(sm_col))) %>% 
    select(KEY, !!sym(sm_col)) %>% 
    separate_rows(!!sym(sm_col), sep = sep)
  
  df_wide <- df_long %>% 
    mutate(value = 1) %>%
    pivot_wider(names_from = !!sym(sm_col), values_from = value, values_fill = list(value = 0),  names_prefix = paste0(sm_col,"_")) 
  
  result <- df %>% 
    left_join(
      df_wide, by = "KEY"
    )
  
  return(result)
}


create_bi_cols_name <- function(df, sm_col, sep){
  df[[sm_col]] <- as.character(df[[sm_col]])
  
  df_long <- df %>% 
    filter(!is.na(!!sym(sm_col))) %>% 
    select(KEY, !!sym(sm_col)) %>% 
    separate_rows(!!sym(sm_col), sep = sep)
  
  df_wide <- df_long %>% 
    mutate(value = 1) %>%
    pivot_wider(names_from = !!sym(sm_col), values_from = value, values_fill = list(value = 0),  names_prefix = paste0(sm_col,"_")) 
  
  result <- df %>% 
    left_join(
      df_wide, by = "KEY"
    )
  
  return(result)
}