# source("R/functions/check_relevancy_rule.R")

join_dfs <- function(df1, df2){
  return(df1 %>% 
           mutate(KEY_join=str_split_fixed(PARENT_KEY, "/", 2)[,1]) %>% # In case PARENT_KEY belongs to another child sheet
           left_join(df2 |> mutate(KEY = as.character(KEY)), by = c("KEY_join" = "KEY")) %>% select(-KEY_join))
} 

# Cloning df
clean_data.tool0_joined <- clean_data.tool0
clean_data.tool1_kdr_joined <- clean_data.tool1_kdr
clean_data.tool1_joined <- clean_data.tool1
clean_data.tool2_joined <- clean_data.tool2
clean_data.tool3_joined <- clean_data.tool3
clean_data.tool4_joined <- clean_data.tool4
clean_data.tool5_joined <- clean_data.tool5
clean_data.tool6_joined <- clean_data.tool6
clean_data.tool7_joined <- clean_data.tool7
clean_data.tool8_joined <- clean_data.tool8
clean_data.tool9_joined <- clean_data.tool9

# joining DFs to be able to check the relevancy failure in child s -------------
# Tool 0

for(sheet in names(clean_data.tool0_joined)[c(2, 3, 4, 9)]){
  # Join
  clean_data.tool0_joined[[sheet]] <- join_dfs(clean_data.tool0_joined[[sheet]], clean_data.tool0$data |> select(!any_of(meta_cols)))
}

for(sheet in names(clean_data.tool0_joined)[c(5, 6, 7, 8)]){
  # Join
  clean_data.tool0_joined[[sheet]] <- join_dfs(clean_data.tool0_joined[[sheet]], clean_data.tool0$data |> select(!any_of(meta_cols)))
}

# Tool 1 KDR
for(sheet in names(clean_data.tool1_kdr_joined)[-1]){
  # Join
  clean_data.tool1_kdr_joined[[sheet]] <- join_dfs(clean_data.tool1_kdr_joined[[sheet]], clean_data.tool1_kdr$data |> select(!any_of(meta_cols)))
}

# Tool 1
for(sheet in names(clean_data.tool1_joined)[-1]){
  # Join
  clean_data.tool1_joined[[sheet]] <- join_dfs(clean_data.tool1_joined[[sheet]], clean_data.tool1$data |> select(!any_of(meta_cols)))
}

# Tool 2
for(sheet in names(clean_data.tool2_joined)[-1]){
  # Join
  clean_data.tool2_joined[[sheet]] <- join_dfs(clean_data.tool2_joined[[sheet]], clean_data.tool2$data |> select(!any_of(meta_cols)))
}

# Tool 3
for(sheet in names(clean_data.tool3_joined)[-1]){
  # Join
  clean_data.tool3_joined[[sheet]] <- join_dfs(clean_data.tool3_joined[[sheet]], clean_data.tool3$data |> select(!any_of(meta_cols)))
}


# Tool 4
for(sheet in names(clean_data.tool4_joined)[-1]){
  # Join
  clean_data.tool4_joined[[sheet]] <- join_dfs(clean_data.tool4_joined[[sheet]], clean_data.tool4$data |> select(!any_of(meta_cols)))
}

# Tool 5
for(sheet in names(clean_data.tool5_joined)[-1]){
  # Join
  clean_data.tool5_joined[[sheet]] <- join_dfs(clean_data.tool5_joined[[sheet]], clean_data.tool5$data |> select(!any_of(meta_cols)))
}


# Tool 6
clean_data.tool6_joined$Subjects_Added <- join_dfs(clean_data.tool6$Subjects_Added, clean_data.tool6$data |> select(!any_of(meta_cols)))


# Tool 7
clean_data.tool7_joined$C6_list_members <- join_dfs(clean_data.tool7$C6_list_members, clean_data.tool7$data |> select(!any_of(meta_cols)))
clean_data.tool7_joined$Subjects_Added <- join_dfs(clean_data.tool7$Subjects_Added, clean_data.tool7$data |> select(!any_of(meta_cols)))


# Tool 8
for(sheet in names(clean_data.tool8_joined)[-1]){
  # Join
  clean_data.tool8_joined[[sheet]] <- join_dfs(clean_data.tool8_joined[[sheet]], clean_data.tool8$data |> select(!any_of(meta_cols)))
}

# Tool 9
clean_data.tool9_joined$Questions_Repeat <- join_dfs(clean_data.tool9$Questions_Repeat, clean_data.tool9$data |> select(!any_of(meta_cols)))
clean_data.tool9_joined$Relevant_photos <- join_dfs(clean_data.tool9$Relevant_photos, clean_data.tool9$data |> select(!any_of(meta_cols)))


# listing the required questions -----------------------------------------------
tool0.notrequired_questions <- kobo_tool.tool0$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool1_kdr.notrequired_questions <- kobo_tool.tool1_kdr$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool1.notrequired_questions <- kobo_tool.tool1$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool2.notrequired_questions <- kobo_tool.tool2$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool3.notrequired_questions <- kobo_tool.tool3$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool4.notrequired_questions <- kobo_tool.tool4$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool5.notrequired_questions <- kobo_tool.tool5$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool6.notrequired_questions <- kobo_tool.tool6$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool7.notrequired_questions <- kobo_tool.tool7$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool8.notrequired_questions <- kobo_tool.tool8$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool9.notrequired_questions <- kobo_tool.tool9$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)


