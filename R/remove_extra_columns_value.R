# getting the column names to exclude from data set for client ------------
qa_cols <- c("review_status", "review_quality", "review_comments", "review_corrections")

extra_cols.tool9 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "Sector", "Line_Ministry_Name", 
  "Line_Ministry_Project_Id",  "Line_Ministry_SubProject_Id", "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", 
  "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Province_Climate", "Survey_Language", "Survey_Language_Other",
  "Sample_info_correct", "Village", "instanceID", "formdef_version", 
  'ID_Check', 'TPMA_Location_Name', 'Entity_Type',	'acknowledge', 'qa_log_status', 'AA_Full',# NEW
  'indx', 'CBE_Province',	'CBE_Province_DariPashto', 'CBE_Province_Pcode', 'CBE_District_DariPashto',	'CBE_District_Pcode',#NEW
  'CBE_Province_Climate',	'CBE_Village',	'CBE_Village_DariPashto', 'CBE_School_CBE_Name_DariPashto', 'D1_Hub_School_Name',
  
  
  # PII 
  "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  "Geopoint0-Latitude",  "Geopoint0-Longitude", "Geopoint0-Altitude",  "Geopoint0-Accuracy",  "Geopoint3-Latitude",  "Geopoint3-Longitude", "Geopoint3-Altitude",  "Geopoint3-Accuracy", 
  "Geopoint4-Latitude",  "Geopoint4-Longitude", "Geopoint4-Altitude",  "Geopoint4-Accuracy",  "Geopoint5-Latitude",  "Geopoint5-Longitude", "Geopoint5-Altitude",  "Geopoint5-Accuracy",
  "Geopoint6-Latitude",  "Geopoint6-Longitude", "Geopoint6-Altitude",  "Geopoint6-Accuracy",
  
  
  # URL
  "text_audit_full",
  
  # Captions
  "A7_Photo1_Caption", "A7_Photo2_QA_Photo_Caption", "B2_Photo_Caption",
  'B6_Logbook_Photo_Caption', 'Please_Add_Any_Relevant_Photo_caption',#NEW
  
  # Notes and Re-coded
  "Sample_Type",
  
  # repeat counter and SET-OFF
  "SET-OF-Relevant_photos", "Questions_Repeat_count",	"SET-OF-Questions_Repeat",

  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
)



extra_cols.tool8 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Date_And_Time", "Surveyor_Name", "CBE_KEY", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "School_CBE_Name_DariPashto", "Sector", "Line_Ministry_Name",
  "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "Sample_info_correct", "Village",
  "instanceID", "formdef_version",
  "ID_Check", 'TPMA_Location_Name',	'Entity_Type',	'acknowledge', 'indx1', 'indx2', 'indx3', # NEW
  'indx4', 'indx5', 'Y_indx1', 'qa_log_status', 'AA_Full', 'AA_Closure_Interview', 'AA_CBE_Open', 'AA_TLM', 'O10_0_not_in_use', 'Q10_0_not_in_use', 'S10_0_not_in_use',# NEW 
  "S10_0_not_in_use.re_calc", 'Q10_0_not_in_use.re_calc', 'O_Field_Label', 'O2_Field_Label', 'S1_Field_Label', 'V_Field_Label',
  "B2",  'D12_Hub_School_Name',
  
  # PII 
  "C2", "Respondent_Phone_Number1", "Respondent_Phone_Number2", "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "E18",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy',# NEW
  "Geopoint0-Latitude",  "Geopoint0-Longitude", "Geopoint0-Altitude",  "Geopoint0-Accuracy",  "Geopoint3-Latitude",  "Geopoint3-Longitude", "Geopoint3-Altitude",  "Geopoint3-Accuracy", 
  "Geopoint4-Latitude",  "Geopoint4-Longitude", "Geopoint4-Altitude",  "Geopoint4-Accuracy",  "Geopoint5-Latitude",  "Geopoint5-Longitude", "Geopoint5-Altitude",  "Geopoint5-Accuracy", 
  "Geopoint6-Latitude",  "Geopoint6-Longitude", "Geopoint6-Altitude",  "Geopoint6-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "B5_Caption", "E22_Photo1_Caption", "E22_Photo2_Caption", "E22_Photo3_Caption", "E22_Photo4_Caption", "E22_Photo5_Caption", "J4_Students_Enrolment_Book_Photo_Caption", "O7_Caption",
  "O10_Caption", "Q7_Photo_Caption", "Q10_Photo_Caption", "S7_Caption", "S10_Caption",  "W15_Caption",  "W18_Caption",  "W21_Caption",  "X6_Caption",  "Please_Add_Any_Relevant_Photo_caption",
  'B5_2_Caption', 'O10_Not_In_Use_Caption', 'S10_Not_In_Use_Caption', 'Q10_Caption', 'Q10_Not_In_Use_Caption',# NEW 
  "Kitab_Jinsi_Or_Distribution_Ticket_Photo_Caption", "TLM_Distribution_List_Photo1_Caption", "TLM_Distribution_List_Photo2_Caption", "TLM_Distribution_List_Photo3_Caption", #NEW
  'Stock_Card_Photo1_Caption', 'Stock_Card_Photo2_Caption', 'Stock_Card_Photo3_Caption', #NEW
  
  # Notes and Re-coded
  "Sample_Type", "Headcount_Total_Students.re_calc", 'O10_0_not_in_use.re_calc',
  
  # repeat counter and SET-OFF
  "Classes_count",	"SET-OF-Classes", "Adults_At_The_CBE_count",	"SET-OF-Adults_At_The_CBE", "Section_2_2_3_Attendance_Record_Check_CBS_count",	"SET-OF-Section_2_2_3_Attendance_Record_Check_CBS",
  "Section_2_2_4_Headcount_count",	"SET-OF-Section_2_2_4_Headcount", "SET-OF-Students_Enrolment_Book",	"Count_Students_Enrolment_Book_Photo", "Section_2_4_Student_Ages_count", "SET-OF-Section_2_4_Student_Ages",
  "Classroom_Materials_count",	"SET-OF-Classroom_Materials", "Teacher_Kit_count",	"SET-OF-Teacher_Kit", "Student_Kit_count",	"SET-OF-Student_Kit", "V_list_of_all_members_count",	"SET-OF-V_list_of_all_members",
  "Subjects_Added_count",	"SET-OF-Subjects_Added", "SET-OF-Relevant_photos", 'Count_Classes', 'Count_Adults_At_The_CBE', 'Count_Section_2_2_3_Attendance_Record_Check_CBS',
  'Count_Section_2_2_4_Headcount', 'Count_Section_2_4_Student_Ages', 'Count_Classroom_Materials', 'O10_0_not_in_use_total', 'Count_Teacher_Kit',	'Q10_0_not_in_use_total',
  'Count_Student_Kit',	'S10_0_not_in_use_total', 'Count_V_list_of_all_members', 'Count_Subjects_Added',
  
  
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation", "C13",	"C13_Translation",
  
  
  # FDE
  "FDE_Confirm_The_Date_of_Visit_With_Attendance", "FDE_Overall_Present_Students_Male", "FDE_Overall_Present_Students_Female", "FDE_Overall_Absent_Students_Male", "FDE_Overall_Absent_Students_Female",
  "J4_Students_Enrolment_Book_Photo_Caption",  "FDE_Grade1_Male", "FDE_Grade1_Female", "FDE_Grade1_Total", "FDE_Grade2_Male", "FDE_Grade2_Female", "FDE_Grade2_Total", "FDE_Grade3_Male", "FDE_Grade3_Female",
  "FDE_Grade3_Total", "FDE_Grade4_Male", "FDE_Grade4_Female", "FDE_Grade4_Total", "FDE_Grade5_Male", "FDE_Grade5_Female", "FDE_Grade5_Total", "FDE_Grade6_Male", "FDE_Grade6_Female", "FDE_Grade6_Total",
  "FDE_Grade_Other_Male", "FDE_Grade_Other_Female", "FDE_Grade_Other_Total", "FDE_Total_Male", "FDE_Total_Female", "FDE_Total", "FDE_Level_1_1_2_Male", "FDE_Level_1_1_2_Female", "FDE_Total_Level_1_1_2",
  "FDE_Level_2_3_4_Male", "FDE_Level_2_3_4_Female", "FDE_Total_Level_2_3_4", "FDE_Level_3_5_6_Male", "FDE_Level_3_5_6_Female", "FDE_Total_Level_3_5_6"
)


