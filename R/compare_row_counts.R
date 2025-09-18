compare_row_counts <- function(supposed_count_df, child_df, child_sheet_name = "") {
  return(
    rbind(
      supposed_count_df |> 
        left_join(
          child_df |> 
            group_by(KEY = PARENT_KEY) |>
            summarise(current_row_count = n()) |>
            mutate(KEY = as.character(KEY)),
          by = "KEY"
        ) |> 
        mutate(
          current_row_count = if_else(is.na(current_row_count), 0, current_row_count),
          issue = case_when(
            supposed_row_count > current_row_count ~ paste0("There is ", supposed_row_count - current_row_count, " missing row for the logged KEY in '", child_sheet_name, "' sheet"),
            supposed_row_count < current_row_count ~ paste0("There is ", current_row_count - supposed_row_count, " extra row for the logged KEY in '", child_sheet_name, "' sheet"),
            TRUE ~ "okay"
          ),
          sheet_name = child_sheet_name
        ) |>
        filter(issue != "okay") |>
        select(PARENT_KEY = KEY, issue, supposed_row_count, current_row_count, sheet_name), 
      
      child_df |> 
        group_by(KEY = PARENT_KEY) |>
        summarise(current_row_count = n()) |> 
        mutate(KEY = as.character(KEY)) |>
        left_join(
          supposed_count_df,
          by = "KEY"
        ) |> 
        mutate(
          supposed_row_count = if_else(is.na(supposed_row_count), 0, supposed_row_count),
          issue = case_when(
            supposed_row_count > current_row_count ~ paste0("There is ", supposed_row_count - current_row_count, " missing row for the logged KEY in '", child_sheet_name, "' sheet"),
            supposed_row_count < current_row_count ~ paste0("There is ", current_row_count - supposed_row_count, " extra row for the logged KEY in '", child_sheet_name, "' sheet"),
            TRUE ~ "okay"
          ),
          sheet_name = child_sheet_name
        ) |>
        filter(issue != "okay") |>
        select(PARENT_KEY = KEY, issue, supposed_row_count, current_row_count, sheet_name)
    ) |> distinct(PARENT_KEY, issue, sheet_name, .keep_all = T)
  )
}