# School Operationality - Light Tool
tool2.school_operationality_tobe_add <- tobe_added %>% 
  filter(Tool == "Light Tool" & Tab_Name == "School_Operationality") %>% 
  select(KEY = KEY_Unique) %>% 
  mutate(
    PARENT_KEY = gsub("/.*$", "", KEY),
    `SET-OF-School_Operationality` = paste0(PARENT_KEY,"/Passcode_correct-Valid_User-Section_2_Access_to_Education_ECA_1-Section_2_2_1_Shifts_and_Grades_of_School-School_Operationality")
  )

raw_data.tool2$School_Operationality <- raw_data.tool2$School_Operationality %>% 
  bind_rows(tool2.school_operationality_tobe_add)

# Class Tool
tool8.classroomkit_tobe_add <- tobe_added %>% 
  filter(Tool == "Class Level" & Tab_Name == "Classroom_Materials") %>% 
  select(KEY = KEY_Unique) %>% 
  mutate(
    PARENT_KEY = gsub("/.*$", "", KEY),
    `SET-OF-Classroom_Materials` = paste0(PARENT_KEY,"/Passcode_correct-Valid_User-Section_3_Receipt_and_Use_of_TLM-A_CLASSROOM_MATERIALS-Classroom_Materials")
  )
raw_data.tool8$Classroom_Materials <- raw_data.tool8$Classroom_Materials %>% 
  bind_rows(tool8.classroomkit_tobe_add)

tool8.teacherkit_tobe_add <- tobe_added %>% 
  filter(Tool == "Class Level" & Tab_Name == "Teacher_Kit") %>% 
  select(KEY = KEY_Unique) %>% 
  mutate(
    PARENT_KEY = gsub("/.*$", "", KEY),
    `SET-OF-Teacher_Kit` = paste0(PARENT_KEY,"/Passcode_correct-Valid_User-Section_3_Receipt_and_Use_of_TLM-B_Teacher_Kit-Teacher_Kit")
  )
raw_data.tool8$Teacher_Kit <- raw_data.tool8$Teacher_Kit %>% 
  bind_rows(tool8.teacherkit_tobe_add)

tool8.studentkit_tobe_add <- tobe_added %>% 
  filter(Tool == "Class Level" & Tab_Name == "Student_Kit") %>% 
  select(KEY = KEY_Unique) %>% 
  mutate(
    PARENT_KEY = gsub("/.*$", "", KEY),
    `SET-OF-Student_Kit` = paste0(PARENT_KEY,"/Passcode_correct-Valid_User-Section_3_Receipt_and_Use_of_TLM-C_Student_Kit-Student_Kit")
  )
raw_data.tool8$Student_Kit <- raw_data.tool8$Student_Kit %>% 
  bind_rows(tool8.studentkit_tobe_add)