extra_cols.tool7 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other",  "Sample_info_correct", "Village",
  "instanceID", "formdef_version",
  "ID_Check",'Type_of_CBE',	'TPMA_Location_Name',	'Entity_Type',	'acknowledge', 'indx1', 'qa_log_status', 'AA_Full', 'Field_Label',	'Field_Lablel_Final',# NEW
  'B2',
  
  
  # PII 
  "B5", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  "Geopoint0-Latitude",   "Geopoint0-Longitude",  "Geopoint0-Altitude",   "Geopoint0-Accuracy",   "Geopoint3-Latitude",   "Geopoint3-Longitude",  "Geopoint3-Altitude",   "Geopoint3-Accuracy",  
  "Geopoint4-Latitude",   "Geopoint4-Longitude",  "Geopoint4-Altitude",   "Geopoint4-Accuracy",   "School_Photo_Caption", "Geopoint5-Latitude",  
  "Geopoint5-Longitude",  "Geopoint5-Altitude",   "Geopoint5-Accuracy",   "Geopoint6-Latitude",   "Geopoint6-Longitude",  "Geopoint6-Altitude",   "Geopoint6-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "C10_image_Caption", "C10_image2_Caption", "C10_image3_Caption", "C10_image4_Caption", "C10_image5_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  
  # repeat counter and SET-OFF 
  "C6_list_members_count",	"SET-OF-C6_list_members", "Subjects_Added_count",	"SET-OF-Subjects_Added", "SET-OF-Relevant_photos", 'Count_C6_list_members', 'Count_Subjects_Added',
  
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
  
)

extra_cols.tool6 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "Sample_info_correct", "Village",
  "instanceID", "formdef_version",
  "ID_Check", 'Type_of_CBE',	'TPMA_Location_Name',	'Entity_Type', 'acknowledge',# NEW
  "indx1", 'qa_log_status', 'AA_Full',# NEW
  'A2',
  
  
  # PII 
  "Respondent_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  "Geopoint0-Latitude",   "Geopoint0-Longitude",  "Geopoint0-Altitude",   "Geopoint0-Accuracy",   "Geopoint3-Latitude",   "Geopoint3-Longitude",  "Geopoint3-Altitude",   "Geopoint3-Accuracy",  
  "Geopoint4-Latitude",   "Geopoint4-Longitude",  "Geopoint4-Altitude",   "Geopoint4-Accuracy",   "School_Photo_Caption", "Geopoint5-Latitude",  
  "Geopoint5-Longitude",  "Geopoint5-Altitude",   "Geopoint5-Accuracy",   "Geopoint6-Latitude",   "Geopoint6-Longitude",  "Geopoint6-Altitude",   "Geopoint6-Accuracy",
  
  
  # URL
  "text_audit_full",
  
  # Captions
  "Please_Add_Any_Relevant_Photo_caption",
  
  # repeat counter and SET-OFF 
  "Subjects_Added_count",	"SET-OF-Subjects_Added", "SET-OF-Relevant_photos", 'Count_Subjects_Added',
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
  
)

