library(glue)
Coalesce = function(var) ifelse(is.na(var), 0, var)
# LOGIC CHECK
### lc_tool1_kdr --------------------------------
lc_tool1_kdr <- plyr::rbind.fill(
  # Flagging for BLANK Meta columns
  clean_data.tool1_kdr$data |>
    filter(is.na(SubmissionDate)) |>
    mutate(
      Issue = "Blank value!",
      Question = "SubmissionDate",
      Old_value = as.character(SubmissionDate),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(starttime)) |>
    mutate(
      Issue = "Blank value!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(endtime)) |>
    mutate(
      Issue = "Blank value!",
      Question = "endtime",
      Old_value = as.character(endtime),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(Site_Visit_ID)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Site_Visit_ID",
      Old_value = as.character(Site_Visit_ID),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(Province)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Province",
      Old_value = as.character(Province),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(District)) |>
    mutate(
      Issue = "Blank value!",
      Question = "District",
      Old_value = as.character(District),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(Region)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Region",
      Old_value = as.character(Region),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(Area_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Area_Type",
      Old_value = as.character(Area_Type),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(School_CBE_Name)) |>
    mutate(
      Issue = "Blank value!",
      Question = "School_CBE_Name",
      Old_value = as.character(School_CBE_Name),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(EMIS_School_ID_CBE_KEY)) |>
    mutate(
      Issue = "Blank value!",
      Question = "EMIS_School_ID_CBE_KEY",
      Old_value = as.character(EMIS_School_ID_CBE_KEY),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(Type_Of_School_CBE_Based_On_The_Sample)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Type_Of_School_CBE_Based_On_The_Sample",
      Old_value = as.character(Type_Of_School_CBE_Based_On_The_Sample),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(School_CBE_Gender_Based_On_The_Sample)) |>
    mutate(
      Issue = "Blank value!",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = as.character(School_CBE_Gender_Based_On_The_Sample),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(is.na(Visit_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Visit_Type",
      Old_value = as.character(Visit_Type),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # End
  # Flagging interview conducted before the first day of data collection
  clean_data.tool1_kdr$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 0 Flagging duplicated site visit ID
  clean_data.tool1_kdr$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 1 flagging if the gender of interviewee and her position is inconsistent
  clean_data.tool1_kdr$data |>
    filter(Gender_Of_Interviewee == "Female" & Interviewee_Respondent_Type == "Mullah Imam") |> 
    mutate(
      Issue = "The repondent's position doesn't match her gender!",
      Question = "Gender_Of_Interviewee",
      Old_value = Gender_Of_Interviewee,
      Related_question = "Interviewee_Respondent_Type",
      Related_value = Interviewee_Respondent_Type
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 3 Flagging if the school is closed due to WASH issues or lack of building but at the same time it is used as clinic, hospital or for MoE programs
  clean_data.tool1_kdr$data |>
    filter(
      B6 == "The school does not have a building or has infrastructural and WASH issues" &
        B7 %in% c("Clinic/hospital", "For other MoE programs", "Stock", "For other governmental administration")
    ) |> 
    mutate(
      Issue = "The school has no building or it has WASH issues but at the same time it is reported the building is being used for other purposes!",
      Question = "B6",
      Old_value = B6,
      Related_question = "B7",
      Related_value = B7
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ), 
  
  # 15 Flagging if the Consent is No
  clean_data.tool1_kdr$data |>
    filter(C3 == "No") |>
    mutate(
      Issue = "Consent is reported 'No'!",
      Question = "C3",
      Old_value = C3,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 16 Flagging if The School has only headmaster(s) but the designation of respondent is reported either Official or Acting Principal
  clean_data.tool1_kdr$data |>
    filter(C2 == "The school has only headmaster(s)" & C4 %in% c("Official Principal", "Acting Principal")) |>
    mutate(
      Issue = "The School has only headmaster(s) but the designation of respondent is reported either Official or Acting Principal",
      Question = "C2",
      Old_value = C2,
      Related_question = "C4",
      Related_value = C4
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 17 Flagging if The School has only a deputy teaching manager and headmaster(s) but the designation of respondent is reported either Official or Acting Principal
  clean_data.tool1_kdr$data |>
    filter(C2 == "The school has a deputy teaching manager and headmaster(s) but not a principal" & C4 %in% c("Official Principal", "Acting Principal")) |>
    mutate(
      Issue = "The School has only a deputy teaching manager and headmaster(s) but the designation of respondent is reported either Official or Acting Principal",
      Question = "C2",
      Old_value = C2,
      Related_question = "C4",
      Related_value = C4
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 18 Flagging if The School has a principal but in question C4_1 it is reported that school does not have a principal
  clean_data.tool1_kdr$data |>
    filter(C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") &
             C4_1 == "The school does not have a principal and I fulfil the duties and responsibilities of the principal for this school") |>
    mutate(
      Issue = "The School has a principal but in question C4_1 it is reported that school does not have a principal",
      Question = "C2",
      Old_value = C2,
      Related_question = "C4_1",
      Related_value = C4_1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 19 Flagging if The School does not have a principal, but in question C4_1 it is reported either Principal is not present today or does not want to participate in the interview.
  clean_data.tool1_kdr$data |>
    filter(C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)") &
             C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                         "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")) |>
    mutate(
      Issue = "The School does not have a principal, but in question C4_1 it is reported either Principal is not present today or does not want to participate in the interview.",
      Question = "C2",
      Old_value = C2,
      Related_question = "C4_1",
      Related_value = C4_1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 24 -  Flagging if the school shift in question C1 is reported Single but later in shift details and shift details others reported more than one shift
  clean_data.tool1_kdr$data |> 
    mutate(
      shift_count = case_when(
        is.na(C14A1) | C14A1 == "" ~ 0,
        TRUE ~ (str_count(C14A1,";")+1)
      )
    ) |>
    filter(C1 == "Single" & shift_count > 1) |> 
    mutate(
      Issue = "The school shift in question C1 is reported Single but in question C14A1 more than one shift is reported",
      Question = "C1",
      Old_value = C1,
      Related_question = "C14A1",
      Related_value = C14A1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 25 - Flagging if the school shift in question C1 is reported Multiple but later in shift details and shift details others reported only one shift
  clean_data.tool1_kdr$data |> 
    mutate(
      shift_count = case_when(
        is.na(C14A1) | C14A1 == "" ~ 0,
        TRUE ~ (str_count(C14A1,";")+1)
      )
    )|> 
    filter(C1 == "Multiple" & shift_count == 1) |> 
    mutate(
      Issue = "The school shift in question C1 is reported Multiple but in question C14A1 only one shift is reported",
      Question = "C1",
      Old_value = C1,
      Related_question = "C14A1",
      Related_value = C14A1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 26 - Flagging if The school type does not match with grades reported in school Operationality and Operationality Other sheets
  clean_data.tool1_kdr$data |>
    filter(
      (School_Type_Final %in% c(1,"1") & School_indx != "1 2 3 4 5 6") |
        (School_Type_Final %in% c(2,"2") & School_indx != "1 2 3 4 5 6 7 8 9") |
        (School_Type_Final %in% c(3,"3") & School_indx != "1 2 3 4 5 6 7 8 9 10 11 12")
    ) |> 
    mutate(
      Issue = "The final school type does not match with grades indices in School_Indx question",
      Question = "School_Type_Final",
      Old_value = School_Type_Final,
      Related_question = "School_indx",
      Related_value = School_indx
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ), 
  
  # REmoved for CBE DC
  # clean_data.tool1_kdr$data |>
  #   filter(C1 == "Single" & C15 > 2) |>
  #   mutate(
  #     Issue = "Can you please confirm the number of headmasters in this school - This flag is only for school with Single shift",
  #     Question = "C15",
  #     Old_value = C15,
  #     Related_question = "C1",
  #     Related_value = C1
  #   ) |>
  #   select(
  #     all_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # Headmasters
  clean_data.tool1_kdr$data |>
    filter(C1 == "Multiple" & C15 == 1) |>
    mutate(
      Issue = "Can you please confirm the number of headmasters in this school - This flag is only for school with Multiple shift",
      Question = "C15",
      Old_value = C15,
      Related_question = "C1",
      Related_value = C1
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal",
                     "The school has a principal and headmaster(s) but not a deputy teaching manager",
                     "The school has a principal, deputy teaching manager, and headmaster(s)",
                     "The school has only headmaster(s)") & C15 == 0) |>
    mutate(
      Issue = "In question C2 it is reported that school has headmaster but the number of headmaster/s for this school is reported 0 in question C15",
      Question = "C15",
      Old_value = C15,
      Related_question = "C2",
      Related_value = C2
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # New in Round 4
  clean_data.tool1_kdr$data |>
    filter(I1 == "No Not applicable (school has no male teacher)" & School_Gender_SV %in% c("Male", "Mixed")) |>
    mutate(
      Issue = "The gender of school in SV is reported either Male or Mixed, but in question I1 it is reported that school has no male teacher.",
      Question = "I1",
      Old_value = I1,
      Related_question = "School_Gender_SV",
      Related_value = School_Gender_SV
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data |>
    filter(I3 == "No Not applicable (school has no female teacher)" & School_Gender_SV %in% c("Female", "Mixed")) |>
    mutate(
      Issue = "The gender of school in SV is reported either Female or Mixed, but in question I3 it is reported that school has no female teacher.",
      Question = "I3",
      Old_value = I3,
      Related_question = "School_Gender_SV",
      Related_value = School_Gender_SV
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    left_join(clean_data.tool1_kdr$Support_Respondents %>% 
                group_by(KEY = PARENT_KEY) %>% 
                summarise(
                  total_sup_resp = n()
                ), by = "KEY") %>% 
    filter(L0 == "The interview was conducted without any support respondent" & total_sup_resp > 0) %>% 
    mutate(
      Issue = "The interview was conducted with atleast one support respondent, but the L0 response contradicts with it.",
      Question = "L0",
      Old_value = L0,
      Related_question = "total_sup_resp",
      Related_value = total_sup_resp
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    left_join(clean_data.tool1_kdr$Support_Respondents %>% 
                group_by(KEY = PARENT_KEY) %>% 
                summarise(
                  total_sup_resp = n()
                ), by = "KEY") %>% 
    filter(L0 == "The interview was conducted with support respondent" & (total_sup_resp == 0 | is.na(total_sup_resp))) %>% 
    mutate(
      Issue = "The interview was conducted without any support respondent, but the L0 response contradicts with it.",
      Question = "L0",
      Old_value = L0,
      Related_question = "total_sup_resp",
      Related_value = total_sup_resp
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    filter((
      (C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 _ C4_1",
      Old_value = paste0(C2, "_", C4_1),
      Related_question = "L1",
      Related_value = L1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    filter((
      (C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A1 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A1 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 _ C4_1",
      Old_value = paste0(C2, "_", C4_1),
      Related_question = "L1A1",
      Related_value = L1A1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    filter((
      (C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A2 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A2 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 _ C4_1",
      Old_value = paste0(C2, "_", C4_1),
      Related_question = "L1A2",
      Related_value = L1A2
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    filter((
      (C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A3 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A3 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 _ C4_1",
      Old_value = paste0(C2, "_", C4_1),
      Related_question = "L1A3",
      Related_value = L1A3
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    filter((
      (C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A4 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A4 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 _ C4_1",
      Old_value = paste0(C2, "_", C4_1),
      Related_question = "L1A4",
      Related_value = L1A4
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    filter((
      (C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A6 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A6 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 _ C4_1",
      Old_value = paste0(C2, "_", C4_1),
      Related_question = "L1A6",
      Related_value = L1A6
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    filter((
      (C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A7 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A7 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 _ C4_1",
      Old_value = paste0(C2, "_", C4_1),
      Related_question = "L1A7",
      Related_value = L1A7
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    filter((
      (C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A8 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A8 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 _ C4_1",
      Old_value = paste0(C2, "_", C4_1),
      Related_question = "L1A8",
      Related_value = L1A8
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    filter((
      (C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A9 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A9 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 _ C4_1",
      Old_value = paste0(C2, "_", C4_1),
      Related_question = "L1A9",
      Related_value = L1A9
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  clean_data.tool1_kdr$data %>% 
    filter((
      (C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A10 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A10 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 _ C4_1",
      Old_value = paste0(C2, "_", C4_1),
      Related_question = "L1A10",
      Related_value = L1A10
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> mutate(tool = "Tool 1 - Headmaster KDR", sheet = "data")

### lc_tool1.support_resp_kdr -----------
lc_tool1.support_resp_kdr <- plyr::rbind.fill(
  # 4 Flagging if both supportive respondents have the same position (especially when they are from position that there is only one in each school)
  clean_data.tool1_kdr$Support_Respondents |>
    filter(C12A3 %in% c("Deputy Teaching Affairs", "Executive Manager")) |> 
    group_by(PARENT_KEY) |> 
    filter(n() > 1) |> 
    mutate(
      Issue = glue("Both supportive respondents has the same position {C12A3}!"),
      Question = "C12A3",
      Old_value = C12A3,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> mutate(tool = "Tool 1 - Headmaster KDR", sheet = "Support_Respondents")

### lc_tool1.school_operationality_kdr -----------
lc_tool1.school_operationality_kdr <- plyr::rbind.fill(
  # Flagging if Grade_Name_Eng is blank
  clean_data.tool1_kdr$School_Operationality |>
    filter(is.na(Grade) | Grade == "") |> 
    mutate(
      Issue = "The Grade is reported BLANK for this Site Visit ID!",
      Question = "Grade",
      Old_value = Grade,
      Related_question = "Site_Visit_ID",
      Related_value = Site_Visit_ID
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging duplicated Grade ID
  clean_data.tool1_kdr$School_Operationality |>
    mutate(Grade_ID = paste0(Site_Visit_ID,"-", Grade)) |>
    filter(duplicated(Grade_ID, fromLast = T) | duplicated(Grade_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Grade is reported more than one time for the Site Visit ID!",
      Question = "Grade",
      Old_value = Grade,
      Related_question = "Site_Visit_ID",
      Related_value = Site_Visit_ID
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
  
) |> mutate(tool = "Tool 1 - Headmaster KDR", sheet = "School_Operationality", Old_value = as.character(Old_value))

shifts_and_operationality_kdr <- clean_data.tool1_kdr$Shifts_Detail |>
  select(Shift_indx, Shift_name, starts_with("C14A2"), PARENT_KEY, KEY, all_of(meta_cols)) |>
  filter(!is.na(C14A2_1)) |>
  left_join(
    clean_data.tool1_kdr$School_Operationality |>
      select(PARENT_KEY, Grade, C13A1) |>
      pivot_wider(names_from = Grade, values_from = Grade, values_fill = 0, names_prefix = "grade_", values_fn = length) |>
      filter(C13A1 == "No"), by = "PARENT_KEY")

### lc_tool1.shift -----------
lc_tool1.shift <- plyr::rbind.fill(
  # Flagging if Shift index is blank
  clean_data.tool1_kdr$Shifts_Detail |>
    filter(is.na(Shift_indx) | Shift_indx == "") |> 
    mutate(
      Issue = "The Shift Index is reported BLANK for this Site Visit ID!",
      Question = "Shift_indx",
      Old_value = Shift_indx,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if Shift Name is blank
  clean_data.tool1_kdr$Shifts_Detail |>
    filter(is.na(Shift_name) | Shift_name == "") |> 
    mutate(
      Issue = "The Shift Name is reported BLANK for this Site Visit ID!",
      Question = "Shift_name",
      Old_value = Shift_name,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging duplicated Grade ID
  clean_data.tool1_kdr$Shifts_Detail |>
    mutate(
      Shift_ID = paste0(Site_Visit_ID,"-",Shift_indx)
    ) |>
    filter(duplicated(Shift_ID, fromLast = T) | duplicated(Shift_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Shift is reported more than once for this Site Visit ID!",
      Question = "Shift_indx",
      Old_value = Shift_indx,
      Related_question = "Site_Visit_ID",
      Related_value = Site_Visit_ID
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> mutate(tool = "Tool 1 - Headmaster KDR", sheet = "Shifts_Detail", Old_value = as.character(Old_value))



### lc_tool1.shifts_and_operationality_kdr -----------
if(nrow(shifts_and_operationality_kdr) > 0){
  
  lc_tool1.shifts_and_operationality_kdr <-
    rbind(
      # Flagging if a not operational grade is reported for the shift
      # Grade 1
      shifts_and_operationality_kdr |>
        filter(C14A2_1 == 1 & grade_1 == 1) |>
        mutate(
          Issue = "Grade 1 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 2
      shifts_and_operationality_kdr |>
        filter(C14A2_2 == 1 & grade_2 == 1) |>
        mutate(
          Issue = "Grade 2 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 3
      shifts_and_operationality_kdr |>
        filter(C14A2_3 == 1 & grade_3 == 1) |>
        mutate(
          Issue = "Grade 3 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 4
      shifts_and_operationality_kdr |>
        filter(C14A2_4 == 1 & grade_4 == 1) |>
        mutate(
          Issue = "Grade 4 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 5
      shifts_and_operationality_kdr |>
        filter(C14A2_5 == 1 & grade_5 == 1) |>
        mutate(
          Issue = "Grade 5 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 6
      shifts_and_operationality_kdr |>
        filter(C14A2_6 == 1 & grade_6 == 1) |>
        mutate(
          Issue = "Grade 6 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 7
      shifts_and_operationality_kdr |>
        filter(C14A2_7 == 1 & grade_7 == 1) |>
        mutate(
          Issue = "Grade 7 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 8
      shifts_and_operationality_kdr |>
        filter(C14A2_8 == 1 & grade_8 == 1) |>
        mutate(
          Issue = "Grade 8 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 9
      shifts_and_operationality_kdr |>
        filter(C14A2_9 == 1 & grade_9 == 1) |>
        mutate(
          Issue = "Grade 9 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 10
      shifts_and_operationality_kdr |>
        filter(C14A2_10 == 1 & grade_10 == 1) |>
        mutate(
          Issue = "Grade 10 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 11
      shifts_and_operationality_kdr |>
        filter(C14A2_11 == 1 & grade_11 == 1) |>
        mutate(
          Issue = "Grade 11 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        ),
      # Grade 12
      shifts_and_operationality_kdr |>
        filter(C14A2_12 == 1 & grade_12 == 1) |>
        mutate(
          Issue = "Grade 12 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
        ) |> 
        select(
          all_of(meta_cols),
          Question,
          Old_value,
          Related_question,
          Related_value,
          KEY,
          Issue
        )
    ) |> mutate(tool = "Tool 1 - Headmaster KDR", sheet = "Shifts_Detail", Old_value = as.character(Old_value))
  
}


headmasters_supervised_non_opt_grades_kdr <- clean_data.tool1_kdr$Headmasters |>
  left_join(
    clean_data.tool1_kdr$School_Operationality |>
      select(PARENT_KEY, Grade, C13A1) |>
      arrange(PARENT_KEY, Grade) |>
      pivot_wider(names_from = Grade, values_from = Grade, values_fill = 0, names_prefix = "grade_", values_fn = length) |>
      filter(C13A1 == "No"), by = "PARENT_KEY")


headmaster_not_exist_grades_kdr <- clean_data.tool1_kdr$Headmasters |>
  left_join(
    clean_data.tool1_kdr$School_Operationality |>
      select(PARENT_KEY, Grade) |>
      arrange(PARENT_KEY, Grade) |>
      pivot_wider(names_from = Grade, values_from = Grade, values_fill = 0, names_prefix = "grade_", values_fn = length), by = "PARENT_KEY")

### lc_tool1.headmaster_operationality_and_other -----------
if(nrow(headmasters_supervised_non_opt_grades_kdr) > 0 ){
  lc_tool1.headmaster_operationality_and_other <- plyr::rbind.fill(
    # Flagging if a not operational grade is reported for the shift
    # Grade 1
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_1 == 1 & grade_1 == 1) |>
      mutate(
        Issue = "Grade 1 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 2
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_2 == 1 & grade_2 == 1) |>
      mutate(
        Issue = "Grade 2 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 3
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_3 == 1 & grade_3 == 1) |>
      mutate(
        Issue = "Grade 3 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 4
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_4 == 1 & grade_4 == 1) |>
      mutate(
        Issue = "Grade 4 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 5
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_5 == 1 & grade_5 == 1) |>
      mutate(
        Issue = "Grade 5 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 6
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_6 == 1 & grade_6 == 1) |>
      mutate(
        Issue = "Grade 6 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 7 
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_7 == 1 & grade_7 == 1) |>
      mutate(
        Issue = "Grade 7 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 8
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_8 == 1 & grade_8 == 1) |>
      mutate(
        Issue = "Grade 8 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 9
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_9 == 1 & grade_9 == 1) |>
      mutate(
        Issue = "Grade 9 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 10
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_10 == 1 & grade_10 == 1) |>
      mutate(
        Issue = "Grade 10 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 11
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_11 == 1 & grade_11 == 1) |>
      mutate(
        Issue = "Grade 11 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 12
    headmasters_supervised_non_opt_grades_kdr |>
      filter(C15A2_12 == 1 & grade_12 == 1) |>
      mutate(
        Issue = "Grade 12 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  ) |> mutate(tool = "Tool 1 - Headmaster KDR", sheet = "Headmasters", Old_value = as.character(Old_value))
}


if(nrow(headmaster_not_exist_grades_kdr) > 0){
  lc_tool1.headmaster_operationality_and_other <- plyr::rbind.fill(
    lc_tool1.headmaster_operationality_and_other,
    # Flagging if headmaster reported supervising a grade which is not reported in operationality and operationality other sheets
    # Grade 1
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_1 == 1 & grade_1 == 0) |>
      mutate(
        Issue = "Grade 1 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    
    # Grade 2
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_2 == 1 & grade_2 == 0) |>
      mutate(
        Issue = "Grade 2 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 3
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_3 == 1 & grade_3 == 0) |>
      mutate(
        Issue = "Grade 3 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 4
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_4 == 1 & grade_4 == 0) |>
      mutate(
        Issue = "Grade 4 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 5
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_5 == 1 & grade_5 == 0) |>
      mutate(
        Issue = "Grade 5 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 6
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_6 == 1 & grade_6 == 0) |>
      mutate(
        Issue = "Grade 6 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 7
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_7 == 1 & grade_7 == 0) |>
      mutate(
        Issue = "Grade 7 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 8
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_8 == 1 & grade_8 == 0) |>
      mutate(
        Issue = "Grade 8 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 9
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_9 == 1 & grade_9 == 0) |>
      mutate(
        Issue = "Grade 9 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 10
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_10 == 1 & grade_10 == 0) |>
      mutate(
        Issue = "Grade 10 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 11
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_11 == 1 & grade_11 == 0) |>
      mutate(
        Issue = "Grade 11 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      ),
    # Grade 12
    headmaster_not_exist_grades_kdr |>
      filter(C15A2_12 == 1 & grade_12 == 0) |>
      mutate(
        Issue = "Grade 12 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "",
        Related_value = ""
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  ) |> mutate(tool = "Tool 1 - Headmaster KDR", sheet = "Headmasters", Old_value = as.character(Old_value))
}


### lc_tool1.add_subj_kdr -----------
lc_tool1.add_subj_kdr <- plyr::rbind.fill(
  clean_data.tool1_kdr$Additional_Subjects |>
    mutate(
      key_for_dup = paste0(EMIS_School_ID_CBE_KEY, Additional_Subject)
    ) |>
    filter(duplicated(key_for_dup, fromLast = T) | duplicated(key_for_dup, fromLast = F)) |>
    mutate(
      Issue = "The subject name is reported more than once for same school!",
      Question = "Additional_Subject",
      Old_value = Additional_Subject,
      Related_question = "EMIS_School_ID_CBE_KEY",
      Related_value = EMIS_School_ID_CBE_KEY
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
  mutate(tool = "Tool 1 - Headmaster KDR", sheet = "Additional_Subjects", Old_value = as.character(Old_value))

### Output -------------------
Logic_check_result_kdr <- plyr::rbind.fill(
  lc_tool1_kdr,
  lc_tool1.support_resp_kdr,
  lc_tool1.school_operationality_kdr,
  lc_tool1.shift,
  lc_tool1.shifts_and_operationality_kdr,
  lc_tool1.headmaster_operationality_and_other,
  lc_tool1.add_subj_kdr
)

