source("R/functions/check_sm_so_questions_value.R")

to_be_excluded_questions = c("Province_filter", "Surveyor_Name", "Site_Visit_ID", "Sample_Type", "Data_Entry_Clerk_Name")

wrong_choices_result <- data.frame()
# Tool 0
for (sheet in names(clean_data.tool0)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool0[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool0$survey,
                                  kobotool.choices = kobo_tool.tool0$choices
                                ) %>% mutate(Sheet = sheet, tool = "Tool Data Entry", Sample_Type = "Public School")
  )
}

# Tool 1 KDR
for (sheet in names(clean_data.tool1_kdr)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool1_kdr[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool1_kdr$survey,
                                  kobotool.choices = kobo_tool.tool1_kdr$choices
                                ) %>% mutate(Sheet = sheet, tool = "Tool 1 - Headmaster KDR", Sample_Type = "Public School")
  )
}
  
# Tool 1
for (sheet in names(clean_data.tool1)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool1[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool1$survey,
                                  kobotool.choices = kobo_tool.tool1$choices
                                ) %>% mutate(Sheet = sheet, tool = "Tool 1 - Headmaster", Sample_Type = "Public School")
  )
}

# Tool 2
for (sheet in names(clean_data.tool2)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool2[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool2$survey,
                                  kobotool.choices = kobo_tool.tool2$choices
                                ) %>% mutate(Sheet = sheet, tool = "Tool 2 - Light", Sample_Type = "Public School")
  )
}

# Tool 3
for (sheet in names(clean_data.tool3)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool3[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool3$survey,
                                  kobotool.choices = kobo_tool.tool3$choices
                                ) %>% mutate(Sheet = sheet, tool = "Tool 3 - Headcount", Sample_Type = "Public School")
  )
}

# Tool 4
for (sheet in names(clean_data.tool4)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool4[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool4$survey,
                                  kobotool.choices = kobo_tool.tool4$choices
                                ) %>% mutate(Sheet = sheet, tool = "Tool 4 - Teacher", Sample_Type = "Public School")
  )
}


# Tool 5
for (sheet in names(clean_data.tool5)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool5[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool5$survey,
                                  kobotool.choices = kobo_tool.tool5$choices
                                ) %>% mutate(Sheet = sheet, tool = "Tool 5 - WASH", Sample_Type = "Public School")
  )
}

# Tool 6
for (sheet in names(clean_data.tool6)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool6[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool6$survey,
                                  kobotool.choices = kobo_tool.tool6$choices
                                ) %>%
                                  left_join(clean_data.tool6$data %>% select(KEY, Sample_Type), by = c("uuid" = "KEY")) %>% 
                                  mutate(Sheet = sheet, tool = "Tool 6 - Parent")
  )
}


# Tool 7
for (sheet in names(clean_data.tool7)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool7[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool7$survey,
                                  kobotool.choices = kobo_tool.tool7$choices
                                ) %>%
                                  left_join(clean_data.tool7$data %>% select(KEY, Sample_Type), by = c("uuid" = "KEY")) %>% 
                                  mutate(Sheet = sheet, tool = "Tool 7 - Shura")
  )
}

# Tool 8
for (sheet in names(clean_data.tool8)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool8[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool8$survey,
                                  kobotool.choices = kobo_tool.tool8$choices
                                ) %>% mutate(Sheet = sheet, tool = "Tool 8 - Class", Sample_Type = "CBE")
  )
}


# Tool 9
for (sheet in names(clean_data.tool9)) {
  wrong_choices_result <- rbind(wrong_choices_result,
                                check_so_sm_questions(
                                  df = clean_data.tool9[[sheet]] %>% select(!any_of(to_be_excluded_questions)),
                                  kobotool.survey = kobo_tool.tool9$survey,
                                  kobotool.choices = kobo_tool.tool9$choices
                                ) %>% mutate(Sheet = sheet, tool = "Tool 9 - IP", Sample_Type = "CBE")
  )
}


names(wrong_choices_result)[names(wrong_choices_result) == "invalid_opts"] = "old_value"


# removing extra elements from the environment
rm(list = c("check_so_sm_questions"))