extra_cols.tool5 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "Village",
  "instanceID", "formdef_version",
  "ID_Check",	"Sample_info_correct",	"acknowledge", 'TPMA_Location_Name',	'Entity_Type',# NEW
  'qa_log_status', 'AA_Full',# NEW
  'B2', 'IP_Name',
  
  # PII 
  "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  "Geopoint0-Latitude",   "Geopoint0-Longitude",  "Geopoint0-Altitude",   "Geopoint0-Accuracy",   "Geopoint3-Latitude",   "Geopoint3-Longitude",  "Geopoint3-Altitude",   "Geopoint3-Accuracy",  
  "Geopoint4-Latitude",   "Geopoint4-Longitude",  "Geopoint4-Altitude",   "Geopoint4-Accuracy",   "School_Photo_Caption", "Geopoint5-Latitude",  
  "Geopoint5-Longitude",  "Geopoint5-Altitude",   "Geopoint5-Accuracy",   "Geopoint6-Latitude",   "Geopoint6-Longitude",  "Geopoint6-Altitude",   "Geopoint6-Accuracy",
  
  
  # URL
  "text_audit_full",
  
  # Captions
  "C3_Caption", "Under_Construction_Toilet_Photo_Caption", "Useable_Toilet_Photo_Caption", "Non_Useable_Toilet_Photo_Caption", "C11_1_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "Sample_Type", "",
  
  # repeat counter and SET-OFF 
  "SET-OF-Under_Construction_Toilets",	"Count_Under_Construction_Toilet_Photo", "SET-OF-Useable_Toilets",	"Count_Useable_Toilet_Photo", "SET-OF-Non_Useable_Toilets",	"Count_Non_Useable_Toilet_Photo",
  "SET-OF-Relevant_photos",
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
)

extra_cols.tool4 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "Village",
  "instanceID", "formdef_version",
  "ID_Check",  'TPMA_Location_Name',	"Entity_Type", "acknowledge",# NEW
  'G8_Translation', "H3_Translation",# NEW
  'qa_log_status', 'AA_Full', 'indx1', 'D9_Field_Label', 'F12_Field_Label',# NEW
  'IP_Name', 'B2',
  
  # PII 
  "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  "Geopoint0-Latitude",   "Geopoint0-Longitude",  "Geopoint0-Altitude",  "Geopoint0-Accuracy",   "Geopoint3-Latitude",   "Geopoint3-Longitude",  "Geopoint3-Altitude",   "Geopoint3-Accuracy",  
  "School_Photo_Caption", "Geopoint4-Latitude",   "Geopoint4-Longitude",  "Geopoint4-Altitude",   "Geopoint4-Accuracy",   "Geopoint5-Latitude", 
  "Geopoint5-Longitude",  "Geopoint5-Altitude",   "Geopoint5-Accuracy",   "Geopoint6-Latitude",   "Geopoint6-Longitude",  "Geopoint6-Altitude",   "Geopoint6-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "Sample_Type", "",
  
  # repeat counter and SET-OFF 
  "Additional_Subjects_count",	"SET-OF-Additional_Subjects", "Subjects_taught_by_this_teacher_count",	"SET-OF-Subjects_taught_by_this_teacher", "Subjects_Not_Being_Taught_count",	"SET-OF-Subjects_Not_Being_Taught",
  "SET-OF-Relevant_photos", 'Count_Additional_Subjects',
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
)

extra_cols.tool3 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	 "School_Program_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "School_Property_Sample", "School_Shifts_Sample",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Class1_N_Sample", "Class2_N_Sample", "Class3_N_Sample", "Class4_N_Sample", "Class5_N_Sample", "Class6_N_Sample", "Class7_N_Sample", "Class8_N_Sample", "Class9_N_Sample",
  "Class10_N_Sample", "Class11_N_Sample", "Class12_N_Sample", "School_Status_Sample", "School_Status_EMIS",  "Province_Climate", "Survey_Language", "Survey_Language_Other",
  "Classes", # To be confirmed
  "Village", "instanceID", "formdef_version",
  "ID_Check", "TPMA_Location_Name", "Entity_Type",	"acknowledge",  # NEW
  "Grade_Class_1",	"Grade_Class_2",	"Grade_Class_3",	"Grade_Class_4",	"Grade_Class_5",	"Grade_Class_6", #NEW
  "Grade_Class_7", "Grade_Class_8",	"Grade_Class_9",	"Grade_Class_10",	"join_indx2", # NEW
  'qa_log_status', 'indx1', 'indx2',  'E1_Field_Value', 'AA_Full', 'Response_Code', 'Tool3_Grades_Field_Label',# NEW
  'IP_Name',
  
  
  # PII 
  "B3", "B4A1", "B4A2", "B10A1", "B10A4",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  "Geopoint0-Latitude",   "Geopoint0-Longitude",  "Geopoint0-Altitude",   "Geopoint0-Accuracy",   "Geopoint3-Latitude",   "Geopoint3-Longitude",  "Geopoint3-Altitude",   "Geopoint3-Accuracy",  
  "School_Photo_Caption", "Geopoint4-Latitude",   "Geopoint4-Longitude",  "Geopoint4-Altitude",   "Geopoint4-Accuracy",   "Geopoint5-Latitude",  
  "Geopoint5-Longitude",  "Geopoint5-Altitude",   "Geopoint5-Accuracy",   "Geopoint6-Latitude",   "Geopoint6-Longitude",  "Geopoint6-Altitude",   "Geopoint6-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "C1A2_Caption", "C1A2_2_Caption", "D4_Caption", "D4_2_Caption", "D8_Caption", "D8_2_Caption", "E2_Caption", "E2_2_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  
  # Notes and Re-coded
  "Sample_Type",
  
  # repeat counter and SET-OFF 
  "Support_Respondents_count",	"SET-OF-Support_Respondents", "Count_Support_Respondents",	"SET-OF-Enrollement_Attendance_Summary", "Count_Enrollement_Attendance_Summary",	"Count_Grade_Details",
  "Grade_Details_count",	"SET-OF-Grade_Details","Todays_Attendance_Detail_count",	"SET-OF-Todays_Attendance_Detail",	"Count_Todays_Attendance_Detail",
  "LastWeek_Attendance_Detail_count",	"SET-OF-LastWeek_Attendance_Detail",	"Count_LastWeek_Attendance_Detail", "Student_Headcount_count",	"SET-OF-Student_Headcount",	"SET-OF-Relevant_photos",
  "SET-OF-Tool3_Grades_Repeat", "Tool3_Grades_Repeat_count", 'Count_Student_Headcount', 'Count_Tool3_Grades_Repeat',# NEW
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation",
  
  # FDE COLUMN
  "FDE_C1A3", "FDE_C1A4_Male", "FDE_C1A4_Female", "FDE_C1A5_Male", "FDE_C1A5_Female", "FDE_C1A6_Male", "FDE_C1A6_Female", "FDE_Overall_Present_Male_Students_Today", "FDE_Number_Of_Absent_Male_Students_Today",
  "FDE_Overall_Present_Female_Students_Today", "FDE_Number_Of_Absent_Female_Students_Today", "FDE_Overall_Present_Male_Students_LastWeek", "FDE_Number_Of_Absent_Male_Students_LastWeek",
  "FDE_Overall_Present_Female_Students_LastWeek", "FDE_Number_Of_Absent_Female_Students_LastWeek", "FDE_E6A11", "FDE_E6A12", "FDE_E6A21", "FDE_E6A22", "FDE_E6A31", "FDE_E6A32"
)


