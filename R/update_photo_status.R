check_logs_for_df <- function(cleaning_log, df, tool_name, deleted_keys) {
  # Log issues in all the sheets
  # sheet = "data"
  for(sheet in names(df)){
    question_names <- names(df[[sheet]]) # All Columns
    keys <- df[[sheet]][["KEY"]] # Keys
    
    # Flag if question or key is not in dataset
    tool_sheet_indexes <- (cleaning_log$Tool %in% tool_name & cleaning_log$Tab_Name %in% sheet) # Logs for the current tool and sheet
    cleaning_log$issue[tool_sheet_indexes & cleaning_log$Question %notin% question_names] <- "Question can't be found in the given sheet"
    cleaning_log$issue[tool_sheet_indexes & cleaning_log$KEY_Unique %notin% keys] <- "KEY can't be found in the given sheet"
  }
  return(cleaning_log)
}

form_names_ps <- unique(photo_status_ps$Tool) |> na.omit()
form_names_cbe <- unique(photo_status_cbe$Tool) |> na.omit()

form_names_ps
form_names_cbe


# Aligning New_Value of text in order to apply along with photo status -------------
photo_status_ps <- photo_status_ps %>% 
  mutate(
    New_Value = as.character(New_Value),
    New_Value = case_when(
      Check_Type == "image" ~ Check_Status,
      TRUE ~ New_Value
    ),
    Question_A = Question,
    Question = case_when(
      Check_Type == "image" & !(Question == "C11" & Tool == "Tool 5 - WASH Tool") ~ paste0(Question, "_QA"),
      Check_Type == "image" & Question == "C11" & Tool == "Tool 5 - WASH Tool" ~ paste0(Question, "_1_QA"),
      TRUE ~ Question
    )
  )

photo_status_cbe <- photo_status_cbe %>% 
  mutate(
    New_Value = case_when(
      Check_Type == "image" ~ Check_Status,
      TRUE ~ New_Value
    ),
    Question_A = Question,
    Question = case_when(
      Check_Type == "image" ~ paste0(Question, "_QA"),
      TRUE ~ Question
    )
  )


# Reviewing the Photo Status log ------------------------------------------------- PS
# Identify log's issue
photo_status_issues_ps <- photo_status_ps |>
  mutate(
    issue = case_when(
      # general checks
      is.na(KEY_Unique) | KEY_Unique == "" ~ "KEY can't be null, please provide the correct KEY.",
      is.na(Question) | Question == "" ~ "Question name can't be null, please provide the correct question name.",
      is.na(Tool) | Tool == "" ~ "Tool name can't be null, please provide the correct tool name.",
      is.na(Tab_Name) | Tab_Name == "" ~ "Tab/Sheet name can't be null, please provide the correct Tab name.",
      !Tool %in% form_names_ps ~ "Wrong tool name, please provide the correct tool name.", # Not necessary
      Tool == "Tool 1 - Headmaster Interview" & Province != "Kandahar" & !Tab_Name %in% names(raw_data.tool1) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      Tool == "Tool 1 - Headmaster Interview" & Province == "Kandahar" & !Tab_Name %in% names(raw_data.tool1_kdr) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      Tool == "Tool 2 - Light Tool" & !Tab_Name %in% names(raw_data.tool2) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      Tool == "Tool 3 - Student Document & Headcount" & !Tab_Name %in% names(raw_data.tool3) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      Tool == "Tool 4 - Teacher Tool" & !Tab_Name %in% names(raw_data.tool4) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      Tool == "Tool 5 - WASH Tool" & !Tab_Name %in% names(raw_data.tool5) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      Tool == "Tool 6 - Parent Tool" & !Tab_Name %in% names(raw_data.tool6) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      Tool == "Tool 7 - Shura Tool" & !Tab_Name %in% names(raw_data.tool7) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      duplicated(paste0(KEY_Unique, Question), fromLast = T) | duplicated(paste0(KEY_Unique, Question), fromLast = F) ~ "Duplicate log records, please solve the duplication.",
      TRUE ~ NA_character_
    ),
    Sample_Type = "Public School"
  ) |> 
  select(KEY_Unique, Question, New_Value, issue, Tool, Tab_Name, Sample_Type, Province)

# Log incorrect sheet name and UUIDs
photo_status_issues_ps_kdr <- photo_status_issues_ps %>% 
  filter(Province == "Kandahar" & Tool == "Tool 1 - Headmaster Interview")