# checking the relevancy issues ------------------------------------------------
relevancy_issues <- data.frame(question = vector())

# Tool 0
# sheet = "data"
for (sheet in names(clean_data.tool0_joined)) {
  relevancy_issues <- plyr::rbind.fill(
    relevancy_issues,
    check_relevancy_rules(data = clean_data.tool0_joined[[sheet]],
                          tool_relevancy = relevancy_file.tool0,
                          sheet_name = sheet)
  ) |>
    mutate(tool = "Tool - Data Entry", Sample_Type = "Public School") |>
    filter(!question %in% tool0.notrequired_questions)
}

# Tool 1 KDR
for (sheet in names(clean_data.tool1_kdr_joined)[-10]) {
  
  temp <- check_relevancy_rules(data = clean_data.tool1_kdr_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool1_kdr, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 1 - Headmaster KDR", Sample_Type = "Public School")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool1_kdr.notrequired_questions)
    )
  }
  temp <- NULL
}


# Tool 1
for (sheet in names(clean_data.tool1_joined)) {
  
  temp <- check_relevancy_rules(data = clean_data.tool1_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool1, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool1.notrequired_questions)
    )
  }
  temp <- NULL
}


# Tool 2
for (sheet in names(clean_data.tool2_joined)) {
  
  temp <- check_relevancy_rules(data = clean_data.tool2_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool2, 
                                sheet_name = sheet) |> 
                                mutate(tool = "Tool 2 - Light", Sample_Type = "Public School")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool2.notrequired_questions)
    )
  }
  temp <- NULL
}


# Tool 3
for (sheet in names(clean_data.tool3_joined)) {
  temp <- check_relevancy_rules(data = clean_data.tool3_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool3, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool3.notrequired_questions)
    )
  }
  temp <- NULL
}

# Tool 4
for (sheet in names(clean_data.tool4_joined)) {
  temp <- check_relevancy_rules(data = clean_data.tool4_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool4, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool4.notrequired_questions)
    )
  }
  temp <- NULL
}

# Tool 5
for (sheet in names(clean_data.tool5_joined)) {
  temp <- check_relevancy_rules(data = clean_data.tool5_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool5, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool5.notrequired_questions)
    )
  }
  temp <- NULL
}
  
# Tool 6
temp <- rbind(
  check_relevancy_rules(clean_data.tool6_joined$data, relevancy_file.tool6, sheet_name="data"),
  check_relevancy_rules(clean_data.tool6_joined$Subjects_Added, relevancy_file.tool6, sheet_name="Subjects_Added")
) |>
  mutate(tool = "Tool 6 - Parent", KEY_join = str_sub(KEY, 1, 41)) |>
  left_join(select(clean_data.tool6_joined$data, KEY, Sample_Type), by = c("KEY_join"="KEY")) %>%
  select(everything(), tool, Sample_Type, -KEY_join)

if(nrow(temp) > 0){
  relevancy_issues <- plyr::rbind.fill(
    relevancy_issues, 
    temp |>
      filter(!question %in% tool6.notrequired_questions)
  )
}

temp <- NULL
  
# Tool 7
temp <- rbind(
  check_relevancy_rules(clean_data.tool7_joined$data, relevancy_file.tool7, sheet_name="data"),
  check_relevancy_rules(clean_data.tool7_joined$C6_list_members, relevancy_file.tool7, sheet_name="C6_list_members"),
  check_relevancy_rules(clean_data.tool7_joined$Subjects_Added, relevancy_file.tool7, sheet_name="Subjects_Added")
) |> 
  mutate(tool = "Tool 7 - Shura", KEY_join = str_sub(KEY, 1, 41)) |>
  left_join(select(clean_data.tool7_joined$data, KEY, Sample_Type), by = c("KEY_join"="KEY")) %>%
  select(everything(), tool, Sample_Type, -KEY_join)
  
if(nrow(temp) > 0){
  relevancy_issues <- plyr::rbind.fill(
    relevancy_issues,
    temp |>
      filter(!question %in% tool7.notrequired_questions)
  )
}  

temp <- NULL

# Tool 8
for (sheet in names(clean_data.tool8_joined)[-4]) {
  temp <- check_relevancy_rules(data = clean_data.tool8_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool8, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 8 - Class", Sample_Type = "CBE")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool8.notrequired_questions)
    )
  }
  temp <- NULL
}

temp <- check_relevancy_rules(clean_data.tool8_joined$Section_2_2_3_Attendance_Rec..., relevancy_file.tool8, sheet_name="Section_2_2_3_Attendance_Record_Check_CBS")

if(nrow(temp) > 0){
relevancy_issues <- plyr::rbind.fill(
  relevancy_issues, 
  temp |>
  filter(!question %in% tool8.notrequired_questions)
  )
}

temp <- NULL
# Tool 9
for (sheet in names(clean_data.tool9_joined)) {
  temp <- check_relevancy_rules(data = clean_data.tool9_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool9, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 9 - IP", Sample_Type = "CBE")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool9.notrequired_questions)
    )
  }
  temp <- NULL
}

if(nrow(relevancy_issues) !=0){
  relevancy_issues <- relevancy_issues %>% 
    mutate(Key=str_split_fixed(KEY, "/", 2)[,1]) %>% 
    relocate(Key, .after = KEY)
}

# removing extra elements from the environment
rm(list = c("join_dfs",
            ls(pattern = "_joined$"),
            ls(pattern = "notrequired_questions$")
))