extra_cols.tool2 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Province_Climate", "Survey_Language", "Survey_Language_Other",
  "Village", "instanceID", "formdef_version",
  "ID_Check", "TPMA_Location_Name","Entity_Type",	"acknowledge", #NEW
  'qa_log_status', 'AA_Full', 'AA_Closure_Interview', 'indx3', 'AA_TLM', 'Shift_name', 'H6_Field_Label', 'i6_Field_Label', 'J6_Field_Label',# NEW
  'IP_Name', 'B2', 'District_SV',
  
  
  # PII 
  "C4_Respondent_name", "C6_Respondent_phone_number1", "C6_Respondent_phone_number2", "D5", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "D10", "D11", 'C15A1',
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  "Geopoint2-Latitude",	"Geopoint2-Longitude",	"Geopoint2-Altitude",	"Geopoint2-Accuracy", # NEW
  "Geopoint0-Latitude",  "Geopoint0-Longitude", "Geopoint0-Altitude",  "Geopoint0-Accuracy",  "Geopoint3-Latitude",  "Geopoint3-Longitude", "Geopoint3-Altitude",  "Geopoint3-Accuracy", 
  "Geopoint4-Latitude",  "Geopoint4-Longitude", "Geopoint4-Altitude",  "Geopoint4-Accuracy",  "Geopoint5-Latitude",  "Geopoint5-Longitude", "Geopoint5-Altitude",  "Geopoint5-Accuracy", 
  "Geopoint6-Latitude",  "Geopoint6-Longitude", "Geopoint6-Altitude",  "Geopoint6-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "B5_Caption", "Photo_closure_1_Caption", "Photo_closure_2_Caption", "G6_Caption", "H12_Caption", "H15_Caption", "i12_Caption", "i15_Caption", "J12_Caption", "J15_Caption" ,
  "Please_Add_Any_Relevant_Photo_caption",
  "H15_Not_In_Use_Caption", "i15_Not_In_Use_Caption", "J15_Not_In_Use_Caption", 'L2_Caption', #NEW
  'Kitab_Jinsi_Or_Distribution_Ticket_Photo1_Caption', 'Kitab_Jinsi_Or_Distribution_Ticket_Photo2_Caption', 'TLM_Distribution_List_Photo1_Caption', 'TLM_Distribution_List_Photo2_Caption',
  'TLM_Distribution_List_Photo3_Caption', 'M13_Form_Photo1_Caption', 'M13_Form_Photo2_Caption', 'M13_Form_Photo3_Caption', 'Stock_Card_Photo1_Caption', 'Stock_Card_Photo2_Caption', 'Stock_Card_Photo3_Caption',
  
  # Notes and Re-coded
  "Sample_Type",
  
  # repeat counter and SET-OFF 
  "Support_Respondents_count",	"SET-OF-Support_Respondents", "SET-OF-Attendance_Sheet_Photos",	"Count_Attendance_Sheet_Photos", "Public_Stationary_Kit_Group_count",	"SET-OF-Public_Stationary_Kit_Group",
  "Teachers_Pack_Group_count",	"SET-OF-Teachers_Pack_Group", "Students_Pack_Group_count",	"SET-OF-Students_Pack_Group",	"SET-OF-Relevant_photos", 'Count_Support_Respondents',
  'School_Operationality_count', 'SET-OF-School_Operationality', 'Count_School_Operationality', 'Shifts_Detail_count',	'SET-OF-Shifts_Detail',	'Count_Shifts_Detail',
  'Headmasters_count',	'SET-OF-Headmasters',	'Count_Headmasters', 'Count_Public_Stationary_Kit_Group', 'Count_Teachers_Pack_Group', 'Count_Students_Pack_Group',
  
  
  
  # FDE
  "FDE_Present_Teachers_Male", "FDE_Absent_Teachers_Male", "FDE_Total_Teachers_Male", "FDE_Present_Teachers_Female", "FDE_Absent_Teachers_Female", "FDE_Total_Teachers_Female",
  
  # Labels
  
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation", "Enumerator_Comments", "Enumerator_Comments_Translation"
)

