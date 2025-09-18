source("./R/functions/compare_row_counts.R")


# Changed the supposed_row_count value from COUNT column in data sets to column define in the tool repeat-count - 131223
repeat_sheet_issues <- rbind(
  rbind(
    # Tool 0
    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$data, supposed_row_count = Total_Classes, KEY),
      child_df = clean_data.tool0$Tool3_Classes,
      child_sheet_name = "Tool3_Classes"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Total_Classes"),

    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$data, supposed_row_count = Total_Classes, KEY),
      child_df = clean_data.tool0$Tool3_T2_Classes_VD,
      child_sheet_name = "Tool3_T2_Classes_VD"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Total_Classes"),

    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$data |> mutate(Tool1_Timetable_value_count = case_when(
        is.na(Tool1_Timetable) | str_trim(Tool1_Timetable) == "" ~ 0,
        TRUE ~ (str_count(Tool1_Timetable," ")+1))
      ), supposed_row_count = Tool1_Timetable_value_count, KEY),
      child_df = clean_data.tool0$Tool1_Timetable_Year,
      child_sheet_name = "Tool1_Timetable_Year"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Tool1_Timetable"),

    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$Tool1_Timetable_Year |> mutate(Tool1_How_Many_Timetable1_value_count = case_when(
        is.na(Tool1_How_Many_Timetable1) | str_trim(Tool1_How_Many_Timetable1) == "" ~ 0,
        TRUE ~ (str_count(Tool1_How_Many_Timetable1," ")+1))
      ), supposed_row_count = Tool1_How_Many_Timetable1_value_count, KEY),
      child_df = clean_data.tool0$Tool1_Timetable1_Repeat,
      child_sheet_name = "Tool1_Timetable1_Repeat"
    ) |> mutate(Row_count_from_tab = "Tool1_Timetable_Year", Row_count_column_name = "Tool1_How_Many_Timetable1"),

    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$Tool1_Timetable_Year |> mutate(Tool1_How_Many_Timetable2_value_count = case_when(
        is.na(Tool1_How_Many_Timetable2) | str_trim(Tool1_How_Many_Timetable2) == "" ~ 0,
        TRUE ~ (str_count(Tool1_How_Many_Timetable2," ")+1))
      ), supposed_row_count = Tool1_How_Many_Timetable2_value_count, KEY),
      child_df = clean_data.tool0$Tool1_Timetable2_Repeat,
      child_sheet_name = "Tool1_Timetable2_Repeat"
    ) |> mutate(Row_count_from_tab = "Tool1_Timetable_Year", Row_count_column_name = "Tool1_How_Many_Timetable2"),


    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$Tool1_Timetable_Year |> mutate(Tool1_How_Many_Timetable3_value_count = case_when(
        is.na(Tool1_How_Many_Timetable3) | str_trim(Tool1_How_Many_Timetable3) == "" ~ 0,
        TRUE ~ (str_count(Tool1_How_Many_Timetable3," ")+1))
      ), supposed_row_count = Tool1_How_Many_Timetable3_value_count, KEY),
      child_df = clean_data.tool0$Tool1_Timetable3_Repeat,
      child_sheet_name = "Tool1_Timetable3_Repeat"
    ) |> mutate(Row_count_from_tab = "Tool1_Timetable_Year", Row_count_column_name = "Tool1_How_Many_Timetable3"),


    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$Tool1_Timetable_Year |> mutate(Tool1_How_Many_Timetable4_value_count = case_when(
        is.na(Tool1_How_Many_Timetable4) | str_trim(Tool1_How_Many_Timetable4) == "" ~ 0,
        TRUE ~ (str_count(Tool1_How_Many_Timetable4," ")+1))
      ), supposed_row_count = Tool1_How_Many_Timetable4_value_count, KEY),
      child_df = clean_data.tool0$Tool1_Timetable4_Repeat,
      child_sheet_name = "Tool1_Timetable4_Repeat"
    ) |> mutate(Row_count_from_tab = "Tool1_Timetable_Year", Row_count_column_name = "Tool1_How_Many_Timetable4"),

    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$data |> mutate(Tool3_Grades_value_count = case_when(
        is.na(Tool3_Grades) | str_trim(Tool3_Grades) == "" ~ 0,
        TRUE ~ (str_count(Tool3_Grades," ")+1))
      ), supposed_row_count = Tool3_Grades_value_count, KEY),
      child_df = clean_data.tool0$Tool3_Grades_Repeat,
      child_sheet_name = "Tool3_Grades_Repeat"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Tool3_Grades")

  ) |>
    mutate(tool = "Tool Data Entry", Sample_Type = "Public School"),
  
  # Tool 1 KDR
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1_kdr$data, supposed_row_count = C11, KEY),
      child_df = clean_data.tool1_kdr$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C11"),
    
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1_kdr$data, supposed_row_count = School_rep, KEY),
      child_df = clean_data.tool1_kdr$School_Operationality,
      child_sheet_name = "School_Operationality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "School_rep"),
    
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1_kdr$data |> mutate(C14A1_value_count = case_when(
        is.na(C14A1) | str_trim(C14A1) == "" ~ 0,
        TRUE ~ (str_count(C14A1, " ")+1)
      )), supposed_row_count = C14A1_value_count, KEY),
      child_df = clean_data.tool1_kdr$Shifts_Detail,
      child_sheet_name = "Shifts_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C14A1"),
    
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1_kdr$data, supposed_row_count = C15, KEY),
      child_df = clean_data.tool1_kdr$Headmasters,
      child_sheet_name = "Headmasters"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C15"),
    
    # 5 
    clean_data.tool1_kdr$data |>
      mutate(supposed_row_count = 2) |>
      filter(F3 == "1") |>
      left_join(
        clean_data.tool1_kdr$Weekly_Class_Schedule_New |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Weekly_Class_Schedule_New sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Weekly_Class_Schedule_New sheet")
        ),
        sheet_name = "Weekly_Class_Schedule_New",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),
    
    # 6
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1_kdr$data %>% filter(A34 != 4) |> mutate(subject_detail_counter = 29), supposed_row_count = subject_detail_counter, KEY),
      child_df = clean_data.tool1_kdr$Subjects_Detail,
      child_sheet_name = "Subjects_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "subject_detail_counter"),
    
    # 7
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1_kdr$data |> filter(F7 == 1), supposed_row_count = Number_of_subjects, KEY),
      child_df = clean_data.tool1_kdr$Additional_Subjects,
      child_sheet_name = "Additional_Subjects"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Number_of_subjects"),
    
    # 8
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1_kdr$data %>% filter(A34 != 4) |> mutate(education_quality_counter = 10), supposed_row_count = education_quality_counter, KEY),
      child_df = clean_data.tool1_kdr$Education_Quality,
      child_sheet_name = "Education_Quality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "education_quality_counter")
    
  ) |> 
    mutate(tool = "Tool 1 - Headmaster - KDR", Sample_Type = "Public School"),
  
  # Tool 1
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = C11, KEY),
      child_df = clean_data.tool1$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C11"),
    
    # 2 Weekly_Schedule_Old omitted in R4
    # 3 Weekly_Schedule_New omitted in R4
  
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data %>% filter(A34 != 6) |> mutate(subject_detail_counter = 29), supposed_row_count = subject_detail_counter, KEY),
      child_df = clean_data.tool1$Subjects_Detail,
      child_sheet_name = "Subjects_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "subject_detail_counter"),
    
    # 5
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data |> filter(F7 == 1), supposed_row_count = Number_of_subjects, KEY),
      child_df = clean_data.tool1$Additional_Subjects,
      child_sheet_name = "Additional_Subjects"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Number_of_subjects"),
    
    # 6
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data %>% filter(A34 != 6) |> mutate(education_quality_counter = 10), supposed_row_count = education_quality_counter, KEY),
      child_df = clean_data.tool1$Education_Quality,
      child_sheet_name = "Education_Quality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "education_quality_counter")
    
  ) |> 
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),
  
  # Tool 2
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data |> filter(D7 == 1), supposed_row_count = D8, KEY),
      child_df = clean_data.tool2$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "D8"),
  
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data, supposed_row_count = School_rep, KEY),
      child_df = clean_data.tool2$School_Operationality,
      child_sheet_name = "School_Operationality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "School_rep"),
    
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data |> mutate(C14A1_value_count = case_when(
        is.na(C14A1) | str_trim(C14A1) == "" ~ 0,
        TRUE ~ (str_count(C14A1, " ")+1)
      )), supposed_row_count = C14A1_value_count, KEY),
      child_df = clean_data.tool2$Shifts_Detail,
      child_sheet_name = "Shifts_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C14A1"),
    
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data, supposed_row_count = C15A, KEY),
      child_df = clean_data.tool2$Headmasters,
      child_sheet_name = "Headmasters"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C15A"),
    
    # 5 - The repeat does not have repeat count in the tool - but it has a note to like (Please go to previous page and take a photo or multiple photos of the daily attendance sheet.)
    clean_data.tool2$data |>
      filter(G2 == 1) |>
      mutate(supposed_row_count = 1) |>
      left_join(
        clean_data.tool2$Attendance_Sheet_Photos |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 1 missing row for the logged KEY in Attendance_Sheet_Photos sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Attendance_Sheet_Photos sheet")
        ),
        sheet_name = "Attendance_Sheet_Photos",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),
    
    # 6
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data |> filter(H1 == 1) |> mutate(H5_value_count = case_when(
        is.na(H5) | str_trim(H5) == "" ~ 0,
        str_detect(H5, "8888") ~ (str_count(H5, " ")),
        TRUE ~ (str_count(H5, " ")+1)
      )), supposed_row_count = H5_value_count, KEY),
      child_df = clean_data.tool2$Public_Stationary_Kit_Group,
      child_sheet_name = "Public_Stationary_Kit_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "H5"),
    
    # 7
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data |> filter(i1 == 1 & i5_8888 == 0) |> mutate(i5_value_count = case_when(
        is.na(i5) | str_trim(i5) == "" ~ 0,
        TRUE ~ (str_count(i5, " ")+1)
      )), supposed_row_count = i5_value_count, KEY),
      child_df = clean_data.tool2$Teachers_Pack_Group,
      child_sheet_name = "Teachers_Pack_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "i5"),
    
    # 8
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data |> filter(J1 == 1) |> mutate(J5_value_count = case_when(
        is.na(J5) | str_trim(J5) == "" ~ 0,
        str_detect(J5, "8888") ~ (str_count(J5, " ")),
        TRUE ~ (str_count(J5, " ")+1)
      )), supposed_row_count = J5_value_count, KEY),
      child_df = clean_data.tool2$Students_Pack_Group,
      child_sheet_name = "Students_Pack_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "J5")
  ) |> 
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),
  
  # Tool 3
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data |> filter(B8 == 1), supposed_row_count = B9, KEY),
      child_df = clean_data.tool3$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "B9"),

    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data |> filter(Visit_Type == "IDT"), supposed_row_count = C9, KEY),
      child_df = clean_data.tool3$Grade_Details,
      child_sheet_name = "Grade_Details"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C9"),
  
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data, supposed_row_count = C9, KEY),
      child_df = clean_data.tool3$Todays_Attendance_Detail,
      child_sheet_name = "Todays_Attendance_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C9"),
  
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data |> filter(Headcount_Conducted == 1) |> mutate(E1_value_count = case_when(
        is.na(E1) | str_trim(E1) == "" ~ 0,
        TRUE ~ (str_count(E1, " ")+1)
      )), supposed_row_count = E1_value_count, KEY),
      child_df = clean_data.tool3$Student_Headcount,
      child_sheet_name = "Student_Headcount"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E1"),
    
    # 5
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data |> mutate(Tool3_Grades_value_count = case_when(
        is.na(Tool3_Grades) | str_trim(Tool3_Grades) == "" ~ 0,
        TRUE ~ (str_count(Tool3_Grades, " ")+1)
      )), supposed_row_count = Tool3_Grades_value_count, KEY),
      child_df = clean_data.tool3$Tool3_Grades_Repeat,
      child_sheet_name = "Tool3_Grades_Repeat"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Tool3_Grades")
  ) |> 
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
  
  # Tool 4
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data |> filter(F2 == 1), KEY, supposed_row_count = F2_N),
      child_df = clean_data.tool4$Additional_Subjects,
      child_sheet_name = "Additional_Subjects"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "F2_N"),

    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data |> mutate(D9_value_count = case_when(
        is.na(D9) | str_trim(D9) == "" ~ 0,
        TRUE ~ (str_count(D9, " ")+1)
      )), KEY, supposed_row_count = D9_value_count),
      child_df = clean_data.tool4$Subjects_taught_by_this_teacher,
      child_sheet_name = "Subjects_taught_by_this_teacher"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "D9"),
    
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data |> filter(F11 == 1) |> mutate(F12_Subjects_Not_Being_Taught_value_count = case_when(
        is.na(F12_Subjects_Not_Being_Taught) | str_trim(F12_Subjects_Not_Being_Taught) == "" ~ 0,
        str_detect(F12_Subjects_Not_Being_Taught, "8888") ~ (str_count(F12_Subjects_Not_Being_Taught, " ")),
        TRUE ~ (str_count(F12_Subjects_Not_Being_Taught, " ")+1)
      )), KEY, supposed_row_count = F12_Subjects_Not_Being_Taught_value_count),
      child_df = clean_data.tool4$Subjects_Not_Being_Taught,
      child_sheet_name = "Subjects_Not_Being_Taught"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "F12_Subjects_Not_Being_Taught")
  ) |> 
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
  
  # Tool 5
  # 1 - Does not have repeat count in the tool - note (<b>Please go to previous page and take at least two photos of toilets under construction.)
  rbind(
  clean_data.tool5$data |>
    mutate(supposed_row_count = 2) |>
    filter(C5 == 4) |>
    left_join(
      clean_data.tool5$Under_Construction_Toilets |>
        group_by(KEY = PARENT_KEY) |>
        summarise(current_row_count = n()) , by = "KEY") |>
    filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
    mutate(
      issue = case_when(
        is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Under_Construction_Toilets sheet",
        TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Under_Construction_Toilets sheet")
      ),
      sheet_name = "Under_Construction_Toilets",
      Row_count_column_name = "",
      Row_count_from_tab = "data"
    ) |>
    select(
      PARENT_KEY = KEY,
      issue,
      supposed_row_count,
      current_row_count,
      sheet_name,
      Row_count_column_name,
      Row_count_from_tab
    ),
  # 2 - Does not have repeat count in the tool - note (<b>Please go to previous page and take at least two photos of useable toilets.)
  clean_data.tool5$data |>
    mutate(supposed_row_count = 2) |>
    filter(C9_4 > 0 | C9_5 > 0 | C9_6 > 0) |>
    left_join(
      clean_data.tool5$Useable_Toilets |>
        group_by(KEY = PARENT_KEY) |>
        summarise(current_row_count = n()) , by = "KEY") |>
    filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
    mutate(
      issue = case_when(
        is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Useable_Toilets sheet",
        TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Useable_Toilets sheet")
      ),
      sheet_name = "Useable_Toilets",
      Row_count_column_name = "",
      Row_count_from_tab = "data"
    ) |>
    select(
      PARENT_KEY = KEY,
      issue,
      supposed_row_count,
      current_row_count,
      sheet_name,
      Row_count_column_name,
      Row_count_from_tab
    ),
  # 3 - Does not have repeat count in the tool - note (<b>Please go to previous page and take a photo of Non_Useable toilets.)
  clean_data.tool5$data |>
    mutate(supposed_row_count = 2) |>
    filter(C9_7 > 0 | C9_8 > 0 | C9_9 > 0) |>
    left_join(
      clean_data.tool5$Non_Useable_Toilets |>
        group_by(KEY = PARENT_KEY) |>
        summarise(current_row_count = n()) , by = "KEY") |>
    filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
    mutate(
      issue = case_when(
        is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Non_Useable_Toilets sheet",
        TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Non_Useable_Toilets sheet")
      ),
      sheet_name = "Non_Useable_Toilets",
      Row_count_column_name = "",
      Row_count_from_tab = "data"
    ) |>
    select(
      PARENT_KEY = KEY,
      issue,
      supposed_row_count,
      current_row_count,
      sheet_name,
      Row_count_column_name,
      Row_count_from_tab
    )) |> 
    mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School"),
  
  # Tool 6
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool6$data, KEY, supposed_row_count = D4_N),
      child_df = clean_data.tool6$Subjects_Added,
      child_sheet_name = "Subjects_Added"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "D4_N") |>
      left_join(clean_data.tool6$data |> select(KEY, Sample_Type), by = c("PARENT_KEY" = "KEY"))
  ) |> 
    mutate(tool = "Tool 6 - Parent"),
  
  # Tool 7
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool7$data |> filter(C1 == 1) |> mutate(C5_value_count = case_when(
        is.na(C5) | str_trim(C5) == "" ~ 0,
        str_detect(C5, "8888") ~ (str_count(C5, " ")),
        TRUE ~ (str_count(C5, " ")+1)
      )), KEY, supposed_row_count = C5_value_count),
      child_df = clean_data.tool7$C6_list_members,
      child_sheet_name = "C6_list_members"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C5"),
    
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool7$data, KEY, supposed_row_count = E4_N),
      child_df = clean_data.tool7$Subjects_Added,
      child_sheet_name = "Subjects_Added"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E4_N")
  ) |>
    left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = c("PARENT_KEY" = "KEY")) |> 
    mutate(tool = "Tool 7 - Shura"),
  
  # Tool 8
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = E2),
      child_df = clean_data.tool8$Classes,
      child_sheet_name = "Classes"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E2"),
    
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data |> filter(E16 == 1), KEY, supposed_row_count = E17),
      child_df = clean_data.tool8$Adults_At_The_CBE,
      child_sheet_name = "Adults_At_The_CBE"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E17"),
    
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = E2),
      child_df = clean_data.tool8$Section_2_2_3_Attendance_Rec...,
      child_sheet_name = "Section_2_2_3_Attendance_Rec..."
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E2"),
    
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data |> filter(Monitoring_Before_After_Exam %in% c(1, "1")), KEY, supposed_row_count = E2),
      child_df = clean_data.tool8$Section_2_2_4_Headcount,
      child_sheet_name = "Section_2_2_4_Headcount"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E2"),
    
    # 5
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = E2),
      child_df = clean_data.tool8$Section_2_4_Student_Ages,
      child_sheet_name = "Section_2_4_Student_Ages"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E2"),
    
    # 6
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data |> filter(N1 == 1) |> mutate(N5_value_count = case_when(
        is.na(N5) | str_trim(N5) == "" ~ 0,
        TRUE ~ (str_count(N5, " ")+1)
      )), KEY, supposed_row_count = N5_value_count),
      child_df = clean_data.tool8$Classroom_Materials,
      child_sheet_name = "Classroom_Materials"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "N5"),
    
    # 7
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data |> filter(P1 == 1) |> mutate(P5_value_count = case_when(
        is.na(P5) | str_trim(P5) == "" ~ 0,
        TRUE ~ (str_count(P5, " ")+1)
      )), KEY, supposed_row_count = P5_value_count),
      child_df = clean_data.tool8$Teacher_Kit,
      child_sheet_name = "Teacher_Kit"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "P5"),
    
    # 8
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data |> filter(R1 == 1) |> mutate(R5_value_count = case_when(
        is.na(R5) | str_trim(R5) == "" ~ 0,
        TRUE ~ (str_count(R5, " ")+1)
      )), KEY, supposed_row_count = R5_value_count),
      child_df = clean_data.tool8$Student_Kit,
      child_sheet_name = "Student_Kit"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "R5"),
    
    # 9
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data %>% filter(Received_Other_Training == 1), KEY, supposed_row_count = N_Received_Other_Training),
      child_df = clean_data.tool8$N_Other_Training,
      child_sheet_name = "N_Other_Training"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "N_Received_Other_Training"),
    
    # 10
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data |> filter(V1 == 3 & V4 != 8888) |> mutate(V4_value_count = case_when(
        is.na(V4) | str_trim(V4) == "" ~ 0,
        TRUE ~ (str_count(V4, " ")+1)
      )), KEY, supposed_row_count = V4_value_count),
      child_df = clean_data.tool8$V_list_of_all_members,
      child_sheet_name = "V_list_of_all_members"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "V4"),
    
    # 11
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data |> filter(Y3 == 2), KEY, supposed_row_count = Y4_N),
      child_df = clean_data.tool8$Subjects_Added,
      child_sheet_name = "Subjects_Added"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Y4_N")
  ) |>
    mutate(tool = "Tool 8 - Class", Sample_Type = "CBE"),
  # Tool 9
    compare_row_counts(
      supposed_count_df = select(clean_data.tool9$data, KEY, supposed_row_count = n_cbes),
      child_df = clean_data.tool9$Questions_Repeat,
      child_sheet_name =  "Questions_Repeat"
    ) %>% mutate(Row_count_from_tab = "data", Row_count_column_name = "n_cbes", tool = "Tool 9 - IP", Sample_Type = "CBE")
)


# Remove Unnecessary Objects from Environment --------------------------------------------------------------
rm(list = c("count_sm_selected_choices", "compare_row_counts"))