photo_status_issues_ps <- photo_status_issues_ps %>% 
  filter(!(Province == "Kandahar" & Tool == "Tool 1 - Headmaster Interview"))

photo_status_issues_ps_kdr <- photo_status_issues_ps_kdr |> check_logs_for_df(df = raw_data.tool1_kdr, tool_name = "Tool 1 - Headmaster Interview", deleted_keys = deleted_keys_ps)

photo_status_issues_ps <- photo_status_issues_ps |> check_logs_for_df(df = raw_data.tool1, tool_name = "Tool 1 - Headmaster Interview", deleted_keys = deleted_keys_ps)
photo_status_issues_ps <- photo_status_issues_ps |> check_logs_for_df(df = raw_data.tool2, tool_name = "Tool 2 - Light Tool", deleted_keys = deleted_keys_ps)
photo_status_issues_ps <- photo_status_issues_ps |> check_logs_for_df(df = raw_data.tool3, tool_name = "Tool 3 - Student Document & Headcount", deleted_keys = deleted_keys_ps)
photo_status_issues_ps <- photo_status_issues_ps |> check_logs_for_df(df = raw_data.tool4, tool_name = "Tool 4 - Teacher Tool", deleted_keys = deleted_keys_ps)
photo_status_issues_ps <- photo_status_issues_ps |> check_logs_for_df(df = raw_data.tool5, tool_name = "Tool 5 - WASH Tool", deleted_keys = deleted_keys_ps)
photo_status_issues_ps <- photo_status_issues_ps |> check_logs_for_df(df = raw_data.tool6, tool_name = "Tool 6 - Parent Tool", deleted_keys = deleted_keys_ps)
photo_status_issues_ps <- photo_status_issues_ps |> check_logs_for_df(df = raw_data.tool7, tool_name = "Tool 7 - Shura Tool", deleted_keys = deleted_keys_ps)


photo_status_issues_ps <- bind_rows(photo_status_issues_ps, photo_status_issues_ps_kdr)
## Correction Log ready to apply
photo_status_ready_ps <- photo_status_issues_ps |>
  filter(is.na(issue))

## Correction Log issues
photo_status_issues_ps <- photo_status_issues_ps |>
  filter(!is.na(issue)) |>
  arrange(KEY_Unique, Question)


# Reviewing the Photo Status log ------------------------------------------------- CBE
# Identify log's issue
photo_status_issues_cbe <- photo_status_cbe |>
  mutate(
    issue = case_when(
      # general checks
      is.na(KEY_Unique) | KEY_Unique == "" ~ "KEY can't be null, please provide the correct KEY.",
      is.na(Question) | Question == "" ~ "Question name can't be null, please provide the correct question name.",
      is.na(Tool) | Tool == "" ~ "Tool name can't be null, please provide the correct tool name.",
      is.na(Tab_Name) | Tab_Name == "" ~ "Tab/Sheet name can't be null, please provide the correct Tab name.",
      !Tool %in% form_names_cbe ~ "Wrong tool name, please provide the correct tool name.", # Not necessary
      Tool == "Tool 6 - Parent Tool" & !Tab_Name %in% names(raw_data.tool6) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      Tool == "Tool 7 - Shura Tool" & !Tab_Name %in% names(raw_data.tool7) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      Tool == "Tool 8 - CBE Teacher Tool" & !Tab_Name %in% names(raw_data.tool8) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      Tool == "Tool 9 - IP Level" & !Tab_Name %in% names(raw_data.tool9) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      duplicated(paste0(KEY_Unique, Question), fromLast = T) | duplicated(paste0(KEY_Unique, Question), fromLast = F) ~ "Duplicate log records, please solve the duplication.",
      TRUE ~ NA_character_
    ),
    Sample_Type = "CBE", 
  ) |> 
  select(KEY_Unique, Question, New_Value, issue, Tool, Tab_Name, Sample_Type)

# Log incorrect sheet name and UUIDs
photo_status_issues_cbe <- photo_status_issues_cbe |> check_logs_for_df(df = raw_data.tool6, tool_name = "Tool 6 - Parent Tool", deleted_keys = deleted_keys_cbe)
photo_status_issues_cbe <- photo_status_issues_cbe |> check_logs_for_df(df = raw_data.tool7, tool_name = "Tool 7 - Shura Tool", deleted_keys = deleted_keys_cbe)
photo_status_issues_cbe <- photo_status_issues_cbe |> check_logs_for_df(df = raw_data.tool8, tool_name = "Tool 8 - CBE Teacher Tool", deleted_keys = deleted_keys_cbe)
photo_status_issues_cbe <- photo_status_issues_cbe |> check_logs_for_df(df = raw_data.tool9, tool_name = "Tool 9 - IP Level", deleted_keys = deleted_keys_cbe)