extra_cols.tool1 <- c(
  # Meta cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "ID_Check", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector",	"Line_Ministry_Name",	"Line_Ministry_Project_Id",	"Line_Ministry_SubProject_Id",	"Type_Of_Implementing_Partner",	"Type_Of_Site_Visit",	"Type_Of_Visit",
  "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",	"tpma_location_id", "Line_Ministry_Sub_Project_Name_And_Description",	
  "Reporting_Period",	"Class1_N_Sample",	"Class2_N_Sample",	"Class3_N_Sample",	"Class4_N_Sample",	"Class5_N_Sample",	"Class6_N_Sample",	"Class7_N_Sample",	"Class8_N_Sample",
  "Class9_N_Sample",	"Class10_N_Sample",	"Class11_N_Sample",	"Class12_N_Sample", "Province_Climate", "Survey_Language", "Survey_Language_Other",
  "Village", "instanceID", "formdef_version", 
  "Type_Of_School_CBE_Based_On_The_Sample_DariPashto", "TPMA_Location_Name", "Entity_Type", "acknowledge", # New
  'qa_log_status', 'indx1', 'indx3', 'F1_Value', 'F3_Value', 'Sub_indx', 'subj_index', 'AA_Full', 'AA_Closure_Interview', 'AA_Curriculum', 'AA_SMS',# NEW
  'IP_Name', 'A28',
  
  # PII
  "B2", "B5A1", "B5A2","C5", "C6A1", "C6A2", "C12A1", "C12A4", 
  
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy", "Geopoint2-Latitude", "Geopoint2-Longitude", "Geopoint2-Altitude", "Geopoint2-Accuracy",
  "Geopoint0-Latitude",  "Geopoint0-Longitude", "Geopoint0-Altitude",  "Geopoint0-Accuracy",  "Geopoint3-Latitude",  "Geopoint3-Longitude", "Geopoint3-Altitude",  "Geopoint3-Accuracy",
  "Geopoint4-Latitude",  "Geopoint4-Longitude", "Geopoint4-Altitude",  "Geopoint4-Accuracy",  "Geopoint5-Latitude",  "Geopoint5-Longitude", "Geopoint5-Altitude",  "Geopoint5-Accuracy", 
  "Geopoint6-Latitude",  "Geopoint6-Longitude", "Geopoint6-Altitude",  "Geopoint6-Accuracy",
  
  
  # URLs
  "text_audit_full",
  
  # Labels
  "Grade_Name_Dari",	"Grade_Name_Pashto",'Shift_Name_Dari',"Shift_Name_Pashto", "Sub_name_Dari",	"Sub_name_Pashto", "Feature_Dari",	"Feature_Pashto",
  
  
  # Captions
  "B19_Caption", "B20_Caption", "F2_Caption", "J24_Caption", "L2_Caption", "Please_Add_Any_Relevant_Photo_caption", "A32_Caption",
  "F2_2_Caption", "F2_3_Caption", "F4_Caption",	"F4_2_Caption",	"F4_3_Caption", # NEW
  
  
  # Notes and Re-coded
  "interview_to_be_conducted_with_English", "interview_to_be_conducted_with_Dari", "interview_to_be_conducted_with_Pashto", "Surveyor_Comments",
  "Surveyor_Comments_Translation",	"join_Grade_Name_Eng",	"join_Shift_Name_Eng", "Sample_Type",  "Count_Weekly_Class_Schedule_Photo.re_calc",
  
  # Repeat counter and SET-OFF
  "Support_Respondents_count", "SET-OF-Support_Respondents", "School_Operationality_count", "SET-OF-School_Operationality", # Do find and search for SET-OF and count
  "School_Operationality_Other_Grades_count",	"SET-OF-School_Operationality_Other_Grades",	"Shifts_Detail_count",	"SET-OF-Shifts_Detail",
  "Other_Shifts_Detail_count",	"SET-OF-Other_Shifts_Detail", "Headmasters_count",	"SET-OF-Headmasters", "Curriculum_Changes_count",	"SET-OF-Curriculum_Changes", 
  "SET-OF-Weekly_Class_Schedule",	"Count_Weekly_Class_Schedule_Photo",	"Grades_Curriculum_count", "SET-OF-Grades_Curriculum",
  "Subjects_Detail_count", "SET-OF-Subjects_Detail", "Education_Quality_count",	"SET-OF-Education_Quality", "SET-OF-Relevant_photos",
  "School_indx", "School_rep",
  "Weekly_Schedule_Old_count",	"SET-OF-Weekly_Schedule_Old", "Weekly_Schedule_New_count",	"SET-OF-Weekly_Schedule_New", # NEW
  "Additional_Subjects_count",	"SET-OF-Additional_Subjects",	"Count_Additional_Subjects",  'Count_Weekly_Schedule_Old', 'Count_Weekly_Schedule_New',# NEW
  'Count_Support_Respondents',
  
  
  # FDE Cols
  "FDE_Dari_Hours", "FDE_Mathematics_Hours", "FDE_Drawing_Hours", "FDE_Life_Skills_Hours", "FDE_Calligraphy_Hours", "FDE_English_Hours", "FDE_Pashto_Hours", "FDE_Social_Studies_Hours", "FDE_Arabic_Hours",
  "FDE_Civics_Hours", "FDE_Professional_Skills_Hours", "FDE_Biology_Hours", "FDE_Geography_Hours", "FDE_History_Hours", "FDE_Physics_Hours", "FDE_Chemistry_Hours", "FDE_Islamic_Studies_Hours",
  "FDE_Holy_Quran_Hours", "FDE_Tajweed_Hours", "FDE_Patriotism_Hours", "FDE_Other_Hours"
)



