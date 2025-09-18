source("R/functions/check_select_multiple.R")

sm_check_result <- data.frame()

# Tool 0
for(sheet in names(clean_data.tool0)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result,
    check_select_multiple(
      data = clean_data.tool0[[sheet]],
      tool = kobo_tool.tool0$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool Data Entry", Sample_Type = "")
  )
}
# Tool 1 KDR
for(sheet in names(clean_data.tool1_kdr)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result,
    check_select_multiple(
      data = clean_data.tool1_kdr[[sheet]],
      tool = kobo_tool.tool1_kdr$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool 1 - Headmaster KDR", Sample_Type = "Public School")
  )
}

# Tool 1
for(sheet in names(clean_data.tool1)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result,
    check_select_multiple(
      data = clean_data.tool1[[sheet]],
      tool = kobo_tool.tool1$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool 1 - Headmaster", Sample_Type = "Public School")
  )
  # print(sheet)
}
# Tool 2
for(sheet in names(clean_data.tool2)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result,
    check_select_multiple(
      data = clean_data.tool2[[sheet]],
      tool = kobo_tool.tool2$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool 2 - Light", Sample_Type = "Public School")
  )
}
# Tool 3
for(sheet in names(clean_data.tool3)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result,
    check_select_multiple(
      data = clean_data.tool3[[sheet]],
      tool = kobo_tool.tool3$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool 3 - Headcount", Sample_Type = "Public School")
  )
}
# Tool 4
for(sheet in names(clean_data.tool4)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result,
    check_select_multiple(
      data = clean_data.tool4[[sheet]],
      tool = kobo_tool.tool4$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool 4 - Teacher", Sample_Type = "Public School")
  )
}
# Tool 5
for(sheet in names(clean_data.tool5)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result,
    check_select_multiple(
      data = clean_data.tool5[[sheet]],
      tool = kobo_tool.tool5$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool 5 - WASH", Sample_Type = "Public School")
  )
}
# Tool 6
for(sheet in names(clean_data.tool6)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result %>% mutate(across(everything(), as.character)),
    check_select_multiple(
      data = clean_data.tool6[[sheet]] %>% mutate(KEY = as.character(KEY)),
      tool = kobo_tool.tool6$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool 6 - Parent", KEY = as.character(KEY)) %>% 
      left_join(select(clean_data.tool6$data, KEY, Sample_Type) %>% mutate(KEY = as.character(KEY)), by = "KEY") %>% 
      mutate(across(everything(), as.character))
  )
}
# Tool 7
for(sheet in names(clean_data.tool7)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result %>% mutate(across(everything(), as.character)),
    check_select_multiple(
      data = clean_data.tool7[[sheet]] %>% mutate(KEY = as.character(KEY)),
      tool = kobo_tool.tool7$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool 7 - Shura", KEY = as.character(KEY)) %>% 
      left_join(select(clean_data.tool7$data, KEY, Sample_Type) %>% mutate(KEY = as.character(KEY)), by = "KEY") %>% 
      mutate(across(everything(), as.character))
  )
}
# Tool 8
for(sheet in names(clean_data.tool8)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result %>% mutate(across(everything(), as.character)),
    check_select_multiple(
      data = clean_data.tool8[[sheet]],
      tool = kobo_tool.tool8$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool 8 - Class", Sample_Type = "CBE", KEY = as.character(KEY)) %>% 
      mutate(across(everything(), as.character))
  )
}
# Tool 9
for(sheet in names(clean_data.tool9)){
  sm_check_result <- plyr::rbind.fill(
    sm_check_result %>% mutate(across(everything(), as.character)),
    check_select_multiple(
      data = clean_data.tool9[[sheet]],
      tool = kobo_tool.tool9$survey,
      question_separator = "_"
    ) %>% mutate(Tab_name = sheet, tool = "Tool 9 - IP", Sample_Type = "CBE", KEY = as.character(KEY)) %>% 
      mutate(across(everything(), as.character))
  )
}


# removing extra elements from the environment
rm(list = c(
  objects(pattern = "^multi_vars_")
))