## Correction Log ready to apply
photo_status_ready_cbe <- photo_status_issues_cbe |>
  filter(is.na(issue))

## Correction Log issues
photo_status_issues_cbe <- photo_status_issues_cbe |>
  filter(!is.na(issue)) |>
  arrange(KEY_Unique, Question)

# Align column names -----------------------------------------------------------
photo_status_ready_ps <- photo_status_ready_ps %>%
  rename(
    new_value = New_Value,
    question = Question,
    KEY = KEY_Unique
  )

photo_status_ready_cbe <- photo_status_ready_cbe %>%
  rename(
    new_value = New_Value,
    question = Question,
    KEY = KEY_Unique
  )

clean_data.tool1_kdr <- raw_data.tool1_kdr
clean_data.tool1 <- raw_data.tool1
clean_data.tool2 <- raw_data.tool2
clean_data.tool3 <- raw_data.tool3
clean_data.tool4 <- raw_data.tool4
clean_data.tool5 <- raw_data.tool5
clean_data.tool6 <- raw_data.tool6
clean_data.tool7 <- raw_data.tool7
clean_data.tool8 <- raw_data.tool8
clean_data.tool9 <- raw_data.tool9


# Apply logs -------------------------------------------------------------------
# Tool 1 KDR
tool_name <- "Tool 1 - Headmaster Interview"
for(sheet in names(raw_data.tool1_kdr)){
  # Apply Log
  clean_data.tool1_kdr[[sheet]] <- clean_data.tool1_kdr[[sheet]] |>
    mutate(
      across(ends_with("_QA"), as.character)
    )
  
  raw_data.tool1_kdr[[sheet]] <- raw_data.tool1_kdr[[sheet]] |>
    mutate(
      across(ends_with("_QA"), as.character)
    )
  
  clean_data.tool1_kdr[[sheet]] <- apply_log(data=raw_data.tool1_kdr[[sheet]], 
                                           log = photo_status_ready_ps %>% filter(Province == "Kandahar" & Tool == tool_name & Tab_Name == sheet))
}