extra_cols.tool0 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "Province_Climate",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Survey_Language", "Survey_Language_Other", "Sample_info_correct", "Village", "instanceID", "formdef_version",
  'indx1', 'indx2', 'qa_log_status', 'indx4', 'Tool1_Timetable_Field_Value', 'Tool1_Timetable_Year_Value', 'Tool1_Timetable1_Field_Label', 'Tool1_Timetable2_Field_Label',# NEW
  'Tool1_Timetable3_Field_Label', 'Tool1_Timetable4_Field_Label', 'tool3_t3_matching_flag', 'tool3_headcount_conducted', 'tool2_total_compare', 'tool3_t2_variance_calculate',# NEW
  "tool3_t2_variance_calculate.re_calc", "Tool3_Headcount_Conducted.re_calc", 'Tool3_Grades_Field_Label',
  'IP_Name', 'Type_of_CBE', 'Tool1_Enter_School_Name',
  
  # PII 
  "Data_Entry_Clerk_Name",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  "Geopoint0-Latitude",  "Geopoint0-Longitude", "Geopoint0-Altitude",  "Geopoint0-Accuracy",  "Geopoint3-Latitude",  "Geopoint3-Longitude", "Geopoint3-Altitude",  "Geopoint3-Accuracy", 
  "Geopoint4-Latitude",  "Geopoint4-Longitude", "Geopoint4-Altitude",  "Geopoint4-Accuracy",  "Geopoint5-Latitude",  "Geopoint5-Longitude", "Geopoint5-Altitude",  "Geopoint5-Accuracy", 
  "Geopoint6-Latitude",  "Geopoint6-Longitude", "Geopoint6-Altitude",  "Geopoint6-Accuracy",
  
  # URL
  "text_audit_full",
  
  # repeat counter and SET-OFF 
  "SET-OF-Tool3_Grades_Repeat", "Tool3_Class_Attendance_count",	"SET-OF-Tool3_Class_Attendance", "Tool3_T3_N_Classes_Repeat_count",	"SET-OF-Tool3_T3_N_Classes_Repeat",
  "Tool3_Headcount_count", "SET-OF-Tool3_Headcount", "Tool1_Timetable_Year_count",	"SET-OF-Tool1_Timetable_Year", "Tool3_Grades_Repeat_count",
  "Tool1_Timetable1_Repeat_count",	"SET-OF-Tool1_Timetable1_Repeat", "Tool1_Timetable2_Repeat_count",	"SET-OF-Tool1_Timetable2_Repeat",
  "Tool1_Timetable3_Repeat_count",	"SET-OF-Tool1_Timetable3_Repeat", "Tool1_Timetable4_Repeat_count",	"SET-OF-Tool1_Timetable4_Repeat",
  'SET-OF-Tool3_T3_Classes_LW', 'SET-OF-Tool3_Classes', 'SET-OF-Tool3_T2_Classes_VD', 'SET-OF-Tool3_Grades_Repeat',# NEW
  'Tool3_Classes_count',	'Tool3_T3_Classes_LW_count', 'Tool3_T2_Classes_VD_count',	'tool3_headcount_conducted_total',# NEW
  
  # Labels
  
  # Re-coded
  "Tool2_Total_Teachers_Staff_Male.re_calc",	"Tool2_Total_Teachers_Staff_Female.re_calc",	"Tool2_Total_Teachers_Staff_Gender_Not_Identifiable.re_calc",
  "Tool8_FDE_Overall_Total_Present_Students_Male_Female.re_calc",	"Tool8_FDE_Overall_Total_Absent_Students_Male_Female.re_calc",	"Tool3_Total_Regularly_Present_Students_Attendance_Male_sum",
  "Tool3_Total_Regularly_Present_Students_Attendance_Female_sum",	"Tool3_Total_Regularly_Present_Students_Attendance_Gender_Not_Identified_sum",	"Tool3_Total_Permanently_Absent_Students_Attendance_Male_sum",
  "Tool3_Total_Permanently_Absent_Students_Attendance_Female_sum",	"Tool3_Total_Permanently_Absent_Students_Attendance_Gender_Not_Identified_sum",	"Tool3_Total_Enrolled_Students_Attendance_Male_sum",
  "Tool3_Total_Enrolled_Students_Attendance_Female_sum",	"Tool3_Total_Enrolled_Students_Attendance_Gender_Not_Identified_sum",	"Tool3_Total_Regularly_Present_for_Matching.re_calc",
  "Tool3_Total_Permanently_Absent_Students_for_Matching.re_calc",	"Tool3_Total_Enrolled_Students_for_Matching.re_calc",	"Tool3_T3_Total_N_of_Students_Regular_Attendance_Male.re_calc",
  "Tool3_T3_Total_N_of_Students_Regular_Attendance_Female.re_calc",	"Tool3_T3_Total_N_of_Students_Regular_Attendance_Gender_Not_Identified.re_calc",	"Tool3_T3_Total_N_of_Students_Permanently_Absent_Male.re_calc",
  "Tool3_T3_Total_N_of_Students_Permanently_Absent_Female.re_calc",	"Tool3_T3_Total_N_of_Students_Permanently_Absent_Gender_Not_Identified.re_calc",	"Tool3_T3_Total_N_of_Students_Enrolled_Male.re_calc",
  "Tool3_T3_Total_N_of_Students_Enrolled_Female.re_calc",	"Tool3_T3_Total_N_of_Students_Enrolled_Gender_Not_Identified.re_calc",
  
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation" # Confirm with Shahim
)


