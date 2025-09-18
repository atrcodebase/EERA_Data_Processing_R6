source("R/functions/missing_translation_function.R")

# Find missing translations to add in the translation log -----------------
missing_translations_kdr <- ## Tool 1 - KDR
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool1_kdr$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool1_kdr$Support_Respondents) |> mutate(Tab_Name = "Support_Respondents"),
    missing_translation_func(clean_data.tool1_kdr$School_Operationality) |> mutate(Tab_Name = "School_Operationality"),
    missing_translation_func(clean_data.tool1_kdr$Shifts_Detail) |> mutate(Tab_Name = "Shifts_Detail"),
    missing_translation_func(clean_data.tool1_kdr$Headmasters) |> mutate(Tab_Name = "Headmasters"),
    missing_translation_func(clean_data.tool1_kdr$Weekly_Class_Schedule_New) |> mutate(Tab_Name = "Weekly_Class_Schedule_New"),
    missing_translation_func(clean_data.tool1_kdr$Subjects_Detail) |> mutate(Tab_Name = "Subjects_Detail"),
    missing_translation_func(clean_data.tool1_kdr$Additional_Subjects) |> mutate(Tab_Name = "Additional_Subjects"),
    missing_translation_func(clean_data.tool1_kdr$Education_Quality) |> mutate(Tab_Name = "Education_Quality"),
    missing_translation_func(clean_data.tool1_kdr$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
  mutate(tool = "Tool 1 - Headmaster KDR", Sample_Type = "Public School", .before = question_name)

missing_translations <- plyr::rbind.fill(
  ## Tool 0
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool0$data) |> mutate(Tab_name = "data"),
    missing_translation_func(clean_data.tool0$Tool3_Classes) |> mutate(Tab_name = "Tool3_Classes"),
    missing_translation_func(clean_data.tool0$Tool3_T2_Classes_VD) |> mutate(Tab_name = "Tool3_T2_Classes_VD"),
    missing_translation_func(clean_data.tool0$Tool1_Timetable_Year) |> mutate(Tab_name = "Tool1_Timetable_Year"),
    missing_translation_func(clean_data.tool0$Tool1_Timetable1_Repeat) |> mutate(Tab_name = "Tool1_Timetable1_Repeat"),
    missing_translation_func(clean_data.tool0$Tool1_Timetable2_Repeat) |> mutate(Tab_name = "Tool1_Timetable2_Repeat"),
    missing_translation_func(clean_data.tool0$Tool1_Timetable3_Repeat) |> mutate(Tab_name = "Tool1_Timetable3_Repeat"),
    missing_translation_func(clean_data.tool0$Tool1_Timetable4_Repeat) |> mutate(Tab_name = "Tool1_Timetable4_Repeat"),
    missing_translation_func(clean_data.tool0$Tool3_Grades_Repeat) |> mutate(Tab_name = "Tool3_Grades_Repeat")
  ) |>
    mutate(tool = "Tool 0 - Data Entry", Sample_Type = "Public School", .before = question_name),
  
  ## Tool 1
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool1$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool1$Support_Respondents) |> mutate(Tab_Name = "Support_Respondents"),
    missing_translation_func(clean_data.tool1$Subjects_Detail) |> mutate(Tab_Name = "Subjects_Detail"),
    missing_translation_func(clean_data.tool1$Additional_Subjects) |> mutate(Tab_Name = "Additional_Subjects"),
    missing_translation_func(clean_data.tool1$Education_Quality) |> mutate(Tab_Name = "Education_Quality"),
    missing_translation_func(clean_data.tool1$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School", .before = question_name),
  
  ## Tool 2
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool2$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool2$Support_Respondents) |> mutate(Tab_Name = "Support_Respondents"),
    missing_translation_func(clean_data.tool2$School_Operationality) |> mutate(Tab_Name = "School_Operationality"),
    missing_translation_func(clean_data.tool2$Shifts_Detail) |> mutate(Tab_Name = "Shifts_Detail"),
    missing_translation_func(clean_data.tool2$Headmasters) |> mutate(Tab_Name = "Headmasters"),
    missing_translation_func(clean_data.tool2$Attendance_Sheet_Photos) |> mutate(Tab_Name = "Attendance_Sheet_Photos"),
    missing_translation_func(clean_data.tool2$Public_Stationary_Kit_Group) |> mutate(Tab_Name = "Public_Stationary_Kit_Group"),
    missing_translation_func(clean_data.tool2$Teachers_Pack_Group) |> mutate(Tab_Name = "Teachers_Pack_Group"),
    missing_translation_func(clean_data.tool2$Students_Pack_Group) |> mutate(Tab_Name = "Students_Pack_Group"),
    missing_translation_func(clean_data.tool2$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School", .before = question_name),
  
  ## Tool 3
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool3$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool3$Support_Respondents) |> mutate(Tab_Name = "Support_Respondents"),
    missing_translation_func(clean_data.tool3$Grade_Details) |> mutate(Tab_Name = "Grade_Details"),
    missing_translation_func(clean_data.tool3$Todays_Attendance_Detail) |> mutate(Tab_Name = "Todays_Attendance_Detail"),
    missing_translation_func(clean_data.tool3$Student_Headcount) |> mutate(Tab_Name = "Student_Headcount"),
    missing_translation_func(clean_data.tool3$Tool3_Grades_Repeat) |> mutate(Tab_Name = "Tool3_Grades_Repeat"),
    missing_translation_func(clean_data.tool3$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School", .before = question_name),
  
  ## Tool 4
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool4$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool4$Additional_Subjects) |> mutate(Tab_Name = "Additional_Subjects"),
    missing_translation_func(clean_data.tool4$Subjects_taught_by_this_teacher) |> mutate(Tab_Name = "Subjects_taught_by_this_teacher"),
    missing_translation_func(clean_data.tool4$Subjects_Not_Being_Taught) |> mutate(Tab_Name = "Subjects_Not_Being_Taught"),
    missing_translation_func(clean_data.tool4$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School", .before = question_name),

  ## Tool 5
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool5$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool5$Under_Construction_Toilets) |> mutate(Tab_Name = "Under_Construction_Toilets"),
    missing_translation_func(clean_data.tool5$Useable_Toilets) |> mutate(Tab_Name = "Useable_Toilets"),
    missing_translation_func(clean_data.tool5$Non_Useable_Toilets) |> mutate(Tab_Name = "Non_Useable_Toilets"),
    missing_translation_func(clean_data.tool5$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School", .before = question_name),

  ## Tool 6
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool6$data) |> mutate(Tab_Name = "data") |> 
      left_join(clean_data.tool6$data |> select(KEY, Sample_Type), by = "KEY"),
    
    missing_translation_func(clean_data.tool6$Subjects_Added) |> mutate(Tab_Name = "Subjects_Added") |>
      mutate(
        PARENT_KEY = str_sub(KEY, 1, 41)
      ) |> left_join(clean_data.tool6$data |> select(KEY, Sample_Type), by = c("PARENT_KEY" = "KEY")) |>
      select(-PARENT_KEY)
  ) |>
    mutate(tool = "Tool 6 - Parent") |>
    select(tool, Sample_Type, everything()),

  ## Tool 7
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool7$data) |> mutate(Tab_Name = "data") |> 
      left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = "KEY"),
    
    missing_translation_func(clean_data.tool7$C6_list_members) |> mutate(Tab_Name = "C6_list_members") |>
      mutate(
        PARENT_KEY = str_sub(KEY, 1, 41)
      ) |> left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = c("PARENT_KEY" = "KEY")) |>
      select(-PARENT_KEY),
    
    missing_translation_func(clean_data.tool7$Subjects_Added) |> mutate(Tab_Name = "Subjects_Added") |>
      mutate(
        PARENT_KEY = str_sub(KEY, 1, 41)
      ) |> left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = c("PARENT_KEY" = "KEY")) |>
      select(-PARENT_KEY)
  ) |>
    mutate(tool = "Tool 7 - Shura") |>
    select(tool, Sample_Type, everything()),

  ## Tool 8
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool8$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool8$Classes) |> mutate(Tab_Name = "Classes"),
    missing_translation_func(clean_data.tool8$Adults_At_The_CBE) |> mutate(Tab_Name = "Adults_At_The_CBE"),
    missing_translation_func(clean_data.tool8$Section_2_2_3_Attendance_Rec...) |> mutate(Tab_Name = "Section_2_2_3_Attendance_Rec..."),
    missing_translation_func(clean_data.tool8$Section_2_2_4_Headcount) |> mutate(Tab_Name = "Section_2_2_4_Headcount"),
    missing_translation_func(clean_data.tool8$Section_2_4_Student_Ages) |> mutate(Tab_Name = "Section_2_4_Student_Ages"),
    missing_translation_func(clean_data.tool8$Classroom_Materials) |> mutate(Tab_Name = "Classroom_Materials"),
    missing_translation_func(clean_data.tool8$Teacher_Kit) |> mutate(Tab_Name = "Teacher_Kit"),
    missing_translation_func(clean_data.tool8$Student_Kit) |> mutate(Tab_Name = "Student_Kit"),
    missing_translation_func(clean_data.tool8$N_Other_Training) |> mutate(Tab_Name = "N_Other_Training"),
    missing_translation_func(clean_data.tool8$V_list_of_all_members) |> mutate(Tab_Name = "V_list_of_all_members"),
    missing_translation_func(clean_data.tool8$Subjects_Added) |> mutate(Tab_Name = "Subjects_Added"),
    missing_translation_func(clean_data.tool8$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 8 - Class", Sample_Type = "CBE", .before = question_name),
  
  ## Tool 9
  plyr::rbind.fill(
    missing_translation_func(clean_data.tool9$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool9$Questions_Repeat) |> mutate(Tab_Name = "Questions_Repeat"),
    missing_translation_func(clean_data.tool9$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 9 - IP", Sample_Type = "CBE", .before = question_name)
)

need_translation <- list(
  # Tool 0
  `Tool 0 - Data Entry` = c(
  "Tool2_Months_Attendance_Signed_Other",
  "Tool3_Class_Name",
  "Tool1_Timetable_Other",
  "Tool1_Timetable1_Class_Name1",
  "Tool1_Timetable1_Class_Name2",
  
  "Tool1_Timetable1_Class1_Saturday_Other1", "Tool1_Timetable1_Class1_Saturday_Other2", "Tool1_Timetable1_Class1_Saturday_Other3", "Tool1_Timetable1_Class1_Saturday_Other4", "Tool1_Timetable1_Class1_Saturday_Other5",
  "Tool1_Timetable1_Class1_Sunday_Other1", "Tool1_Timetable1_Class1_Sunday_Other2", "Tool1_Timetable1_Class1_Sunday_Other3", "Tool1_Timetable1_Class1_Sunday_Other4", "Tool1_Timetable1_Class1_Sunday_Other5",
  "Tool1_Timetable1_Class1_Monday_Other1", "Tool1_Timetable1_Class1_Monday_Other2", "Tool1_Timetable1_Class1_Monday_Other3", "Tool1_Timetable1_Class1_Monday_Other4", "Tool1_Timetable1_Class1_Monday_Other5",
  "Tool1_Timetable1_Class1_Tuesday_Other1", "Tool1_Timetable1_Class1_Tuesday_Other2", "Tool1_Timetable1_Class1_Tuesday_Other3", "Tool1_Timetable1_Class1_Tuesday_Other4", "Tool1_Timetable1_Class1_Tuesday_Other5",
  "Tool1_Timetable1_Class1_Wednesday_Other1", "Tool1_Timetable1_Class1_Wednesday_Other2", "Tool1_Timetable1_Class1_Wednesday_Other3", "Tool1_Timetable1_Class1_Wednesday_Other4", "Tool1_Timetable1_Class1_Wednesday_Other5",
  "Tool1_Timetable1_Class1_Thursday_Other1", "Tool1_Timetable1_Class1_Thursday_Other2", "Tool1_Timetable1_Class1_Thursday_Other3", "Tool1_Timetable1_Class1_Thursday_Other4", "Tool1_Timetable1_Class1_Thursday_Other5",
  
  "Tool1_Timetable1_Class2_Saturday_Other1", "Tool1_Timetable1_Class2_Saturday_Other2", "Tool1_Timetable1_Class2_Saturday_Other3", "Tool1_Timetable1_Class2_Saturday_Other4", "Tool1_Timetable1_Class2_Saturday_Other5",
  "Tool1_Timetable1_Class2_Sunday_Other1", "Tool1_Timetable1_Class2_Sunday_Other2", "Tool1_Timetable1_Class2_Sunday_Other3", "Tool1_Timetable1_Class2_Sunday_Other4", "Tool1_Timetable1_Class2_Sunday_Other5",
  "Tool1_Timetable1_Class2_Monday_Other1", "Tool1_Timetable1_Class2_Monday_Other2", "Tool1_Timetable1_Class2_Monday_Other3", "Tool1_Timetable1_Class2_Monday_Other4", "Tool1_Timetable1_Class2_Monday_Other5",
  "Tool1_Timetable1_Class2_Tuesday_Other1", "Tool1_Timetable1_Class2_Tuesday_Other2", "Tool1_Timetable1_Class2_Tuesday_Other3", "Tool1_Timetable1_Class2_Tuesday_Other4", "Tool1_Timetable1_Class2_Tuesday_Other5",
  "Tool1_Timetable1_Class2_Wednesday_Other1", "Tool1_Timetable1_Class2_Wednesday_Other2", "Tool1_Timetable1_Class2_Wednesday_Other3", "Tool1_Timetable1_Class2_Wednesday_Other4", "Tool1_Timetable1_Class2_Wednesday_Other5",
  "Tool1_Timetable1_Class2_Thursday_Other1", "Tool1_Timetable1_Class2_Thursday_Other2", "Tool1_Timetable1_Class2_Thursday_Other3", "Tool1_Timetable1_Class2_Thursday_Other4", "Tool1_Timetable1_Class2_Thursday_Other5",
  
  "Tool1_Timetable2_Class_Name1", "Tool1_Timetable2_Class_Name2",
  
  "Tool1_Timetable2_Class1_Saturday_Other1", "Tool1_Timetable2_Class1_Saturday_Other2", "Tool1_Timetable2_Class1_Saturday_Other3", "Tool1_Timetable2_Class1_Saturday_Other4", "Tool1_Timetable2_Class1_Saturday_Other5",
  "Tool1_Timetable2_Class1_Sunday_Other1", "Tool1_Timetable2_Class1_Sunday_Other2", "Tool1_Timetable2_Class1_Sunday_Other3", "Tool1_Timetable2_Class1_Sunday_Other4", "Tool1_Timetable2_Class1_Sunday_Other5",
  "Tool1_Timetable2_Class1_Monday_Other1", "Tool1_Timetable2_Class1_Monday_Other2", "Tool1_Timetable2_Class1_Monday_Other3", "Tool1_Timetable2_Class1_Monday_Other4", "Tool1_Timetable2_Class1_Monday_Other5",
  "Tool1_Timetable2_Class1_Tuesday_Other1", "Tool1_Timetable2_Class1_Tuesday_Other2", "Tool1_Timetable2_Class1_Tuesday_Other3", "Tool1_Timetable2_Class1_Tuesday_Other4", "Tool1_Timetable2_Class1_Tuesday_Other5",
  "Tool1_Timetable2_Class1_Wednesday_Other1", "Tool1_Timetable2_Class1_Wednesday_Other2", "Tool1_Timetable2_Class1_Wednesday_Other3", "Tool1_Timetable2_Class1_Wednesday_Other4", "Tool1_Timetable2_Class1_Wednesday_Other5",
  "Tool1_Timetable2_Class1_Thursday_Other1", "Tool1_Timetable2_Class1_Thursday_Other2", "Tool1_Timetable2_Class1_Thursday_Other3", "Tool1_Timetable2_Class1_Thursday_Other4",  "Tool1_Timetable2_Class1_Thursday_Other5",
  
  "Tool1_Timetable2_Class2_Saturday_Other1", "Tool1_Timetable2_Class2_Saturday_Other2", "Tool1_Timetable2_Class2_Saturday_Other3", "Tool1_Timetable2_Class2_Saturday_Other4", "Tool1_Timetable2_Class2_Saturday_Other5",
  "Tool1_Timetable2_Class2_Sunday_Other1", "Tool1_Timetable2_Class2_Sunday_Other2", "Tool1_Timetable2_Class2_Sunday_Other3", "Tool1_Timetable2_Class2_Sunday_Other4", "Tool1_Timetable2_Class2_Sunday_Other5",
  "Tool1_Timetable2_Class2_Monday_Other1", "Tool1_Timetable2_Class2_Monday_Other2", "Tool1_Timetable2_Class2_Monday_Other3", "Tool1_Timetable2_Class2_Monday_Other4", "Tool1_Timetable2_Class2_Monday_Other5",
  "Tool1_Timetable2_Class2_Tuesday_Other1", "Tool1_Timetable2_Class2_Tuesday_Other2", "Tool1_Timetable2_Class2_Tuesday_Other3", "Tool1_Timetable2_Class2_Tuesday_Other4", "Tool1_Timetable2_Class2_Tuesday_Other5",
  "Tool1_Timetable2_Class2_Wednesday_Other1", "Tool1_Timetable2_Class2_Wednesday_Other2", "Tool1_Timetable2_Class2_Wednesday_Other3", "Tool1_Timetable2_Class2_Wednesday_Other4", "Tool1_Timetable2_Class2_Wednesday_Other5",
  "Tool1_Timetable2_Class2_Thursday_Other1", "Tool1_Timetable2_Class2_Thursday_Other2", 'Tool1_Timetable2_Class2_Thursday_Other3', "Tool1_Timetable2_Class2_Thursday_Other4", "Tool1_Timetable2_Class2_Thursday_Other5",
  
  "Tool1_Timetable3_Class_Name1", "Tool1_Timetable3_Class_Name2",
  
  "Tool1_Timetable3_Class1_Saturday_Other1", "Tool1_Timetable3_Class1_Saturday_Other2", "Tool1_Timetable3_Class1_Saturday_Other3", "Tool1_Timetable3_Class1_Saturday_Other4", "Tool1_Timetable3_Class1_Saturday_Other5",
  "Tool1_Timetable3_Class1_Sunday_Other1", "Tool1_Timetable3_Class1_Sunday_Other2", "Tool1_Timetable3_Class1_Sunday_Other3", "Tool1_Timetable3_Class1_Sunday_Other4", "Tool1_Timetable3_Class1_Sunday_Other5",
  "Tool1_Timetable3_Class1_Monday_Other1", "Tool1_Timetable3_Class1_Monday_Other2", "Tool1_Timetable3_Class1_Monday_Other3", "Tool1_Timetable3_Class1_Monday_Other4", "Tool1_Timetable3_Class1_Monday_Other5",
  "Tool1_Timetable3_Class1_Tuesday_Other1", "Tool1_Timetable3_Class1_Tuesday_Other2", "Tool1_Timetable3_Class1_Tuesday_Other3", "Tool1_Timetable3_Class1_Tuesday_Other4", "Tool1_Timetable3_Class1_Tuesday_Other5",
  "Tool1_Timetable3_Class1_Wednesday_Other1", "Tool1_Timetable3_Class1_Wednesday_Other2", "Tool1_Timetable3_Class1_Wednesday_Other3", "Tool1_Timetable3_Class1_Wednesday_Other4", "Tool1_Timetable3_Class1_Wednesday_Other5",
  "Tool1_Timetable3_Class1_Thursday_Other1", 'Tool1_Timetable3_Class1_Thursday_Other2', "Tool1_Timetable3_Class1_Thursday_Other3", "Tool1_Timetable3_Class1_Thursday_Other4", "Tool1_Timetable3_Class1_Thursday_Other5",
  
  "Tool1_Timetable3_Class2_Saturday_Other1", 'Tool1_Timetable3_Class2_Saturday_Other2', 'Tool1_Timetable3_Class2_Saturday_Other3', 'Tool1_Timetable3_Class2_Saturday_Other4', 'Tool1_Timetable3_Class2_Saturday_Other5',
  'Tool1_Timetable3_Class2_Sunday_Other1', 'Tool1_Timetable3_Class2_Sunday_Other2', 'Tool1_Timetable3_Class2_Sunday_Other3', 'Tool1_Timetable3_Class2_Sunday_Other4', 'Tool1_Timetable3_Class2_Sunday_Other5',
  'Tool1_Timetable3_Class2_Monday_Other1', 'Tool1_Timetable3_Class2_Monday_Other2', 'Tool1_Timetable3_Class2_Monday_Other3', 'Tool1_Timetable3_Class2_Monday_Other4', 'Tool1_Timetable3_Class2_Monday_Other5',
  'Tool1_Timetable3_Class2_Tuesday_Other1', 'Tool1_Timetable3_Class2_Tuesday_Other2', 'Tool1_Timetable3_Class2_Tuesday_Other3', 'Tool1_Timetable3_Class2_Tuesday_Other4', 'Tool1_Timetable3_Class2_Tuesday_Other5',
  'Tool1_Timetable3_Class2_Wednesday_Other1', 'Tool1_Timetable3_Class2_Wednesday_Other2', 'Tool1_Timetable3_Class2_Wednesday_Other3', 'Tool1_Timetable3_Class2_Wednesday_Other4', 'Tool1_Timetable3_Class2_Wednesday_Other5',
  'Tool1_Timetable3_Class2_Thursday_Other1', 'Tool1_Timetable3_Class2_Thursday_Other2', 'Tool1_Timetable3_Class2_Thursday_Other3', 'Tool1_Timetable3_Class2_Thursday_Other4', 'Tool1_Timetable3_Class2_Thursday_Other5',
  
  "Tool1_Timetable4_Class_Name1", "Tool1_Timetable4_Class_Name2",
  
  'Tool1_Timetable4_Class1_Saturday_Other1', 'Tool1_Timetable4_Class1_Saturday_Other2','Tool1_Timetable4_Class1_Saturday_Other3', 'Tool1_Timetable4_Class1_Saturday_Other4', 'Tool1_Timetable4_Class1_Saturday_Other5',
  'Tool1_Timetable4_Class1_Sunday_Other1', 'Tool1_Timetable4_Class1_Sunday_Other2', 'Tool1_Timetable4_Class1_Sunday_Other3', 'Tool1_Timetable4_Class1_Sunday_Other4', 'Tool1_Timetable4_Class1_Sunday_Other5',
  'Tool1_Timetable4_Class1_Monday_Other1', 'Tool1_Timetable4_Class1_Monday_Other2', 'Tool1_Timetable4_Class1_Monday_Other3', 'Tool1_Timetable4_Class1_Monday_Other4', 'Tool1_Timetable4_Class1_Monday_Other5',
  'Tool1_Timetable4_Class1_Tuesday_Other1', 'Tool1_Timetable4_Class1_Tuesday_Other2', 'Tool1_Timetable4_Class1_Tuesday_Other3', 'Tool1_Timetable4_Class1_Tuesday_Other4', 'Tool1_Timetable4_Class1_Tuesday_Other5',
  'Tool1_Timetable4_Class1_Wednesday_Other1', 'Tool1_Timetable4_Class1_Wednesday_Other2', 'Tool1_Timetable4_Class1_Wednesday_Other3', 'Tool1_Timetable4_Class1_Wednesday_Other4', 'Tool1_Timetable4_Class1_Wednesday_Other5',
  'Tool1_Timetable4_Class1_Thursday_Other1', 'Tool1_Timetable4_Class1_Thursday_Other2', 'Tool1_Timetable4_Class1_Thursday_Other3', 'Tool1_Timetable4_Class1_Thursday_Other4', 'Tool1_Timetable4_Class1_Thursday_Other5',
 
  'Tool1_Timetable4_Class2_Saturday_Other1', 'Tool1_Timetable4_Class2_Saturday_Other2', 'Tool1_Timetable4_Class2_Saturday_Other3', "Tool1_Timetable4_Class2_Saturday_Other4", "Tool1_Timetable4_Class2_Saturday_Other5",
  "Tool1_Timetable4_Class2_Sunday_Other1", "Tool1_Timetable4_Class2_Sunday_Other2", "Tool1_Timetable4_Class2_Sunday_Other3", "Tool1_Timetable4_Class2_Sunday_Other4", "Tool1_Timetable4_Class2_Sunday_Other5",
  "Tool1_Timetable4_Class2_Monday_Other1", "Tool1_Timetable4_Class2_Monday_Other2", "Tool1_Timetable4_Class2_Monday_Other3", "Tool1_Timetable4_Class2_Monday_Other4", "Tool1_Timetable4_Class2_Monday_Other5",
  "Tool1_Timetable4_Class2_Tuesday_Other1", "Tool1_Timetable4_Class2_Tuesday_Other2", "Tool1_Timetable4_Class2_Tuesday_Other3", "Tool1_Timetable4_Class2_Tuesday_Other4", "Tool1_Timetable4_Class2_Tuesday_Other5",
  "Tool1_Timetable4_Class2_Wednesday_Other1", "Tool1_Timetable4_Class2_Wednesday_Other2", "Tool1_Timetable4_Class2_Wednesday_Other3", "Tool1_Timetable4_Class2_Wednesday_Other4", "Tool1_Timetable4_Class2_Wednesday_Other5",
  "Tool1_Timetable4_Class2_Thursday_Other1", "Tool1_Timetable4_Class2_Thursday_Other2", "Tool1_Timetable4_Class2_Thursday_Other3", "Tool1_Timetable4_Class2_Thursday_Other4", "Tool1_Timetable4_Class2_Thursday_Other5"),
  
  # Tool 1:
  `Tool 1 - Headmaster` = c(
  "A31_Other", "Interviewee_Respondent_Type_Other", "B6_Other", "B9_Other", "B10_Other", "C2_Other", "C4_Other", "C4_1_Other",
  "C9_Other", "C12A3_Other",
  "F10_Other", "F14","F15_Other", "F17_Other", 'Additional_Subject', "H2_Other", "H3_Other", "I7_Other",
  "J2_Other", "J3_Other", "J4_Other",
  "J5_Other", "J7_Other", "J9_Other", "J10_Other", 
  "J13_Other", "J15_Other", "J17_Other", "J19_Other", "J21_Other", "K3_Other", "K4_Other",
  'I8_A_Other', 'I8_B_Other', 'I8_C_Other', 'I8_D_Other', 'F1_No_Other'),
  
  
  
  # Tool 2:
  `Tool 2 - Light` = c(
  "D4_Other", "D4_1_Other", 
  "D10_2_Other", 'C13A3_Other',
  'E3_Other', 'E4_Other', 'E7_Other', 'E8_Other' , 'H2_Other', "H5_Other", "H8_Other", "H11_Other", "H14_Other", 'H16_Other', 
  "i2_Other", "i5_Other", "i8_Other", "i11_Other", "i14_Other", "i16_Other", "J2_Other", "J5_Other", "J8_Other", "J11_Other", "J14_Other",
  "J16_Other", 'Kitab_Jinsi_Or_Distribution_Ticket_Available_Other'),
  
  # Tool 3:
  `Tool 3 - Headcount` = c(
  "Interviewee_Respondent_Type_Other", "B2_Other","B10A3_Other", "C2_Other", 'C3_Other', "C5_Other", "C6_Other", "C7_Other", 
  "C10"),
  

  # Tool 4:
  `Tool 4 - Teacher` = c(
  "D1_Other", "D3_Other", "D5_Other", "D6_Other", "D9_Other",
  "F5_Other", "F10_Other",
  "F13_Other","F14_Other", "F16_Other", "F17_Other", "G2_Other", "G3_Other", "G6_Other", 'G8_Other', 'H3_Other', "H5_Other", "H7_Other", 
  "D6_IP_Name", "F2_Subject_Name", "F9", 'Study_Field_Other'),
  
  # Tool 5:
  `Tool 5 - WASH` = c("Interviewee_Respondent_Type_Other"), 

  # Tool 6:
  `Tool 6 - Parent` = c(
  "B5_Other", 
  "D3_Other", "D4_Other", 'D6_Other',
  "D10_Other", "D11_Other", "D13_Other", "D14_Other", "E3_Other", "E5_Other", "F2_Other", "F4_Other", "F5_Other",
  "F7_Other", "F8_Other", "F13_2_Other", "F13_3_Other",  "D5_Subject_Name",
  'I2_Other'), # New
  
  # Tool 7:
  `Tool 7 - Shura` = c(
  "B6_Other", 
  "C0_Other", "C2_1_Other", "C2_2_Other", "C3_Other", "C4_Other", "C5_Other", "C8_Other", "C9_Other", "C11_Other", "C12_Other", "C14_Other",
  "C19_Other", "C21_Other", "C23_Other", "C25_Other", "C27_Other", 
  "E2_Other", "E3_Other",  'E6_Yes',
  "E9_Other", "E10_Other", "E12_Other", "E13_Other", "F2_Other", "F4_Other", "G2_Other", "G4_Other", "G6_Other", "G8_Other", "C14_A", "E4_Subject_Name", 'E5',
  "H2_Other"),

  # Tool 8:
  `Tool 8 - Class` = c(
  "B6_Other", "C4_Other", "C6_Other", "C9_Other", "C10_Other", "Interviewee_Respondent_Type_Other", "D11_Other", 
  "E18_1_Other", 
  'N2_Other', "N5_Other", "O3_Other", "O6_Other", "O9_Other", 'O11_Other', 'P2_Other', "P5_Other", "Q3_Other",
  "Q6_Other", "Q9_Other",'Q11_Other','R2_Other', "R5_Other", "S3_Other", "S6_Other", "S9_Other",  'S11_Other',
  "U2_Other", "U5_Other", "V1_Other", "V2_Other", "V3_Other", "V4_Other", 
  "V6_Other", "V7_Other", "V9_Other","V10_Other", "V13_Other", "V17_Other",
  "V25_Other", "W2_Other", 'W3_Other', "W4_Other",'W8_Other', 'W13_Other', 
  "Y3_Other", "Y4_Other", 
  'Y6_Response', 'Y7_Response_Other', "Y10_Other", "Y11_Other", "Y13_Other","Y5_Subject_Name",
  'Y14_Other', 'Two_Weeks_Training_Topics_Other','Training_Topics_Other_Training_Other','T2_Other','T3_Other','Kitab_Jinsi_Or_Distribution_Ticket_Available_Other'), # New
  
  
  
  
  # Tool 9:
  `Tool 9 - IP` = c(
  "A2_Other", "A3_Other", "A4_Other", "A6_Other", "A8_Other", "B3_Other", 'B9_Other', 'C3_Other', 'C5_Other', "Respondent_Designation_Other",
  'A7_Type_Other', 'COC_Language_Other','D7_Other', 'C2_District', 'E2_Other'), # NEW
  
  # Tool1 KDR:
  `Tool 1 - Headmaster KDR` = c(
    'A28', 'Interviewee_Respondent_Type_Other',  'B6_Other', 'B9_Other', 'B10_Other', 'C2_Other',
    'C4_Other', 'C4_1_Other', 'District_SV', 'C12A3_Other', 'C13A3_Other', 'F3_No_Other', 'Additional_Subject', 'H2_Other',
    'H3_Other', 'I7_Other', 'I8_Other', 'J2_Other', 'J5_Other', 'J7_Other', 'J9_Other', 'J10_Other', 'J13_Other', 'J15_Other', 'J17_Other',
    'J19_Other', 'J21_Other', 'K3_Other', 'K4_Other', 'Survey_Language_Other',
    'F10_Other', 'F14', 'F15_Other', 'F17_Other' # NEW
  )
 )

need_translation_kdr <- c(
  # Tool 1 KDR:
  
  )

missing_translation_final <- data.frame()



# t = "Tool 1 - Headmaster"
for(t in unique(missing_translations$tool)){
  tmp <- missing_translations %>% filter(tool == t) %>% filter(question_name %in% need_translation[[t]])
  
  missing_translation_final <- bind_rows(
    missing_translation_final,
    tmp
  )
}


# missing_translations <- missing_translations |>
#   filter(question_name %in% need_translation)
# 
# missing_translations_kdr <- missing_translations_kdr |>
#   filter(question_name %in% need_translation_kdr)

# missing_translations <- bind_rows(missing_translations, missing_translations_kdr)

missing_translations <- missing_translation_final

# to be removed from environment ------------------------------------------
remove(missing_translation_func)
remove(log_translation_cols)
remove(need_translation)
rm(missing_translation_final)

