## Data Entry Logic Checks ------------------------------------------------------
## main sheet ---------------------------------------------------------
lc_tool_data_entry <- rbind(
  # Flagging for BLANK Meta columns
  clean_data.tool0$data |>
    filter(is.na(SubmissionDate)) |>
    mutate(
      Issue = "Blank value!",
      Question = "SubmissionDate",
      Old_value = as.character(SubmissionDate),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(starttime)) |>
    mutate(
      Issue = "Blank value!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(endtime)) |>
    mutate(
      Issue = "Blank value!",
      Question = "endtime",
      Old_value = as.character(endtime),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(Site_Visit_ID)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Site_Visit_ID",
      Old_value = as.character(Site_Visit_ID),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(Province)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Province",
      Old_value = as.character(Province),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(District)) |>
    mutate(
      Issue = "Blank value!",
      Question = "District",
      Old_value = as.character(District),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(Region)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Region",
      Old_value = as.character(Region),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(Area_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Area_Type",
      Old_value = as.character(Area_Type),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(School_CBE_Name)) |>
    mutate(
      Issue = "Blank value!",
      Question = "School_CBE_Name",
      Old_value = as.character(School_CBE_Name),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(EMIS_School_ID_CBE_KEY)) |>
    mutate(
      Issue = "Blank value!",
      Question = "EMIS_School_ID_CBE_KEY",
      Old_value = as.character(EMIS_School_ID_CBE_KEY),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(Type_Of_School_CBE_Based_On_The_Sample)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Type_Of_School_CBE_Based_On_The_Sample",
      Old_value = as.character(Type_Of_School_CBE_Based_On_The_Sample),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$data |>
    filter(is.na(School_CBE_Gender_Based_On_The_Sample)) |>
    mutate(
      Issue = "Blank value!",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = as.character(School_CBE_Gender_Based_On_The_Sample),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),

  # Flagging duplicated site visit ID - Tool 1
  clean_data.tool0$data |>
    filter(Tool == "Tool 1EERA School Indepth VisitPrincipal Interview") |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Site Visit ID is duplicated For Tool 1!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = ""
    ) |>
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |> 
    arrange(Old_value),
  
  # Flagging duplicated site visit ID - Tool 2
  clean_data.tool0$data |>
    filter(Tool == "Tool 2EERA School Light VisitPrinciple Interview") |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Site Visit ID is duplicated for Tool 2!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = ""
    ) |>
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |> 
    arrange(Old_value),
  
  # Flagging duplicated site visit ID - Tool 3
  clean_data.tool0$data |>
    filter(Tool == "Tool 3EERA School Student Document and Headcount") |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Site Visit ID is duplicated For Tool 3!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = ""
    ) |>
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |> 
    arrange(Old_value),
  
  # Flagging duplicated site visit ID - Tool 8
  clean_data.tool0$data |>
    filter(Tool == "Tool 8EERA CBETeacher Interview") |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Site Visit ID is duplicated For Tool 8!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = ""
    ) |>
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |> 
    arrange(Old_value),
  
  #Flagging if the number of attendance books' page is less than the number of attendance book
  clean_data.tool0$data |>
    filter(Tool2_N_Attendance_Books > Tool2_N_Pages_Attendance_Books) |> 
    mutate(
      Issue = "The number of attendance books' page is less than the number of attendance book",
      Question = "Tool2_N_Attendance_Books",
      Old_value = Tool2_N_Attendance_Books,
      Related_question = "Tool2_N_Pages_Attendance_Books",
      Related_value = Tool2_N_Pages_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if the number of attendance book is more than 0 and number of pages of attendance book is equal to 0
  clean_data.tool0$data |>
    filter(Tool2_N_Attendance_Books > 0 & Tool2_N_Pages_Attendance_Books == 0) |> 
    mutate(
      Issue = "The number of attendance book is more than 0 but the number of pages of attendance book is reported 0",
      Question = "Tool2_N_Attendance_Books",
      Old_value = Tool2_N_Attendance_Books,
      Related_question = "Tool2_N_Pages_Attendance_Books",
      Related_value = Tool2_N_Pages_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  #Flagging if the number of attendace book 0 and number of pages of attendance book is more than 0
  clean_data.tool0$data |>
    filter(Tool2_N_Attendance_Books == 0 & Tool2_N_Pages_Attendance_Books > 0) |> 
    mutate(
      Issue = "The number of attendace book is 0 but number of pages of attendance book is reported more than 0 page/s",
      Question = "Tool2_N_Attendance_Books",
      Old_value = Tool2_N_Attendance_Books,
      Related_question = "Tool2_N_Pages_Attendance_Books",
      Related_value = Tool2_N_Pages_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  #Flagging if the number of attendance book is less than 0
  clean_data.tool0$data |>
    filter(Tool2_N_Attendance_Books < 0) |> 
    mutate(
      Issue = "The number of attendace book is less than 0",
      Question = "Tool2_N_Attendance_Books",
      Old_value = Tool2_N_Attendance_Books,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  #Flagging if the number of pages of attendance book is less than 0
  clean_data.tool0$data |>
    filter(Tool2_N_Pages_Attendance_Books < 0) |> 
    mutate(
      Issue = "The number of pages of attendance book is less than 0",
      Question = "Tool2_N_Pages_Attendance_Books",
      Old_value = Tool2_N_Pages_Attendance_Books,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  #Flagging if the number of teacher staff attendance book is more than 0
  clean_data.tool0$data |>
    filter(Tool2_N_Teachers_Staff_All_Attendance_Books < 0) |> 
    mutate(
      Issue = "The number of teacher staff attendance book is reported less than 0",
      Question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Old_value = Tool2_N_Teachers_Staff_All_Attendance_Books ,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  #Flagging if the number of attendance book is 0 and the number of teacher staff attendance book is more than 0
  clean_data.tool0$data |>
    filter(Tool2_N_Attendance_Books == 0 & Tool2_N_Teachers_Staff_All_Attendance_Books > 0) |> 
    mutate(
      Issue = "The number of attendance book is 0 but the number of teacher staff attendance book is reported more than 0",
      Question = "Tool2_N_Attendance_Books",
      Old_value = Tool2_N_Attendance_Books ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  #Flagging if the number of Male Teachers Present in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
    filter(Tool2_Total_Male_Teachers > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Male Teachers in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Total_Male_Teachers",
      Old_value = Tool2_Total_Male_Teachers ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if the number of Male Staffs Present in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
    filter(Tool2_Total_Male_Staff_Members > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Male Staffs in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Total_Male_Staff_Members",
      Old_value = Tool2_Total_Male_Staff_Members ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if the number of Female Teachers Present in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
    filter(Tool2_Total_Female_Teachers > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Female Teachers in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Total_Female_Teachers",
      Old_value = Tool2_Total_Female_Teachers ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if the number of Female Staffs Present in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
    filter(Tool2_Total_Female_Staff_Members > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Female Staffs in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Total_Female_Staff_Members",
      Old_value = Tool2_Total_Female_Staff_Members ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  
  #Flagging if the number of Total Teachers Present in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
    filter(Tool2_Total_Teachers > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Total Teachers in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Total_Teachers",
      Old_value = Tool2_Total_Teachers ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if the number of Total Staffs Present in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
    filter(Tool2_Total_Staff_Members > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Total Staffs in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Total_Staff_Members",
      Old_value = Tool2_Total_Staff_Members ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if the number of Total Teachers and Staffs Present in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
    filter((Tool2_Total_Teachers + Tool2_Total_Staff_Members) > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Total Teachers and Staffs in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "(Tool2_Total_Teachers + Tool2_Total_Staff_Members)",
      Old_value = (Tool2_Total_Teachers + Tool2_Total_Staff_Members) ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )

) |>
  mutate(tool = "Data Entry", sheet = "data")


## Tool 3 Grades Repeat --------------------------------------------------------
lc_DE_tool3.grades_repeat <- rbind(
  #Flagging if the number of students regularly attendance is more than the number of enrolled grade male -- Double Check
  clean_data.tool0$Tool3_Grades_Repeat |>
    filter(Tool3_N_Students_Class_Male_Regular_Attendance > Tool3_N_Students_Enrolled_Grade_Male) |> 
    mutate(
      Issue = "The number of students regularly attendance is more than the number of enrolled grade male .",
      Question = "Tool3_N_Students_Class_Male_Regular_Attendance",
      Old_value = Tool3_N_Students_Class_Male_Regular_Attendance,
      Related_question = "Tool3_N_Students_Enrolled_Grade_Male",
      Related_value = Tool3_N_Students_Enrolled_Grade_Male
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if the number of students regularly attendance is more than the number of enrolled grade female
  clean_data.tool0$Tool3_Grades_Repeat |>
    filter(Tool3_N_Students_Class_Female_Regular_Attendance > Tool3_N_Students_Enrolled_Grade_Female) |> 
    mutate(
      Issue = "The number of female students regularly attendance is more than the number of enrolled grade female .",
      Question = "Tool3_N_Students_Class_Female_Regular_Attendance",
      Old_value = Tool3_N_Students_Class_Female_Regular_Attendance,
      Related_question = "Tool3_N_Students_Enrolled_Grade_Female",
      Related_value = Tool3_N_Students_Enrolled_Grade_Female
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if sum of enrolled male and female is not equal to total
  clean_data.tool0$Tool3_Grades_Repeat|>
    mutate(
      enrolled_m_f_total = rowSums(across(c("Tool3_N_Students_Enrolled_Grade_Male","Tool3_N_Students_Enrolled_Grade_Female")), na.rm = T)
    ) |>
    filter(Tool3_N_Students_Enrolled_Grade_Total != enrolled_m_f_total) |>
    mutate(
      Issue = "Sum of enrolled male and female is not equal to total .",
      Question = "Tool3_N_Students_Enrolled_Grade_Total",
      Old_value = Tool3_N_Students_Enrolled_Grade_Total,
      Related_question = "Tool3_N_Students_Enrolled_Grade_Male + Tool3_N_Students_Enrolled_Grade_Female",
      Related_value = paste0(Tool3_N_Students_Enrolled_Grade_Male, " + ", Tool3_N_Students_Enrolled_Grade_Female)
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if sum of attended male and female is not equal to total
  clean_data.tool0$Tool3_Grades_Repeat|>
    mutate(
      attended_m_f_total = rowSums(across(c("Tool3_N_Students_Class_Male_Regular_Attendance","Tool3_N_Students_Class_Female_Regular_Attendance")), na.rm = T)
    ) |>
    filter(Tool3_N_Students_Class_Total_Regular_Attendance != attended_m_f_total) |>
    mutate(
      Issue = "Sum of attended male and female is not equal to total .",
      Question = "Tool3_N_Students_Class_Total_Regular_Attendance",
      Old_value = Tool3_N_Students_Class_Total_Regular_Attendance,
      Related_question = "Tool3_N_Students_Class_Male_Regular_Attendance + Tool3_N_Students_Class_Female_Regular_Attendance",
      Related_value = paste0(Tool3_N_Students_Class_Male_Regular_Attendance, " + ", Tool3_N_Students_Class_Female_Regular_Attendance)
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if sum of permanent absent male and female is not equal to total
  clean_data.tool0$Tool3_Grades_Repeat |>
    mutate(
      absent_m_f_total = rowSums(across(c("Tool3_N_Students_Class_Male_Permanently_Absent","Tool3_N_Students_Class_Female_Permanently_Absent")), na.rm = T)
    ) |>
    filter(Tool3_N_Students_Class_Total_Permanently_Absent != absent_m_f_total) |>
    mutate(
      Issue = "Sum of permanent absent male and female is not equal to total .",
      Question = "Tool3_N_Students_Class_Total_Permanently_Absent",
      Old_value = Tool3_N_Students_Class_Total_Permanently_Absent,
      Related_question = "Tool3_N_Students_Class_Male_Permanently_Absent + Tool3_N_Students_Class_Female_Permanently_Absent",
      Related_value = paste0(Tool3_N_Students_Class_Male_Permanently_Absent, " + ", Tool3_N_Students_Class_Female_Permanently_Absent)
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$Tool3_Grades_Repeat %>% 
    mutate(
      total = rowSums(select(.,Tool3_N_Students_Enrolled_Grade_Male,	Tool3_N_Students_Enrolled_Grade_Female), na.rm = T)) %>% 
    filter(Tool3_N_Students_Enrolled_Grade_Total != total) %>% 
    mutate(
      Issue = "Sum of enrolled male and female student does not match with total enrolled students.",
      Question = "Tool3_N_Students_Enrolled_Grade_Total",
      Old_value = Tool3_N_Students_Enrolled_Grade_Total,
      Related_question = "Tool3_N_Students_Enrolled_Grade_Male + Tool3_N_Students_Enrolled_Grade_Female",
      Related_value = paste0(Tool3_N_Students_Enrolled_Grade_Male, " + ", Tool3_N_Students_Enrolled_Grade_Female)
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$Tool3_Grades_Repeat %>% 
    mutate(
      total = rowSums(select(.,Tool3_N_Students_Class_Male_Regular_Attendance,	Tool3_N_Students_Class_Male_Permanently_Absent), na.rm = T)) %>% 
    filter(Tool3_N_Students_Enrolled_Grade_Male != total) %>% 
    mutate(
      Issue = "Sum of regularly present and permanent absent male student does not match with total enrolled male students.",
      Question = "Tool3_N_Students_Enrolled_Grade_Male",
      Old_value = Tool3_N_Students_Enrolled_Grade_Male,
      Related_question = "Tool3_N_Students_Class_Male_Regular_Attendance + Tool3_N_Students_Class_Male_Permanently_Absent",
      Related_value = paste0(Tool3_N_Students_Class_Male_Regular_Attendance, " + ", Tool3_N_Students_Class_Male_Permanently_Absent)
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$Tool3_Grades_Repeat %>% 
    mutate(
      total = rowSums(select(.,Tool3_N_Students_Class_Female_Regular_Attendance,	Tool3_N_Students_Class_Female_Permanently_Absent), na.rm = T)) %>% 
    filter(Tool3_N_Students_Enrolled_Grade_Female != total) %>% 
    mutate(
      Issue = "Sum of regularly present and permanent absent female student does not match with total enrolled female students.",
      Question = "Tool3_N_Students_Enrolled_Grade_Female",
      Old_value = Tool3_N_Students_Enrolled_Grade_Female,
      Related_question = "Tool3_N_Students_Class_Female_Regular_Attendance + Tool3_N_Students_Class_Female_Permanently_Absent",
      Related_value = paste0(Tool3_N_Students_Class_Female_Regular_Attendance, " + ", Tool3_N_Students_Class_Female_Permanently_Absent)
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$Tool3_Grades_Repeat %>% 
    mutate(
      total = rowSums(select(.,Tool3_N_Students_Class_Total_Regular_Attendance,	Tool3_N_Students_Class_Total_Permanently_Absent), na.rm = T)) %>% 
    filter(Tool3_N_Students_Enrolled_Grade_Total != total) %>% 
    mutate(
      Issue = "Sum of Total regular present and total permanent absent students does not match with Total Enrolled students.",
      Question = "Tool3_N_Students_Enrolled_Grade_Total",
      Old_value = Tool3_N_Students_Enrolled_Grade_Total,
      Related_question = "Tool3_N_Students_Class_Total_Regular_Attendance + Tool3_N_Students_Class_Total_Permanently_Absent",
      Related_value = paste0(Tool3_N_Students_Class_Total_Regular_Attendance, " + ", Tool3_N_Students_Class_Total_Permanently_Absent)
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |>
  mutate(tool = "Data Entry", sheet = "Tool3_Grades_Repeat")

## Tool 3 Class Attendance --------------------------------------------------------
# Tool3_Class_Attendance
lc_DE_tool3.class_attendance <- rbind(
  #Flagging if the number of regularly present male is more than the total student enrolled in attendance sheet male
  clean_data.tool0$Tool3_T2_Classes_VD |> 
    filter(Tool3_Total_Present_Students_Attendance_VD_Male > Tool3_Total_Enrolled_Students_Attendance_VD_Male) |> 
    mutate(
      Issue = "The number of regularly present male is more than the total student enrolled in attendance sheet.",
      Question = "Tool3_Total_Present_Students_Attendance_VD_Male",
      Old_value = Tool3_Total_Present_Students_Attendance_VD_Male,
      Related_question = "Tool3_Total_Enrolled_Students_Attendance_VD_Male",
      Related_value = Tool3_Total_Enrolled_Students_Attendance_VD_Male
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  # Total Enrolled
  #Flagging if the number of regularly present female is more than the total student enrolled in attendance sheet female
  clean_data.tool0$Tool3_T2_Classes_VD |> 
    filter(Tool3_Total_Present_Students_Attendance_VD_Female > Tool3_Total_Enrolled_Students_Attendance_VD_Female) |> 
    mutate(
      Issue = "The number of regularly present female is more than the total student enrolled in attendance sheet.",
      Question = "Tool3_Total_Present_Students_Attendance_VD_Female",
      Old_value = Tool3_Total_Present_Students_Attendance_VD_Female,
      Related_question = "Tool3_Total_Enrolled_Students_Attendance_VD_Female",
      Related_value = Tool3_Total_Enrolled_Students_Attendance_VD_Female
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  #Flagging if the Total number of regularly present students as per the attendance - Gender could not identified is more than the total of gender not identified enrolled in attendance sheet
  clean_data.tool0$Tool3_T2_Classes_VD |> 
    filter(Tool3_Total_Present_Students_Attendance_VD_Gender_Not_Identified > Tool3_Total_Enrolled_Students_Attendance_VD_Gender_Not_Identified) |> 
    mutate(
      Issue = "The number of regularly present students as per the attendance - Gender not identified is more than the total of gender not identified enrolled in attendance sheet.",
      Question = "Tool3_Total_Present_Students_Attendance_VD_Gender_Not_Identified",
      Old_value = Tool3_Total_Present_Students_Attendance_VD_Gender_Not_Identified,
      Related_question = "Tool3_Total_Enrolled_Students_Attendance_VD_Gender_Not_Identified",
      Related_value = Tool3_Total_Enrolled_Students_Attendance_VD_Gender_Not_Identified
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$Tool3_T2_Classes_VD %>% 
    mutate(
      total = rowSums(select(., Tool3_Total_Present_Students_Attendance_VD_Male, Tool3_Total_Absent_Students_Attendance_VD_Male), na.rm = T)
    ) %>%
    filter(Tool3_Total_Enrolled_Students_Attendance_VD_Male != total) %>%
    mutate(
      Issue = "Sum of present and absent male students does not match with total enrolled male student.",
      Question = "Tool3_Total_Enrolled_Students_Attendance_VD_Male",
      Old_value = Tool3_Total_Enrolled_Students_Attendance_VD_Male,
      Related_question = "Tool3_Total_Present_Students_Attendance_VD_Male + Tool3_Total_Absent_Students_Attendance_VD_Male",
      Related_value = paste0(Tool3_Total_Present_Students_Attendance_VD_Male," + ", Tool3_Total_Absent_Students_Attendance_VD_Male)
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$Tool3_T2_Classes_VD %>% 
    mutate(
      total = rowSums(select(., Tool3_Total_Present_Students_Attendance_VD_Female, Tool3_Total_Absent_Students_Attendance_VD_Female), na.rm = T)
    ) %>%
    filter(Tool3_Total_Enrolled_Students_Attendance_VD_Female != total) %>%
    mutate(
      Issue = "Sum of present and absent female students does not match with total enrolled female student.",
      Question = "Tool3_Total_Enrolled_Students_Attendance_VD_Female",
      Old_value = Tool3_Total_Enrolled_Students_Attendance_VD_Female,
      Related_question = "Tool3_Total_Present_Students_Attendance_VD_Female + Tool3_Total_Absent_Students_Attendance_VD_Female",
      Related_value = paste0(Tool3_Total_Present_Students_Attendance_VD_Female," + ", Tool3_Total_Absent_Students_Attendance_VD_Female)
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool0$Tool3_T2_Classes_VD %>% 
    mutate(
      total = rowSums(select(., Tool3_Total_Present_Students_Attendance_VD_Gender_Not_Identified, Tool3_Total_Absent_Students_Attendance_VD_Gender_Not_Identified), na.rm = T)
    ) %>%
    filter(Tool3_Total_Enrolled_Students_Attendance_VD_Gender_Not_Identified != total) %>%
    mutate(
      Issue = "Sum of present and absent students (gender not identified) does not match with total enrolled students (gender not identified).",
      Question = "Tool3_Total_Enrolled_Students_Attendance_VD_Gender_Not_Identified",
      Old_value = Tool3_Total_Enrolled_Students_Attendance_VD_Gender_Not_Identified,
      Related_question = "Tool3_Total_Present_Students_Attendance_VD_Gender_Not_Identified + Tool3_Total_Absent_Students_Attendance_VD_Gender_Not_Identified",
      Related_value = paste0(Tool3_Total_Present_Students_Attendance_VD_Gender_Not_Identified," + ", Tool3_Total_Absent_Students_Attendance_VD_Gender_Not_Identified)
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
    
) |>
  mutate(tool = "Data Entry" , sheet = "Tool3_T2_Classes_VD")


## Timetable Year --------------------------------------------------------------
all_school_op_and_op_other_grades <- clean_data.tool2$School_Operationality |>
  select(Site_Visit_ID, PARENT_KEY, Grade_Value = Grade) |>
  group_by(Site_Visit_ID, PARENT_KEY, Grade_Value) |>
  mutate(sheet = "School_Operationality", Grade_ID_v = paste0(Site_Visit_ID,"-",Grade_Value)) |>
  filter(!is.na(Grade_Value) & Grade_Value != "" & !(duplicated(Grade_ID_v, fromLast = T) | duplicated(Grade_ID_v, fromLast = F))) |> ungroup() |> arrange(Grade_ID_v) |> 
  pull(Grade_ID_v) |> unique()


all_school_op_and_op_other_grades_no_operational <- clean_data.tool2$School_Operationality |>
  select(Site_Visit_ID ,Grade, is_operational = C13A1) |>
  mutate(sheet = "School_Operationality", Grade_Value = Grade, Grade_ID_v = paste0(Site_Visit_ID,"-",Grade)) |>
  filter(is_operational == "No" & !is.na(Grade) & Grade != "") |>
  select(Site_Visit_ID, is_operational, Grade_Value, Grade_ID_v) |> pull(Grade_ID_v) |> unique()



lc_tool1.timetable_year <- rbind(
  
  # Flagging if the selected grade is not reported as part of possible operational grades in TOOl 1 - timetable 1
  clean_data.tool0$Tool1_Timetable_Year |>
    select(any_of(meta_cols), PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable1_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable1_1:Tool1_How_Many_Timetable1_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(!Grade_ID_calc %in% all_school_op_and_op_other_grades) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the first timetable covered is not reported in Tool 2 (School Operationality Sheets)"),
      Question = "Tool1_How_Many_Timetable1",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if selected grade is not and operational grade in the school reported in tool 1 -  timetable 1
  clean_data.tool0$Tool1_Timetable_Year |>
    select(any_of(meta_cols), PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable1_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable1_1:Tool1_How_Many_Timetable1_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(Grade_ID_calc %in% all_school_op_and_op_other_grades_no_operational) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the first timetable covered is not reported as an operational grade in Tool 2 (School Operationality Sheet)"),
      Question = "Tool1_How_Many_Timetable1",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if the selected grade is not reported as part of possible operational grades in TOOl 1 - timetable 2
  clean_data.tool0$Tool1_Timetable_Year |>
    select(any_of(meta_cols), PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable2_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable2_1:Tool1_How_Many_Timetable2_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(!Grade_ID_calc %in% all_school_op_and_op_other_grades) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the second timetable covered is not reported in Tool 2 (School Operationality Sheets)"),
      Question = "Tool1_How_Many_Timetable2",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if selected grade is not and operational grade in the school reported in tool 1 -  timetable 2
  clean_data.tool0$Tool1_Timetable_Year |>
    select(any_of(meta_cols), PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable2_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable2_1:Tool1_How_Many_Timetable2_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(Grade_ID_calc %in% all_school_op_and_op_other_grades_no_operational) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the second timetable covered is not reported as an operational grade in Tool 2 (School Operationality Sheet)"),
      Question = "Tool1_How_Many_Timetable2",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if the selected grade is not reported as part of possible operational grades in TOOl 1 - timetable 3
  clean_data.tool0$Tool1_Timetable_Year |>
    select(any_of(meta_cols), PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable3_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable3_1:Tool1_How_Many_Timetable3_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(!Grade_ID_calc %in% all_school_op_and_op_other_grades) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the third timetable covered is not reported in Tool 2 (School Operationality Sheets)"),
      Question = "Tool1_How_Many_Timetable3",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if selected grade is not and operational grade in the school reported in tool 1 -  timetable 3
  clean_data.tool0$Tool1_Timetable_Year |>
    select(any_of(meta_cols), PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable3_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable3_1:Tool1_How_Many_Timetable3_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(Grade_ID_calc %in% all_school_op_and_op_other_grades_no_operational) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the third timetable covered is not reported as an operational grade in Tool 2 (School Operationality Sheet)"),
      Question = "Tool1_How_Many_Timetable3",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if the selected grade is not reported as part of possible operational grades in TOOl 1 - timetable 4
  clean_data.tool0$Tool1_Timetable_Year |>
    select(any_of(meta_cols), PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable4_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable4_1:Tool1_How_Many_Timetable4_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(!Grade_ID_calc %in% all_school_op_and_op_other_grades) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the fourth timetable covered is not reported in Tool 2 (School Operationality Sheets)"),
      Question = "Tool1_How_Many_Timetable4",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if selected grade is not and operational grade in the school reported in tool 1 -  timetable 4
  clean_data.tool0$Tool1_Timetable_Year |>
    select(any_of(meta_cols), PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable4_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable4_1:Tool1_How_Many_Timetable4_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(Grade_ID_calc %in% all_school_op_and_op_other_grades_no_operational) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the fourth timetable covered is not reported as an operational grade in Tool 2 (School Operationality Sheet)"),
      Question = "Tool1_How_Many_Timetable4",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |>
  mutate(
    tool = "Data Entry" , sheet = "Tool1_Timetable_Year"
  )

## Data Entry Final Output -----------------------------------------------------
logic_check_data_entry_final <- plyr::rbind.fill(
  lc_tool_data_entry,
  lc_DE_tool3.grades_repeat,
  lc_DE_tool3.class_attendance,
  lc_tool1.timetable_year
)


rm( lc_tool_data_entry,
     lc_DE_tool3.grades_repeat,
     lc_DE_tool3.class_attendance,
     lc_tool1.timetable_year)