extra_cols.tool_kdr <- c(
  # Meta cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "ID_Check", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector",	"Line_Ministry_Name",	"Line_Ministry_Project_Id",	"Line_Ministry_SubProject_Id",	"Type_Of_Implementing_Partner",	"Type_Of_Site_Visit",	"Type_Of_Visit",
  "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",	"tpma_location_id", "Line_Ministry_Sub_Project_Name_And_Description",	
  "Reporting_Period",	"Class1_N_Sample",	"Class2_N_Sample",	"Class3_N_Sample",	"Class4_N_Sample",	"Class5_N_Sample",	"Class6_N_Sample",	"Class7_N_Sample",	"Class8_N_Sample",
  "Class9_N_Sample",	"Class10_N_Sample",	"Class11_N_Sample",	"Class12_N_Sample", "Province_Climate", "Survey_Language", "Survey_Language_Other",
  "Village", "instanceID", "formdef_version", 
  "Type_Of_School_CBE_Based_On_The_Sample_DariPashto", "TPMA_Location_Name", "Entity_Type", "acknowledge",# New
  'qa_log_status', 'indx1', 'indx3', 'F1_Value', 'F3_Value', 'subj_index', 'AA_Full', 'Shift_name', 'Sub_name',# NEW
  'IP_Name', 'Type_Of_School_Sample_Value.re_cal', 'School_Type_Final.re_calc',	'School_indx.re_calc',	
  
  # PII
  "B2", "B5A1", "B5A2","C5", "C6A1", "C6A2", "C12A1", "C12A4", "C15A1", 
  
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy", "Geopoint2-Latitude", "Geopoint2-Longitude", "Geopoint2-Altitude", "Geopoint2-Accuracy",
  "Geopoint0-Latitude",  "Geopoint0-Longitude" ,"Geopoint0-Altitude",  "Geopoint0-Accuracy",  "Geopoint3-Latitude",  "Geopoint3-Longitude", "Geopoint3-Altitude",  "Geopoint3-Accuracy" ,
  "Geopoint4-Latitude",  "Geopoint4-Longitude", "Geopoint4-Altitude",  "Geopoint4-Accuracy",  "Geopoint5-Latitude",  "Geopoint5-Longitude", "Geopoint5-Altitude",  "Geopoint5-Accuracy" ,
  "Geopoint6-Latitude",  "Geopoint6-Longitude", "Geopoint6-Altitude",  "Geopoint6-Accuracy", 
  
  
  # URLs
  "text_audit_full",
  
  # Labels
  "Grade_Name_Dari",	"Grade_Name_Pashto",'Shift_Name_Dari',"Shift_Name_Pashto", "Sub_name_Dari",	"Sub_name_Pashto", "Feature_Dari",	"Feature_Pashto",
  
  
  # Captions
  "B19_Caption", "B20_Caption", "F2_Caption", "J24_Caption", "L2_Caption", "Please_Add_Any_Relevant_Photo_caption", "A32_Caption",
  "F2_2_Caption", "F2_3_Caption", "F4_Caption",	"F4_2_Caption",	"F4_3_Caption", # NEW
  
  
  # Notes and Re-coded
  "interview_to_be_conducted_with_English", "interview_to_be_conducted_with_Dari", "interview_to_be_conducted_with_Pashto", "Surveyor_Comments",
  "Surveyor_Comments_Translation",	"join_Grade_Name_Eng",	"join_Shift_Name_Eng", "Sample_Type",  "Count_Weekly_Class_Schedule_Photo.re_calc",
  
  # Repeat counter and SET-OFF
  "Support_Respondents_count", "SET-OF-Support_Respondents", "School_Operationality_count", "SET-OF-School_Operationality", # Do find and search for SET-OF and count
  "School_Operationality_Other_Grades_count",	"SET-OF-School_Operationality_Other_Grades",	"Shifts_Detail_count",	"SET-OF-Shifts_Detail",
  "Other_Shifts_Detail_count",	"SET-OF-Other_Shifts_Detail", "Headmasters_count",	"SET-OF-Headmasters", "Curriculum_Changes_count",	"SET-OF-Curriculum_Changes", 
  "SET-OF-Weekly_Class_Schedule",	"Count_Weekly_Class_Schedule_Photo",	"Grades_Curriculum_count", "SET-OF-Grades_Curriculum",
  "Subjects_Detail_count", "SET-OF-Subjects_Detail", "Education_Quality_count",	"SET-OF-Education_Quality", "SET-OF-Relevant_photos",
  "School_indx", "School_rep",
  "Weekly_Schedule_Old_count",	"SET-OF-Weekly_Schedule_Old", "Weekly_Schedule_New_count",	"SET-OF-Weekly_Schedule_New", # NEW
  "Additional_Subjects_count",	"SET-OF-Additional_Subjects",	"Count_Additional_Subjects", 'Count_Support_Respondents', 'Type_Of_School_Sample_Value',	'Count_School_Operationality',
  'Count_Shifts',	'Count_Shifts_Detail', 'Count_Headmasters', 'SET-OF-Weekly_Class_Schedule_New',	'Count_Weekly_Class_Schedule_New', # NEW
  
  
  # FDE Cols
  "FDE_Dari_Hours", "FDE_Mathematics_Hours", "FDE_Drawing_Hours", "FDE_Life_Skills_Hours", "FDE_Calligraphy_Hours", "FDE_English_Hours", "FDE_Pashto_Hours", "FDE_Social_Studies_Hours", "FDE_Arabic_Hours",
  "FDE_Civics_Hours", "FDE_Professional_Skills_Hours", "FDE_Biology_Hours", "FDE_Geography_Hours", "FDE_History_Hours", "FDE_Physics_Hours", "FDE_Chemistry_Hours", "FDE_Islamic_Studies_Hours",
  "FDE_Holy_Quran_Hours", "FDE_Tajweed_Hours", "FDE_Patriotism_Hours", "FDE_Other_Hours"
)


# cloning clean datasets for client version
clean_data.tool0_for_client_ulabeled <- clean_data.tool0_ulabeled
clean_data.tool1_kdr_for_client_ulabeled <- clean_data.tool1_kdr_ulabeled
clean_data.tool1_for_client_ulabeled <- clean_data.tool1_ulabeled
clean_data.tool2_for_client_ulabeled <- clean_data.tool2_ulabeled
clean_data.tool3_for_client_ulabeled <- clean_data.tool3_ulabeled
clean_data.tool4_for_client_ulabeled <- clean_data.tool4_ulabeled
clean_data.tool5_for_client_ulabeled <- clean_data.tool5_ulabeled
clean_data.tool6_for_client_ulabeled <- clean_data.tool6_ulabeled
clean_data.tool7_for_client_ulabeled <- clean_data.tool7_ulabeled
clean_data.tool8_for_client_ulabeled <- clean_data.tool8_ulabeled
clean_data.tool9_for_client_ulabeled <- clean_data.tool9_ulabeled


