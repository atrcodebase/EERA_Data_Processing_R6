### merge information from main sheet to child-sheets  --------------------------------------------------------------------
## Tool 0: -----
clean_data.tool0$data <- clean_data.tool0$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")


# sheet = "Tool3_Classes"
for (sheet in names(clean_data.tool0)[c(2, 3, 4, 9)]) {
  clean_data.tool0[[sheet]] <- clean_data.tool0[[sheet]] |>
    mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
    left_join(select(clean_data.tool0$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
    select(any_of(meta_cols), everything())
}

for (sheet in names(clean_data.tool0)[c(5, 6, 7, 8)]) {
  clean_data.tool0[[sheet]] <- clean_data.tool0[[sheet]] |>
    mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
    left_join(select(clean_data.tool0$Tool1_Timetable_Year, any_of(c(meta_cols, "qa_log_status")), KEY) %>% mutate(KEY = as.character(KEY)), by = c("PARENT_KEY" = "KEY")) |>
    select(any_of(meta_cols), everything())
}

## Tool 1: ----- KDR
clean_data.tool1_kdr$data <- clean_data.tool1_kdr$data |>
  mutate(KEY = as.character(KEY)) %>% 
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

for(sheet in names(clean_data.tool1_kdr)[-1]){
  clean_data.tool1_kdr[[sheet]] <- clean_data.tool1_kdr[[sheet]] |>
    mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
    left_join(select(clean_data.tool1_kdr$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
    select(any_of(meta_cols), everything())
}

## Tool 1: -----
clean_data.tool1$data <- clean_data.tool1$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

for(sheet in names(clean_data.tool1)[-1]){
  clean_data.tool1[[sheet]] <- clean_data.tool1[[sheet]] |>
    mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
    left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
    select(any_of(meta_cols), everything())
}

## Tool 2: -----
clean_data.tool2$data <- clean_data.tool2$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

for(sheet in names(clean_data.tool2)[-1]){
  clean_data.tool2[[sheet]] <- clean_data.tool2[[sheet]] |>
    mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
    left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
    select(any_of(meta_cols), everything())
}

## Tool 3: -----
clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

for(sheet in names(clean_data.tool3)[-1]){
  clean_data.tool3[[sheet]] <- clean_data.tool3[[sheet]] |>
    mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
    left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
    select(any_of(meta_cols), everything())
}

## Tool 4: -----
clean_data.tool4$data <- clean_data.tool4$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

for(sheet in names(clean_data.tool4)[-1]){
  clean_data.tool4[[sheet]] <- clean_data.tool4[[sheet]] |>
    mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
    left_join(select(clean_data.tool4$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
    select(any_of(meta_cols), everything())
}

## Tool 5: -----
clean_data.tool5$data <- clean_data.tool5$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

for(sheet in names(clean_data.tool5)[-1]){
  clean_data.tool5[[sheet]] <- clean_data.tool5[[sheet]] |>
    mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
    left_join(select(clean_data.tool5$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
    select(any_of(meta_cols), everything())
}

## Tool 6: -----
clean_data.tool6$data <- clean_data.tool6$data |>
  left_join(
    bind_rows(
      qa_sheet_ps |> select(KEY, qa_log_status = qa_status),
      qa_sheet_cbe |> select(KEY, qa_log_status = qa_status)
      ), by = "KEY")

clean_data.tool6$Subjects_Added <- clean_data.tool6$Subjects_Added |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool6$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

## Tool 7: -----
clean_data.tool7$data <- clean_data.tool7$data |>
  left_join(
    bind_rows(
      qa_sheet_ps |> select(KEY, qa_log_status = qa_status),
      qa_sheet_cbe |> select(KEY, qa_log_status = qa_status)
    ), by = "KEY")

clean_data.tool7$C6_list_members <- clean_data.tool7$C6_list_members |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool7$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool7$Subjects_Added <- clean_data.tool7$Subjects_Added |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool7$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

## Tool 8: -----
clean_data.tool8$data <- clean_data.tool8$data |>
  mutate(KEY = as.character(KEY)) %>% 
  left_join(qa_sheet_cbe |> select(KEY, qa_log_status = qa_status), by = "KEY")

for(sheet in names(clean_data.tool8)[-1]){
  clean_data.tool8[[sheet]] <- clean_data.tool8[[sheet]] |>
    mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
    left_join(select(clean_data.tool8$data, any_of(meta_cols), IP_Name, KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
    select(any_of(meta_cols), everything())
}


## Tool 9: -----
clean_data.tool9$data <- clean_data.tool9$data |>
  mutate(KEY = as.character(KEY)) %>% 
  left_join(qa_sheet_cbe |> select(KEY, qa_log_status = qa_status), by = "KEY")

clean_data.tool9$Questions_Repeat <- clean_data.tool9$Questions_Repeat |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool9$data, any_of(meta_cols), IP_Name, KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool9$Relevant_photos <- clean_data.tool9$Relevant_photos |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool9$data, any_of(meta_cols), IP_Name, KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