# Tool 1
if (any(photo_status_ready_ps$Tool == tool_name)) {
  for(sheet in names(raw_data.tool1)){
    clean_data.tool1[[sheet]] <- clean_data.tool1[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    raw_data.tool1[[sheet]] <- raw_data.tool1[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    clean_data.tool1[[sheet]] <- apply_log(data=raw_data.tool1[[sheet]], 
                                         log = photo_status_ready_ps %>% filter(Province != "Kandahar" & Tool == tool_name & Tab_Name == sheet))
  }
}

# Tool 2
tool_name <- "Tool 2 - Light Tool"
if (any(photo_status_ready_ps$Tool == tool_name)) {
  for(sheet in names(raw_data.tool2)){
    clean_data.tool2[[sheet]] <- clean_data.tool2[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    raw_data.tool2[[sheet]] <- raw_data.tool2[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    clean_data.tool2[[sheet]] <- apply_log(data=raw_data.tool2[[sheet]], log = filter(photo_status_ready_ps, Tool == tool_name & Tab_Name == sheet))
  }
}

# Tool 3
tool_name <- "Tool 3 - Student Document & Headcount"
if (any(photo_status_ready_ps$Tool == tool_name)) {
  for(sheet in names(raw_data.tool3)){
    clean_data.tool3[[sheet]] <- clean_data.tool3[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    raw_data.tool3[[sheet]] <- raw_data.tool3[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    clean_data.tool3[[sheet]] <- apply_log(data=raw_data.tool3[[sheet]], log = filter(photo_status_ready_ps, Tool == tool_name & Tab_Name == sheet))
  }
}

# Tool 4
tool_name <- "Tool 4 - Teacher Tool"
if (any(photo_status_ready_ps$Tool == tool_name)) {
  for(sheet in names(raw_data.tool4)){
    clean_data.tool4[[sheet]] <- clean_data.tool4[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    raw_data.tool4[[sheet]] <- raw_data.tool4[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    clean_data.tool4[[sheet]] <- apply_log(data=raw_data.tool4[[sheet]], log = filter(photo_status_ready_ps, Tool == tool_name & Tab_Name == sheet))
  }
}

# Tool 5
tool_name <- "Tool 5 - WASH Tool"
if (any(photo_status_ready_ps$Tool == tool_name)) {
  # sheet = "data"
  for(sheet in names(raw_data.tool5)){
    
    clean_data.tool5[[sheet]] <- clean_data.tool5[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    raw_data.tool5[[sheet]] <- raw_data.tool5[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    clean_data.tool5[[sheet]] <- apply_log(data=raw_data.tool5[[sheet]], log = filter(photo_status_ready_ps, Tool == tool_name & Tab_Name == sheet))
  }
}

# Tool 6
tool_name <- "Tool 6 - Parent Tool"
if (any(photo_status_ready_ps$Tool == tool_name)) {
  for(sheet in names(raw_data.tool6)){
    
    clean_data.tool6[[sheet]] <- clean_data.tool6[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    raw_data.tool6[[sheet]] <- raw_data.tool6[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    
    clean_data.tool6[[sheet]] <- apply_log(data=raw_data.tool6[[sheet]], log = filter(photo_status_ready_ps, Tool == tool_name & Tab_Name == sheet))
  }
}

if (any(photo_status_ready_cbe$Tool == tool_name)) {
  for(sheet in names(raw_data.tool6)){
    clean_data.tool6[[sheet]] <- apply_log(data=clean_data.tool6[[sheet]], log = filter(photo_status_ready_cbe, Tool == tool_name & Tab_Name == sheet))
  }
}

# Tool 7
tool_name <- "Tool 7 - Shura Tool"
if (any(photo_status_ready_ps$Tool == tool_name)) {
  for(sheet in names(raw_data.tool7)){
    clean_data.tool7[[sheet]] <- clean_data.tool7[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    raw_data.tool7[[sheet]] <- raw_data.tool7[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    clean_data.tool7[[sheet]] <- apply_log(data=raw_data.tool7[[sheet]], log = filter(photo_status_ready_ps, Tool == tool_name & Tab_Name == sheet))
  }
}

if (any(photo_status_ready_cbe$Tool == tool_name)) {
  for(sheet in names(clean_data.tool7)){
    clean_data.tool7[[sheet]] <- apply_log(data=clean_data.tool7[[sheet]], log = filter(photo_status_ready_cbe, Tool == tool_name & Tab_Name == sheet))
  }
}

# Tool 8
tool_name <- "Tool 8 - CBE Teacher Tool"
if (any(photo_status_ready_cbe$Tool == tool_name)) {
  for(sheet in names(raw_data.tool8)){
    clean_data.tool8[[sheet]] <- clean_data.tool8[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    raw_data.tool8[[sheet]] <- raw_data.tool8[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    clean_data.tool8[[sheet]] <- apply_log(data=raw_data.tool8[[sheet]], log = filter(photo_status_ready_cbe, Tool == tool_name & Tab_Name == sheet))
  }
}

# Tool 9
tool_name <- "Tool 9 - IP Level"
if (any(photo_status_ready_cbe$Tool == tool_name)) {
  for(sheet in names(raw_data.tool9)){
    clean_data.tool9[[sheet]] <- clean_data.tool9[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    raw_data.tool9[[sheet]] <- raw_data.tool9[[sheet]] |>
      mutate(
        across(ends_with("_QA"), as.character)
      )
    
    clean_data.tool9[[sheet]] <- apply_log(data=raw_data.tool9[[sheet]], log = filter(photo_status_ready_cbe, Tool == tool_name & Tab_Name == sheet))
  }
}


# Correction Log apply check --------------------------------------------------
message("Verifying Detailed Check log, please wait!")

# Update the compare_df function in atrFunctions
photo_status_log_discrep <- data.frame()

# Tool 1 KDR
for(sheet in names(clean_data.tool1_kdr)){
  # Compare
  photo_status_log_discrep <- rbind(
    photo_status_log_discrep,
    compare_dt(clean_data.tool1_kdr[[sheet]], raw_data.tool1_kdr[[sheet]]) |>
      mutate(tool="Tool 1 - Headmaster Interview", Tab_Name = sheet, KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))
  )
}

# Tool 1
for(sheet in names(clean_data.tool1)){
  photo_status_log_discrep <- rbind(
    photo_status_log_discrep,
    compare_dt(clean_data.tool1[[sheet]], raw_data.tool1[[sheet]]) |>
      mutate(tool="Tool 1 - Headmaster Interview", Tab_Name = sheet, KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))
  )
}

# Tool 2
for(sheet in names(clean_data.tool2)){
  photo_status_log_discrep <- rbind(
    photo_status_log_discrep,
    compare_dt(clean_data.tool2[[sheet]], raw_data.tool2[[sheet]]) |>
      mutate(tool="Tool 2 - Light Tool", Tab_Name = sheet, KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))
  )
}

# Tool 3
for(sheet in names(clean_data.tool3)){
  photo_status_log_discrep <- rbind(
    photo_status_log_discrep,
    compare_dt(clean_data.tool3[[sheet]], raw_data.tool3[[sheet]]) |>
      mutate(tool="Tool 3 - Student Document & Headcount", Tab_Name = sheet, KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))
  )
}


# Tool 4
for(sheet in names(clean_data.tool4)){
  photo_status_log_discrep <- rbind(
    photo_status_log_discrep,
    compare_dt(clean_data.tool4[[sheet]], raw_data.tool4[[sheet]]) |>
      mutate(tool="Tool 4 - Teacher Tool", Tab_Name = sheet, KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))
  )
}

# Tool 5
for(sheet in names(clean_data.tool5)){
  photo_status_log_discrep <- rbind(
    photo_status_log_discrep,
    compare_dt(clean_data.tool5[[sheet]], raw_data.tool5[[sheet]]) |>
      mutate(tool="Tool 5 - WASH Tool", Tab_Name = sheet, KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))
  )
}


# Tool 6
for(sheet in names(clean_data.tool6)){
  photo_status_log_discrep <- rbind(
    photo_status_log_discrep,
    compare_dt(clean_data.tool6[[sheet]], raw_data.tool6[[sheet]]) |>
      mutate(tool="Tool 6 - Parent Tool", Tab_Name = sheet, KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))
  )
}

# Tool 7
for(sheet in names(clean_data.tool7)){
  photo_status_log_discrep <- rbind(
    photo_status_log_discrep,
    compare_dt(clean_data.tool7[[sheet]], raw_data.tool7[[sheet]]) |>
      mutate(tool="Tool 7 - Shura Tool", Tab_Name = sheet, KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))
  )
}

# Tool 8
for(sheet in names(clean_data.tool8)){
  photo_status_log_discrep <- rbind(
    photo_status_log_discrep,
    compare_dt(clean_data.tool8[[sheet]], raw_data.tool8[[sheet]]) |>
      mutate(tool="Tool 8 - CBE Teacher Tool", Tab_Name = sheet, KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))
  )
}

# Tool 9
for(sheet in names(clean_data.tool9)){
  photo_status_log_discrep <- rbind(
    photo_status_log_discrep,
    compare_dt(clean_data.tool9[[sheet]], raw_data.tool9[[sheet]]) |>
      mutate(tool="Tool 9 - IP Level", Tab_Name = sheet, KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))
  )
}

# Exclude the correction logs
required_cols <- c("KEY", "question", "old_value", "new_value", "tool", "Tab_Name")
photo_status_log_discrep <- photo_status_log_discrep |> 
  select(all_of(c(required_cols,"KEY_join"))) |>
  anti_join(bind_rows(photo_status_ready_ps, 
                      photo_status_ready_cbe) |>
              mutate(KEY_join = paste0(KEY, question, new_value, Tool, Tab_Name))
            , by = "KEY_join") |>
  mutate(question = as.character(question), KEY = as.character(KEY)) %>% 
  left_join(bind_rows(photo_status_ready_ps, photo_status_ready_cbe) |> # Join Sample Type
              select(KEY, question, Tab_Name, Sample_Type), by = c("KEY", "question", "Tab_Name")) |> 
  mutate(issue = "The new_value is not applied correctly, plz check if new_value is consistent with the question!") |>
  select(-KEY_join)

# Join with Correction log issues
photo_status_log_discrep <- plyr::rbind.fill( 
  photo_status_log_discrep,
  photo_status_issues_ps |>
    rename(old_value = New_Value, question = Question, KEY = KEY_Unique, tool = Tool) %>% 
    select(any_of(required_cols), tool, KEY, Sample_Type, issue),
  photo_status_issues_cbe |>
    rename(old_value = New_Value,  question = Question, KEY = KEY_Unique, tool = Tool) %>% 
    select(any_of(required_cols), tool, KEY, Sample_Type, issue)
)

# Removing extra objects -------------------------------------------------------
rm(list = c("photo_status_issues_ps", "photo_status_issues_cbe",
            # "photo_status_ready_ps", "photo_status_ready_cbe", 
            "tool_name", "form_names_ps", "form_names_cbe", "check_logs_for_df"))