# Remove extra cols -------------------------------------------------------
# Tool 0 -----
clean_data.tool0_for_client_ulabeled$data <- clean_data.tool0_ulabeled$data %>% select(-any_of(c(extra_cols.tool0, qa_cols)))

for (sheet in names(clean_data.tool0_for_client_ulabeled)[-1]) {
  clean_data.tool0_for_client_ulabeled[[sheet]] <- clean_data.tool0_for_client_ulabeled[[sheet]] |> select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
    select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
}

# Tool 1 KDR -----
clean_data.tool1_kdr_for_client_ulabeled$data <- clean_data.tool1_kdr_ulabeled$data %>% select(-any_of(c(extra_cols.tool1_kdr, qa_cols)))

for (sheet in names(clean_data.tool1_kdr_for_client_ulabeled)[-1]) {
  clean_data.tool1_kdr_for_client_ulabeled[[sheet]] <- clean_data.tool1_kdr_for_client_ulabeled[[sheet]] |> select(-any_of(c(extra_cols.tool1_kdr, qa_cols, "starttime"))) |>
    select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
}


# Tool 1 -----
clean_data.tool1_for_client_ulabeled$data <- clean_data.tool1_ulabeled$data %>% select(-any_of(c(extra_cols.tool1, qa_cols)))

for (sheet in names(clean_data.tool1_for_client_ulabeled)[-1]) {
  clean_data.tool1_for_client_ulabeled[[sheet]] <- clean_data.tool1_for_client_ulabeled[[sheet]] |> select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
    select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
}

# Tool 2 -----
clean_data.tool2_for_client_ulabeled$data <- clean_data.tool2_ulabeled$data %>% select(-any_of(c(extra_cols.tool2, qa_cols)))

for (sheet in names(clean_data.tool2_for_client_ulabeled)[-1]) {
  clean_data.tool2_for_client_ulabeled[[sheet]] <- clean_data.tool2_for_client_ulabeled[[sheet]] |> select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
    select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
}

# Tool 3 -----
clean_data.tool3_for_client_ulabeled$data <- clean_data.tool3_ulabeled$data %>% select(-any_of(c(extra_cols.tool3, qa_cols)))

for (sheet in names(clean_data.tool3_for_client_ulabeled)[-1]) {
  clean_data.tool3_for_client_ulabeled[[sheet]] <- clean_data.tool3_for_client_ulabeled[[sheet]] |> select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
    select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
}

# Tool 4 -----
clean_data.tool4_for_client_ulabeled$data <- clean_data.tool4_ulabeled$data %>% select(-any_of(c(extra_cols.tool4, qa_cols)))

for (sheet in names(clean_data.tool4_for_client_ulabeled)[-1]) {
  clean_data.tool4_for_client_ulabeled[[sheet]] <- clean_data.tool4_for_client_ulabeled[[sheet]] |> select(-any_of(c(extra_cols.tool4, qa_cols, "starttime"))) |>
    select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
}

# Tool 5 -----
clean_data.tool5_for_client_ulabeled$data <- clean_data.tool5_ulabeled$data %>% select(-any_of(c(extra_cols.tool5, qa_cols)))

for (sheet in names(clean_data.tool5_for_client_ulabeled)[-1]) {
  clean_data.tool5_for_client_ulabeled[[sheet]] <- clean_data.tool5_for_client_ulabeled[[sheet]] |> select(-any_of(c(extra_cols.tool5, qa_cols, "starttime"))) |>
    select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
}


# Tool 6 -----
clean_data.tool6_for_client_ulabeled$data <- clean_data.tool6_ulabeled$data %>% select(-any_of(c(extra_cols.tool6, qa_cols)))

clean_data.tool6_for_client_ulabeled$Subjects_Added <- clean_data.tool6_ulabeled$Subjects_Added %>% select(-any_of(c(extra_cols.tool6, qa_cols, "starttime"))) |>
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())


# Tool 7 ----
clean_data.tool7_for_client_ulabeled$data <- clean_data.tool7_ulabeled$data %>% select(-any_of(c(extra_cols.tool7, qa_cols)))

for (sheet in names(clean_data.tool7_for_client_ulabeled)[-1]) {
  clean_data.tool7_for_client_ulabeled[[sheet]] <- clean_data.tool7_for_client_ulabeled[[sheet]] |> select(-any_of(c(extra_cols.tool7, qa_cols, "starttime"))) |>
    select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
}

# Tool 8 ----
clean_data.tool8_for_client_ulabeled$data <- clean_data.tool8_ulabeled$data %>% select(-any_of(c(extra_cols.tool8, qa_cols)))

for (sheet in names(clean_data.tool8_for_client_ulabeled)[-1]) {
  clean_data.tool8_for_client_ulabeled[[sheet]] <- clean_data.tool8_for_client_ulabeled[[sheet]] |> select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
    select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
}

# Tool 9 ----
clean_data.tool9_for_client_ulabeled$data <- clean_data.tool9_ulabeled$data %>% select(-any_of(c(extra_cols.tool9, qa_cols)))

for (sheet in names(clean_data.tool9_for_client_ulabeled)[-1]) {
  clean_data.tool9_for_client_ulabeled[[sheet]] <- clean_data.tool9_for_client_ulabeled[[sheet]] |> select(-any_of(c(extra_cols.tool9, qa_cols, "starttime"))) |>
    select(Site_Visit_ID, any_of("CBE_EMIS_School_ID_CBE_KEY"), everything())
}

# clean_data.tool9_for_client_ulabeled$Relevant_photos <- clean_data.tool9_ulabeled$Relevant_photos %>% mutate(PARENT_KEY = as.character(PARENT_KEY)) %>%  select(-any_of(c(extra_cols.tool9, qa_cols, "starttime"))) |>
#   select(Site_Visit_ID, IP_Name, everything())

# remove extra objects from environment  
remove(list = c("qa_cols"))

