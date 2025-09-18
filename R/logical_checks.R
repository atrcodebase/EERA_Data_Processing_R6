library(glue)
# LOGIC CHECK

# Logging issues in Tool 1 ------------------------------------------------
lc_tool1 <- plyr::rbind.fill(
  # Flagging for BLANK Meta columns
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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

  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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
  
  
  clean_data.tool1$data |>
    filter(is.na(Academic_Year)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Academic_Year",
      Old_value = as.character(Academic_Year),
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
  
  clean_data.tool1$data |>
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
  clean_data.tool1$data |>
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
  clean_data.tool1$data |>
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
  clean_data.tool1$data |>
    filter(Gender_Of_Interviewee == "Female" & Interviewee_Respondent_Type == "Mullah Imam") |> 
    mutate(
      Issue = "The repondent's position doesn't match the gender!",
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
  
  # 4 Flagging if both supportive respondents have the same position (especially when they are from position that there is only one in each school)
  clean_data.tool1$Support_Respondents |>
    filter(C12A3 %in% c("Deputy Teaching Affairs", "Executive Manager")) |> 
    group_by(PARENT_KEY) |> 
    filter(n() > 1) |> 
    mutate(
      Issue = glue::glue("Both supportive respondents has the same position {C12A3}!"),
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
    ),
  
  # 13 Flagging if The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B9!
  clean_data.tool1$data |>
    filter(A31 == "Madrassa" & B9_3 == 1) |>
    mutate(
      Issue = "The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B9!",
      Question = "A31",
      Old_value = A31,
      Related_question = "B9",
      Related_value = B9
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
  
  # 14 Flagging if The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B9!
  clean_data.tool1$data |>
    filter(A31 == "Madrassa" & B10_3 == 1) |>
    mutate(
      Issue = "The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B10!",
      Question = "A31",
      Old_value = A31,
      Related_question = "B10",
      Related_value = B10
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
  clean_data.tool1$data |>
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
  clean_data.tool1$data |>
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
  clean_data.tool1$data |>
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
  clean_data.tool1$data |>
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
  clean_data.tool1$data |>
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
  
  # 20 Flagging if The question C8 and A30 has different responses.
  clean_data.tool1$data |>
    filter((C8 == "Yes" & A30 == "No") | (C8 == "No, the school is a general studies school" & A30 == "Yes")) |>
    mutate(
      Issue = "The question C8 and A30 has different responses",
      Question = "C8",
      Old_value = C8,
      Related_question = "A30",
      Related_value = A30
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
  
  
  # 23 Flagging if The question C9 and A31 has different responses.
  clean_data.tool1$data |>
    filter(C9 != A31) |>
    mutate(
      Issue = "The question C9 and A31 has different responses",
      Question = "C9",
      Old_value = C9,
      Related_question = "A31",
      Related_value = A31
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
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data |>
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
  
  clean_data.tool1$data %>% 
    left_join(clean_data.tool1$Support_Respondents %>% 
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
  
  clean_data.tool1$data %>% 
    left_join(clean_data.tool1$Support_Respondents %>% 
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
  
  clean_data.tool1$data %>% 
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
  
  clean_data.tool1$data %>% 
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
  
  clean_data.tool1$data %>% 
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
  
  clean_data.tool1$data %>% 
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
  
  clean_data.tool1$data %>% 
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
  
  clean_data.tool1$data %>% 
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
  
  clean_data.tool1$data %>% 
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
  
  clean_data.tool1$data %>% 
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
  
  clean_data.tool1$data %>% 
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
  
  
) |> mutate(tool = "Tool 1 - Headmaster", sheet = "data")


# Logging issues in Tool 2 ------------------------------------------------
lc_tool2 <- plyr::rbind.fill(
  # Flagging for BLANK Meta columns
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  clean_data.tool2$data |>
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
  
  
  clean_data.tool2$data |>
    filter(is.na(Academic_Year)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Academic_Year",
      Old_value = as.character(Academic_Year),
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
  
  clean_data.tool2$data |>
    filter(is.na(Visit_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Visit_Type",
      Old_value = as.character(Visit_Type),
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
  # End
  # Flagging interview conducted before the first day of data collection
  clean_data.tool2$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
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
  
  # Flagging duplicated site visit ID
  clean_data.tool2$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
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
    ),
  
  # flagging if the school name is confirmed in tool1 but not confirmed here or vice versa 
  # B1 has been removed from tool2
  # clean_data.tool2$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |> 
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(A27.tool1 = A27, Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |> 
  #   filter(B1 != A27.tool1) |> 
  #   mutate(
  #     Issue = "The school name is confirmed in tool1 but not confirmed tool 2 or vice versa!",
  #     Question = "B1",
  #     Old_value = B1,
  #     Related_question = "A27.tool1",
  #     Related_value = A27.tool1
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
  
  # flagging if the answer to conversion of school to a Islamic school is inconsistent across tool 1 and tool 2
  # B3 has been removed from tool2
  # clean_data.tool2$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |> 
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(A30.tool1 = A30, Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |> 
  #   filter(B3 != A30.tool1) |> 
  #   mutate(
  #     Issue = "The answer to conversion of school to an Islamic school is inconsistent across tool 1 and tool 2!",
  #     Question = "B3",
  #     Old_value = B3,
  #     Related_question = "A30.tool1",
  #     Related_value = A30.tool1
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
  
  # flagging if the answer to question related to open/closed status of school is inconsistent across tool 1 and tool 2
  # B7 has been removed from tool2
  # clean_data.tool2$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |> 
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(A34.tool1 = A34, Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |> 
  #   mutate(
  #     B7 = str_trim(B7),
  #     A34.tool1 = str_trim(A34.tool1)
  #   ) |>
  #   filter(
  #     (B7 == "Yes, school is open, teachers and students (both male and female) are inside" & A34.tool1 != "Yes, school is open, and teachers and students (both male and female) are inside") |
  #       (B7 == "Yes, it is open and there are students (only male) and teachers inside" & A34.tool1 != "Yes, it is open and there are students (only male) and teachers inside") |
  #       (B7 == "Yes, it is open and there are students (only female) and teachers inside" & A34.tool1 != "Yes, it is open and there are students (only female) and teachers inside")|
  #       (B7 == "Yes, school is open and there are only teachers and no students inside" & A34.tool1 != "Yes, school is open and there are only teachers and no students inside")|
  #       (B7 == "Yes, school is open, but there are no admin/academic staff members, teachers, or students inside" & A34.tool1 != "Yes, school is open, but there are no admin/academic staff members, teachers, or students inside")|
  #       (B7 == "No, school is closed and there is no one inside" & A34.tool1 != "No, school is closed and there is no one inside")
  #   ) |> 
  #   mutate(
  #     Issue = "The answer to question related to open/closed status of school is inconsistent across tool 1 and tool 2!",
  #     Question = "B7",
  #     Old_value = B7,
  #     Related_question = "A34.tool1",
  #     Related_value = A34.tool1
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
  
  # flagging if the answer to 'When did the school close?' is inconsistent across tool 1 and tool 2
  # C10 has been removed from tool2
  # clean_data.tool2$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |> 
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(B8.tool1 = B8, Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |> 
  #   filter(C10 != B8.tool1) |> 
  #   mutate(
  #     Issue = "The answer to 'When did the school close?' is inconsistent across tool 1 and tool 2!",
  #     Question = "C10",
  #     Old_value = C10,
  #     Related_question = "B8.tool1",
  #     Related_value = B8.tool1
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
  
  # flagging if the answer to 'Where are male children and adults going for schooling since the school was closed?' is inconsistent across tool 1 and tool 2
  # C11 has been removed from tool2
  # clean_data.tool2$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |>
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(starts_with("B9"), Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |>
  #   filter(C11_998 != 1) |>
  #   filter(
  #     C11_1 != B9_1 |
  #       C11_2 != B9_2 |
  #       C11_3 != B9_3 |
  #       C11_4 != B9_4 |
  #       C11_5 != B9_5 |
  #       C11_6 != B9_6
  #   ) |>
  #   mutate(
  #     Issue = "The answer to this question is inconsistent across tool 1 and tool 2!",
  #     Question = "C11",
  #     Old_value = C11,
  #     Related_question = "B9",
  #     Related_value = B9
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
  
  # flagging if the answer to 'Where are female children and adults going for schooling since the school was closed?' is inconsistent across tool 1 and tool 2
  # C12 has been removed from tool2
  # clean_data.tool2$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |>
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(starts_with("B10"), Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |>
  #   filter(C12_998 != 1) |>
  #   filter(
  #     C12_1 != B10_1 |
  #       C12_2 != B10_2 |
  #       C12_3 != B10_3 |
  #       C12_4 != B10_4 |
  #       C12_5 != B10_5 |
  #       C12_6 != B10_6
  #   ) |>
  #   mutate(
  #     Issue = "The answer to this question is inconsistent across tool 1 and tool 2!",
  #     Question = "C12",
  #     Old_value = C12,
  #     Related_question = "B10",
  #     Related_value = B10
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
  
  # Flagging if shift types differs between tool 2 and tool 1
  # D1 has been removed from tool2
  # clean_data.tool2$data |>
  #   left_join(
  #     clean_data.tool1$data |> select( Site_Visit_ID, C1.tool1 = C1),  by = "Site_Visit_ID") |>
  #   filter(D1 != C1.tool1) |>
  #   mutate(
  #     Issue = "The shift types differs between tool 2 and tool 1!",
  #     Question = "D1",
  #     Old_value = D1,
  #     Related_question ="C1 (Tool 1)",
  #     Related_value = C1.tool1
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
  
  # Flagging if The Head staff of school reported different between tool 2 and tool 1
  # D2 has been removed from tool2
  # clean_data.tool2$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |>
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(C2.tool1 = C2, Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |>
  #   filter(!is.na(C2.tool1) & (D2 != "Other" & C2.tool1 != "Other") & D2 != C2.tool1) |>
  #   mutate(
  #     Issue = "The Head staff of school reported different between tool 2 and tool 1",
  #     Question = "D2",
  #     Old_value = D2,
  #     Related_question = "C2(Tool 1)",
  #     Related_value = C2.tool1
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

  # 24 -  Flagging if the school shift in question D1 is reported Single but later in shift details and shift details others reported more than one shift # HERE
  # D1 has been removed from tool2
  # clean_data.tool2$data |>
  #   left_join(
  #     clean_data.tool2$Shifts_Detail |> select(Site_Visit_ID,Shift_name) |> # Removed  |> filter(!is.na(Shift_name))
  #       group_by(Site_Visit_ID) |>
  #       summarise(
  #         shift_count = n()
  #       ), by = "Site_Visit_ID") |>
  #   filter(D1 == "Single" & (shift_count != 1)) |>
  #   mutate(
  #     Issue = "The school shift in question D1 is reported Single but later in shift details reported more than one shift",
  #     Question = "D1",
  #     Old_value = D1,
  #     Related_question = "shift_count (Calculated form Shifts_Detail)",
  #     Related_value = shift_count
  #   ) |>
  #   select(
  #     any_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # D1 has been removed form tool2
  # clean_data.tool2$data |>
  #   left_join(
  #     clean_data.tool2$Shifts_Detail |> select(Site_Visit_ID,Shift_name) |> # Removed  |> filter(!is.na(Shift_name))
  #       group_by(Site_Visit_ID) |>
  #       summarise(
  #         shift_count = n()
  #       ), by = "Site_Visit_ID") |>
  #   filter(D1 == "Multiple" & (shift_count == 1 | is.na(shift_count))) |>
  #   mutate(
  #     Issue = "The school shift in question D1 is reported Multiple but later in shift details reported only one shift",
  #     Question = "D1",
  #     Old_value = D1,
  #     Related_question = "shift_count (Calculated form Shifts_Detail)",
  #     Related_value = shift_count
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
  
  # 26 - Flagging  if The school type does not match with grades reported in school Operationality and Operationality Other sheets
  clean_data.tool2$School_Operationality |>
    select(Site_Visit_ID,Grade) |>
    filter(!is.na(Grade)) |>
    mutate(
      Grade_value = Grade
    ) |>
    select(-Grade) |>
    arrange(Site_Visit_ID, Grade_value) |>
    pivot_wider(names_from = Grade_value,values_from = Grade_value, values_fill = 0, names_prefix = "grade_", values_fn = length) |>
    arrange(Site_Visit_ID) |>
    mutate(
      School_type_compare = case_when(
        rowSums(across(c(grade_10,grade_11,grade_12))) > 1 ~ "Higher Secondary",
        rowSums(across(c(grade_7,grade_8,grade_9))) > 1 ~ "Secondary",
        rowSums(across(c(grade_1,grade_2,grade_3,grade_4,grade_5,grade_6))) > 1 ~ "Primary",
        TRUE ~ NA_character_
      )
    ) |>
    left_join(
      clean_data.tool2$data |>
        select(Site_Visit_ID, School_Type_SV, KEY, any_of(meta_cols)),
      by = "Site_Visit_ID") |>
    filter(School_Type_SV != School_type_compare) |>
    mutate(
      Issue = "The school type does not match with grades reported in school Operationality sheet",
      Question = "School_Type_SV",
      Old_value = School_Type_SV,
      Related_question = "School_type_compare (Calculated based on Grades from Opertionality Sheet)",
      Related_value = School_type_compare
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
  
  # 6 Flagging if respondent reported "No" to confirm the n of male teachers but later reported the same number of male teachers as it's in the sample
  clean_data.tool2$data |>
    filter(E1 == "No" & E2 == N_Male_Teachers) |>
    mutate(
      Issue = "The respondent reported 'No' to confirm the n of male teachers in (E1), but later reported the same number of male teachers as it's in the sample",
      Question = "E2",
      Old_value = E2,
      Related_question = "N_Male_Teachers",
      Related_value = N_Male_Teachers
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
  
  # TS: For tool 2
  clean_data.tool2$data |>
    filter(E5 == "No" & E6 == N_Female_Teachers) |>
    mutate(
      Issue = "The respondent reported 'No' to confirm the n of female teachers in (E5), but later reported the same number of female teachers as it's in the sample",
      Question = "E6",
      Old_value = E6,
      Related_question = "N_Female_Teachers",
      Related_value = N_Female_Teachers
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
  
  # New for R4
  clean_data.tool1$data %>% 
    select(School_Gender_SV, EMIS_School_ID_CBE_KEY) %>% 
    left_join(clean_data.tool2$data, by = "EMIS_School_ID_CBE_KEY") %>% 
    filter(School_Gender_SV %in% c("Female", "Mixed") & E3_5 == 1) %>%
    mutate(
      Issue = "The SV Gender of school is reported Female or Mixed, but in question E3 it is reported 'due to school transformation from female to male, more male teachers were hired",
      Question = "E3",
      Old_value = E3,
      Related_question = "School_Gender_SV (from tool 1)",
      Related_value = School_Gender_SV
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

  clean_data.tool1$data %>% 
    select(School_Gender_SV, EMIS_School_ID_CBE_KEY) %>% 
    left_join(clean_data.tool2$data, by = "EMIS_School_ID_CBE_KEY") %>% 
    filter(School_Gender_SV %in% c("male", "Mixed") & E7_5 == 1) %>%
    mutate(
      Issue = "The SV Gender of school is reported male or Mixed, but in question E7 it is reported 'due to school transformation from male to female, more female teachers were hired",
      Question = "E7",
      Old_value = E7,
      Related_question = "School_Gender_SV (from tool 1)",
      Related_value = School_Gender_SV
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

  clean_data.tool2$data %>% 
    filter(School_Type_SV == "Primary" & E3_6 == 1) %>%
    mutate(
      Issue = "The SV Type of school is reported Primary, while in question E3 it is reported 'due to school promotion from primary to Secondary, more teachers were hired",
      Question = "E3",
      Old_value = E3,
      Related_question = "School_Type_SV (from tool 1)",
      Related_value = School_Type_SV
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

  clean_data.tool2$data %>%
    filter(School_Type_SV == "Primary" & E7_6 == 1) %>%
    mutate(
      Issue = "The SV Type of school is reported Primary, while in question E7 it is reported 'due to school promotion from primary to Secondary, more teachers were hired",
      Question = "E7",
      Old_value = E7,
      Related_question = "School_Type_SV",
      Related_value = School_Type_SV
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
  
  clean_data.tool2$data %>% 
    left_join(
      clean_data.tool1$data %>% select(C2_tool1 = C2, EMIS_School_ID_CBE_KEY), by = "EMIS_School_ID_CBE_KEY"
    ) %>% 
    filter((
      (C2_tool1 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2_tool1 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            D4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 (From tool 1) _ D4_1",
      Old_value = paste0(C2_tool1, "_", D4_1),
      Related_question = "L1",
      Related_value = L1
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
  
  clean_data.tool2$data %>% 
    left_join(
      clean_data.tool1$data %>% select(C2_tool1 = C2, EMIS_School_ID_CBE_KEY), by = "EMIS_School_ID_CBE_KEY"
    ) %>% 
    filter((
      (C2_tool1 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2_tool1 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            D4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A1 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A1 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 (From tool 1) _ D4_1",
      Old_value = paste0(C2_tool1, "_", D4_1),
      Related_question = "L1A1",
      Related_value = L1A1
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
  
  clean_data.tool2$data %>% 
    left_join(
      clean_data.tool1$data %>% select(C2_tool1 = C2, EMIS_School_ID_CBE_KEY), by = "EMIS_School_ID_CBE_KEY"
    ) %>% 
    filter((
      (C2_tool1 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)")) |
        ((C2_tool1 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") & 
            D4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                        "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")))) &
        L1A2 %in% c("Questions in this section were responded by the principal", "Support respondents responded to questions in this section in the presence of the principal")) %>% 
    mutate(
      Issue = "The school does not have a principal/the principal was absent or did not want to attend the interview, but in L1A2 it is reported that the principal was the respondent for the section or he was present at the time of interview.",
      Question = "C2 (From tool 1) _ D4_1",
      Old_value = paste0(C2_tool1, "_", D4_1),
      Related_question = "L1A2",
      Related_value = L1A2
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
  
  clean_data.tool2$data %>% 
    left_join(
      clean_data.tool1$data %>% select(EMIS_School_ID_CBE_KEY, School_Type_SV.tool1 = School_Type_SV) %>% filter(!is.na(School_Type_SV.tool1)), by = "EMIS_School_ID_CBE_KEY"
    ) %>% 
    filter(!is.na(School_Type_SV.tool1)) %>% 
    filter(School_Type_SV != School_Type_SV.tool1) %>% 
    mutate(
      Issue = "The school type SV is different for the same school across tool 2 and tool 1.",
      Question = "School_Type_SV",
      Old_value = School_Type_SV,
      Related_question = "School_Type_SV.tool1",
      Related_value = School_Type_SV.tool1
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
  
  # New R5
  # Flagging if the number of distributed PS Stationary kits is reported more than what the school did receive.
  clean_data.tool2$data %>% 
    filter(H6 > H4) %>%
    mutate(
      Issue = "The number of distributed Kit-Edari is reported more than what the school received.",
      Question = "H6",
      Old_value = H6,
      Related_question = "H4",
      Related_value = H4
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
  
  # Flagging if the number of distributed Teacher kits is reported more than what the school did receive.
  clean_data.tool2$data %>% 
    filter(i6 > i4_Yes) %>%
    mutate(
      Issue = "The number of distributed Teacher's Kit is reported more than what the school received.",
      Question = "i6",
      Old_value = i6,
      Related_question = "i4_Yes",
      Related_value = i4_Yes
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
  
  # Flagging if the number of distributed Student kits is reported more than what the school did receive.
  clean_data.tool2$data %>% 
    filter(J6 > J4_Yes) %>%
    mutate(
      Issue = "The number of distributed Students's Kit is reported more than what the school received.",
      Question = "J6",
      Old_value = J6,
      Related_question = "J4_Yes",
      Related_value = J4_Yes
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
  
  # Flagging if the number of distributed Textbooks is reported more than what the school did receive.
  clean_data.tool2$data %>% 
    filter(Textbooks_Distributed == "[Integer]") %>% 
    filter(N_Textbooks_Distributed > N_Textbooks_Received) %>%
    mutate(
      Issue = "The number of distributed textbooks is reported more than what the school received.",
      Question = "N_Textbooks_Distributed",
      Old_value = N_Textbooks_Distributed,
      Related_question = "N_Textbooks_Received",
      Related_value = N_Textbooks_Received
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
  mutate(tool = "Tool 2 - Light", sheet = "data", Old_value = as.character(Old_value))


# TS : to tool 2
lc_tool2.school_operationality <- plyr::rbind.fill(
  # Flagging if Grade ID is blank
  clean_data.tool2$School_Operationality |>
    filter(is.na(Grade) | Grade == "") |>
    mutate(
      Issue = "The Grade is reported BLANK for this School!",
      Question = "Grade",
      Old_value = Grade,
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
  # Flagging duplicated Grade ID
  clean_data.tool2$School_Operationality |>
    mutate(
      Grade_ID = paste0(EMIS_School_ID_CBE_KEY, Grade)
    ) |>
    filter(duplicated(Grade_ID, fromLast = T) | duplicated(Grade_ID, fromLast = F)) |>
    mutate(
      Issue = "The Grade ID is duplicated for this School!",
      Question = "Grade",
      Old_value = Grade,
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
    )

) |> mutate(tool = "Tool 2 - Light", sheet = "School_Operationality", Old_value = as.character(Old_value))

lc_tool2.shift <- plyr::rbind.fill(
  # Flagging if Shift ID is blank
  clean_data.tool2$Shifts_Detail |>
    filter(is.na(Shift_indx) | Shift_indx == "") |> 
    mutate(
      Issue = "The Shift_indx is reported BLANK for this School!",
      Question = "Shift_indx",
      Old_value = Shift_indx,
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
  
  # Flagging duplicated Grade ID
  clean_data.tool2$Shifts_Detail |>
    mutate(
      Shift_ID = paste0(EMIS_School_ID_CBE_KEY, Shift_indx)
    ) |>
    filter(duplicated(Shift_ID, fromLast = T) | duplicated(Shift_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Shift_indx is duplicated for this School!",
      Question = "Shift_indx",
      Old_value = Shift_indx,
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
    )
  
)  |> mutate(tool = "Tool 2 - Light", sheet = "Shifts_Detail", Old_value = as.character(Old_value))



shifts_and_operationality <- clean_data.tool2$Shifts_Detail |>
  left_join(
    clean_data.tool2$School_Operationality |>
      select(EMIS_School_ID_CBE_KEY , Grade_Value = Grade, is_operational = C13A1) |>
      filter(!is.na(Grade_Value) & Grade_Value != "") |>
      pivot_wider(names_from = Grade_Value, values_from = Grade_Value, values_fill = 0, names_prefix = "grade_", values_fn = length) |>
      filter(is_operational == "No")
    , by = "EMIS_School_ID_CBE_KEY")

lc_tool2.shift_operationality_and_other <- plyr::rbind.fill(
  # Flagging if a not operational grade is reported for the shift
  # Grade 1
  shifts_and_operationality |>
    filter(C14A2_1 == 1 & grade_1 == 1) |>
    mutate(
      Issue = "Grade 1 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 2
  shifts_and_operationality |>
    filter(C14A2_2 == 1 & grade_2 == 1) |>
    mutate(
      Issue = "Grade 2 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 3
  shifts_and_operationality |>
    filter(C14A2_3 == 1 & grade_3 == 1) |>
    mutate(
      Issue = "Grade 3 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 4
  shifts_and_operationality |>
    filter(C14A2_4 == 1 & grade_4 == 1) |>
    mutate(
      Issue = "Grade 4 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 5
  shifts_and_operationality |>
    filter(C14A2_5 == 1 & grade_5 == 1) |>
    mutate(
      Issue = "Grade 5 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 6
  shifts_and_operationality |>
    filter(C14A2_6 == 1 & grade_6 == 1) |>
    mutate(
      Issue = "Grade 6 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 7
  shifts_and_operationality |>
    filter(C14A2_7 == 1 & grade_7 == 1) |>
    mutate(
      Issue = "Grade 7 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 8
  shifts_and_operationality |>
    filter(C14A2_8 == 1 & grade_8 == 1) |>
    mutate(
      Issue = "Grade 8 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 9
  shifts_and_operationality |>
    filter(C14A2_9 == 1 & grade_9 == 1) |>
    mutate(
      Issue = "Grade 9 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 10
  shifts_and_operationality |>
    filter(C14A2_10 == 1 & grade_10 == 1) |>
    mutate(
      Issue = "Grade 10 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 11
  shifts_and_operationality |>
    filter(C14A2_11 == 1 & grade_11 == 1) |>
    mutate(
      Issue = "Grade 11 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  # Grade 12
  shifts_and_operationality |>
    filter(C14A2_12 == 1 & grade_12 == 1) |>
    mutate(
      Issue = "Grade 12 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
      Question = "C14A2",
      Old_value = C14A2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
)  |> mutate(tool = "Tool 2 - Light", sheet = "Shifts_Detail", Old_value = as.character(Old_value))


shift_details_grade_unique <- clean_data.tool2$Shifts_Detail %>% 
  select(EMIS_School_ID_CBE_KEY, starts_with("C14A2_")) %>% 
  pivot_longer(cols = C14A2_1:C14A2_12, names_to = "Shifts") %>% 
  # arrange(EMIS_School_ID_CBE_KEY) %>% 
  filter(value == 1) %>% 
  distinct(.keep_all = T) %>% 
  mutate(
    Shift_value = gsub("C14A2_", "", Shifts),
    Shift_value = as.numeric(Shift_value)
  ) %>%
  arrange(EMIS_School_ID_CBE_KEY, Shift_value) %>% 
  select(EMIS_School_ID_CBE_KEY, Shift_value) %>% 
  pivot_wider(names_from = Shift_value, values_from = Shift_value, values_fill = 0, names_prefix = "shift_grade_", values_fn = length) %>% 
  left_join(
    clean_data.tool2$Shifts_Detail %>% 
      select(any_of(meta_cols), KEY), by = "EMIS_School_ID_CBE_KEY"
  )
  

operational_grades_not_reported_in_shifts <- shift_details_grade_unique %>% 
  left_join(
    clean_data.tool2$School_Operationality |>
      select(EMIS_School_ID_CBE_KEY , Grade_Value = Grade, is_operational = C13A1) |>
      filter(!is.na(Grade_Value) & Grade_Value != "") |>
      pivot_wider(names_from = Grade_Value, values_from = Grade_Value, values_fill = 0, names_prefix = "grade_", values_fn = length) |>
      filter(is_operational == "Yes")
    , by = "EMIS_School_ID_CBE_KEY")

# Flag if an operational grade (in operationality grades sheet) is reported not conducted in any of the shifts for the school
operational_grades_not_reported_in_shifts_log <- plyr::rbind.fill(
  # Grade 1
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_1 == 0 & grade_1 == 1) |>
    mutate(
      Issue = "Grade 1 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_1(C14A2)",
      Old_value = shift_grade_1,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 2
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_2 == 0 & grade_2 == 1) |>
    mutate(
      Issue = "Grade 2 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_2(C14A2)",
      Old_value = shift_grade_2,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 3
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_3 == 0 & grade_3 == 1) |>
    mutate(
      Issue = "Grade 3 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_3(C14A2)",
      Old_value = shift_grade_3,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 4
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_4 == 0 & grade_4 == 1) |>
    mutate(
      Issue = "Grade 4 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_4(C14A2)",
      Old_value = shift_grade_4,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 5
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_5 == 0 & grade_5 == 1) |>
    mutate(
      Issue = "Grade 5 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_5(C14A2)",
      Old_value = shift_grade_5,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 6
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_6 == 0 & grade_6 == 1) |>
    mutate(
      Issue = "Grade 6 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_6(C14A2)",
      Old_value = shift_grade_6,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 7
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_7 == 0 & grade_7 == 1) |>
    mutate(
      Issue = "Grade 7 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_7(C14A2)",
      Old_value = shift_grade_7,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 8
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_8 == 0 & grade_8 == 1) |>
    mutate(
      Issue = "Grade 8 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_8(C14A2)",
      Old_value = shift_grade_8,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 9
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_9 == 0 & grade_9 == 1) |>
    mutate(
      Issue = "Grade 9 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_9(C14A2)",
      Old_value = shift_grade_9,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 10
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_10 == 0 & grade_10 == 1) |>
    mutate(
      Issue = "Grade 10 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_10(C14A2)",
      Old_value = shift_grade_10,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 11
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_11 == 0 & grade_11 == 1) |>
    mutate(
      Issue = "Grade 11 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_11(C14A2)",
      Old_value = shift_grade_11,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
  
  # Grade 12
  operational_grades_not_reported_in_shifts %>% 
    filter(shift_grade_12 == 0 & grade_12 == 1) |>
    mutate(
      Issue = "Grade 12 is reported as an operational grade in Operationality Sheet, while it is reported not conducted in any of the shifts in the school!",
      Question = "shift_grade_12(C14A2)",
      Old_value = shift_grade_12,
      Related_question = "C13A1(School_Operationality)",
      Related_value = is_operational
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
)  |> mutate(tool = "Tool 2 - Light", sheet = "Shifts_Detail", Old_value = as.character(Old_value))


headmaster_and_operationality <- clean_data.tool2$Headmasters |>
  left_join(
    clean_data.tool2$School_Operationality |>
      select(EMIS_School_ID_CBE_KEY , Grade_Value = Grade, is_operational = C13A1) |>
      # mutate(sheet = "School_Operationality", Grade_Value = Grade) |>
      filter(!is.na(Grade_Value) & Grade_Value != "") |>
      select(EMIS_School_ID_CBE_KEY, is_operational, Grade_Value) |>
      pivot_wider(names_from = Grade_Value, values_from = Grade_Value, values_fill = 0, names_prefix = "grade_", values_fn = length) %>% 
      filter(is_operational == "No")
    , by = "EMIS_School_ID_CBE_KEY" )

headmaster_not_exist_grades <- clean_data.tool2$Headmasters |>
  left_join(
    clean_data.tool2$School_Operationality |>
      select(EMIS_School_ID_CBE_KEY , Grade_Value = Grade) |>
      filter(!is.na(Grade_Value) & Grade_Value != "") |> 
    arrange(EMIS_School_ID_CBE_KEY, Grade_Value) |> 
    # arrange(Grade_ID) |>
    pivot_wider(names_from = Grade_Value, values_from = Grade_Value, values_fill = 0, names_prefix = "grade_", values_fn = length)
    , by = "EMIS_School_ID_CBE_KEY" )


lc_tool2.headmaster_operationality_and_other <- plyr::rbind.fill(
  # Flagging if a not operational grade is reported for the shift
  # Grade 1
    headmaster_and_operationality |>
      filter(C15A2_1 == 1 & grade_1 == 1) |>
      mutate(
        Issue = "Grade 1 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 2
    headmaster_and_operationality |>
      filter(C15A2_2 == 1 & grade_2 == 1) |>
      mutate(
        Issue = "Grade 2 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 3
    headmaster_and_operationality |>
      filter(C15A2_3 == 1 & grade_3 == 1) |>
      mutate(
        Issue = "Grade 3 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 4
    headmaster_and_operationality |>
      filter(C15A2_4 == 1 & grade_4 == 1) |>
      mutate(
        Issue = "Grade 4 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 5
    headmaster_and_operationality |>
      filter(C15A2_5 == 1 & grade_5 == 1) |>
      mutate(
        Issue = "Grade 5 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 6
    headmaster_and_operationality |>
      filter(C15A2_6 == 1 & grade_6 == 1) |>
      mutate(
        Issue = "Grade 6 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 7 
    headmaster_and_operationality |>
      filter(C15A2_7 == 1 & grade_7 == 1) |>
      mutate(
        Issue = "Grade 7 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 8
    headmaster_and_operationality |>
      filter(C15A2_8 == 1 & grade_8 == 1) |>
      mutate(
        Issue = "Grade 8 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 9
    headmaster_and_operationality |>
      filter(C15A2_9 == 1 & grade_9 == 1) |>
      mutate(
        Issue = "Grade 9 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 10
    headmaster_and_operationality |>
      filter(C15A2_10 == 1 & grade_10 == 1) |>
      mutate(
        Issue = "Grade 10 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 11
    headmaster_and_operationality |>
      filter(C15A2_11 == 1 & grade_11 == 1) |>
      mutate(
        Issue = "Grade 11 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    # Grade 12
    headmaster_and_operationality |>
      filter(C15A2_12 == 1 & grade_12 == 1) |>
      mutate(
        Issue = "Grade 12 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = is_operational
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
    
    # Flagging if headmaster reported supervising a grade which is not reported in operationality sheets
    # Grade 1
    headmaster_not_exist_grades |>
      filter(C15A2_1 == 1 & grade_1 == 0) |>
      mutate(
        Issue = "Grade 1 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    
    # Grade 2
    headmaster_not_exist_grades |>
      filter(C15A2_2 == 1 & grade_2 == 0) |>
      mutate(
        Issue = "Grade 2 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    # Grade 3
    headmaster_not_exist_grades |>
      filter(C15A2_3 == 1 & grade_3 == 0) |>
      mutate(
        Issue = "Grade 3 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    # Grade 4
    headmaster_not_exist_grades |>
      filter(C15A2_4 == 1 & grade_4 == 0) |>
      mutate(
        Issue = "Grade 4 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    # Grade 5
    headmaster_not_exist_grades |>
      filter(C15A2_5 == 1 & grade_5 == 0) |>
      mutate(
        Issue = "Grade 5 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    # Grade 6
    headmaster_not_exist_grades |>
      filter(C15A2_6 == 1 & grade_6 == 0) |>
      mutate(
        Issue = "Grade 6 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    # Grade 7
    headmaster_not_exist_grades |>
      filter(C15A2_7 == 1 & grade_7 == 0) |>
      mutate(
        Issue = "Grade 7 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    # Grade 8
    headmaster_not_exist_grades |>
      filter(C15A2_8 == 1 & grade_8 == 0) |>
      mutate(
        Issue = "Grade 8 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    # Grade 9
    headmaster_not_exist_grades |>
      filter(C15A2_9 == 1 & grade_9 == 0) |>
      mutate(
        Issue = "Grade 9 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    # Grade 10
    headmaster_not_exist_grades |>
      filter(C15A2_10 == 1 & grade_10 == 0) |>
      mutate(
        Issue = "Grade 10 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    # Grade 11
    headmaster_not_exist_grades |>
      filter(C15A2_11 == 1 & grade_11 == 0) |>
      mutate(
        Issue = "Grade 11 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
    # Grade 12
    headmaster_not_exist_grades |>
      filter(C15A2_12 == 1 & grade_12 == 0) |>
      mutate(
        Issue = "Grade 12 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
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
      )
    
) |> mutate(tool = "Tool 2 - Light", sheet = "Headmasters", Old_value = as.character(Old_value))


# New in R5
grades_received_kits_and_operational_grades <- clean_data.tool2$data %>% 
  left_join(
    clean_data.tool2$School_Operationality %>% 
      select(EMIS_School_ID_CBE_KEY, Grade_Value = Grade, is_operational = C13A1) %>% 
      filter(!is.na(Grade_Value) & Grade_Value != "") %>% 
      pivot_wider(names_from = Grade_Value, values_from = Grade_Value, values_fill = 0, names_prefix = "opt_grade_", values_fn = length) %>% 
      filter(is_operational == "No"),
    by = "EMIS_School_ID_CBE_KEY"
  )
  
lc_grades_received_kits_and_operational_grades <- plyr::rbind.fill(
  # Grade 1 
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_1 == 1 & opt_grade_1 == 1) |>
    mutate(
      Issue = "Grade 1 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 2
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_2 == 1 & opt_grade_2 == 1) |>
    mutate(
      Issue = "Grade 2 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 3
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_3 == 1 & opt_grade_3 == 1) |>
    mutate(
      Issue = "Grade 3 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 4
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_4 == 1 & opt_grade_4 == 1) |>
    mutate(
      Issue = "Grade 4 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 5
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_5 == 1 & opt_grade_5 == 1) |>
    mutate(
      Issue = "Grade 5 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 6
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_6 == 1 & opt_grade_6 == 1) |>
    mutate(
      Issue = "Grade 6 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 7
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_7 == 1 & opt_grade_7 == 1) |>
    mutate(
      Issue = "Grade 7 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 8
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_8 == 1 & opt_grade_8 == 1) |>
    mutate(
      Issue = "Grade 8 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 9
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_9 == 1 & opt_grade_9 == 1) |>
    mutate(
      Issue = "Grade 9 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 10
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_10 == 1 & opt_grade_10 == 1) |>
    mutate(
      Issue = "Grade 10 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 11
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_11 == 1 & opt_grade_11 == 1) |>
    mutate(
      Issue = "Grade 11 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 12
  grades_received_kits_and_operational_grades |>
    filter(i6_Grades_12 == 1 & opt_grade_12 == 1) |>
    mutate(
      Issue = "Grade 12 is selected as the Grade for which the Teacher has received the Teacher Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "i6_Grades",
      Old_value = i6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Student Kits
  # Grade 1
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_1 == 1 & opt_grade_1 == 1) |>
    mutate(
      Issue = "Grade 1 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 2
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_2 == 1 & opt_grade_2 == 1) |>
    mutate(
      Issue = "Grade 2 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 3
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_3 == 1 & opt_grade_3 == 1) |>
    mutate(
      Issue = "Grade 3 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 4
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_4 == 1 & opt_grade_4 == 1) |>
    mutate(
      Issue = "Grade 4 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 5
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_5 == 1 & opt_grade_5 == 1) |>
    mutate(
      Issue = "Grade 5 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 6
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_6 == 1 & opt_grade_6 == 1) |>
    mutate(
      Issue = "Grade 6 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 7
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_7 == 1 & opt_grade_7 == 1) |>
    mutate(
      Issue = "Grade 7 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 8
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_8 == 1 & opt_grade_8 == 1) |>
    mutate(
      Issue = "Grade 8 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 9
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_9 == 1 & opt_grade_9 == 1) |>
    mutate(
      Issue = "Grade 9 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 10
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_10 == 1 & opt_grade_10 == 1) |>
    mutate(
      Issue = "Grade 10 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 11
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_11 == 1 & opt_grade_11 == 1) |>
    mutate(
      Issue = "Grade 11 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 12
  grades_received_kits_and_operational_grades |>
    filter(J6_Grades_12 == 1 & opt_grade_12 == 1) |>
    mutate(
      Issue = "Grade 12 is selected as the Grade for which the Students have received the Students Kits, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "J6_Grades",
      Old_value = J6_Grades,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Mini Library
  # Grade 1
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_1 == 1 & opt_grade_1 == 1) %>% 
    mutate(
      Issue = "Grade 1 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 2
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_2 == 1 & opt_grade_2 == 1) %>% 
    mutate(
      Issue = "Grade 2 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 3
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_3 == 1 & opt_grade_3 == 1) %>% 
    mutate(
      Issue = "Grade 3 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 4
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_4 == 1 & opt_grade_4 == 1) %>% 
    mutate(
      Issue = "Grade 4 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 5
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_5 == 1 & opt_grade_5 == 1) %>% 
    mutate(
      Issue = "Grade 5 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 6
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_6 == 1 & opt_grade_6 == 1) %>% 
    mutate(
      Issue = "Grade 6 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 7
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_7 == 1 & opt_grade_7 == 1) %>% 
    mutate(
      Issue = "Grade 7 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 8
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_8 == 1 & opt_grade_8 == 1) %>% 
    mutate(
      Issue = "Grade 8 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 9
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_9 == 1 & opt_grade_9 == 1) %>% 
    mutate(
      Issue = "Grade 9 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 10
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_10 == 1 & opt_grade_10 == 1) %>% 
    mutate(
      Issue = "Grade 10 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 11
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_11 == 1 & opt_grade_11 == 1) %>% 
    mutate(
      Issue = "Grade 11 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Grade 12
  grades_received_kits_and_operational_grades |>
    filter(Grades_Mini_Library_12 == 1 & opt_grade_12 == 1) %>% 
    mutate(
      Issue = "Grade 12 is selected as the Grade which will benefit from Mini-library, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Mini_Library",
      Old_value = Grades_Mini_Library,
      Related_question = "C13A1(School_Operationality)",
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
  
  # Textbooks
  # Grade 1
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_1 == 1 & opt_grade_1 == 1) %>% 
    mutate(
      Issue = "Grade 1 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 2
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_2 == 1 & opt_grade_2 == 1) %>% 
    mutate(
      Issue = "Grade 2 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 3
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_3 == 1 & opt_grade_3 == 1) %>% 
    mutate(
      Issue = "Grade 3 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 4
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_4 == 1 & opt_grade_4 == 1) %>% 
    mutate(
      Issue = "Grade 4 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 5
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_5 == 1 & opt_grade_5 == 1) %>% 
    mutate(
      Issue = "Grade 5 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 6
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_6 == 1 & opt_grade_6 == 1) %>% 
    mutate(
      Issue = "Grade 6 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 7
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_7 == 1 & opt_grade_7 == 1) %>% 
    mutate(
      Issue = "Grade 7 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 8
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_8 == 1 & opt_grade_8 == 1) %>% 
    mutate(
      Issue = "Grade 8 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 9
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_9 == 1 & opt_grade_9 == 1) %>% 
    mutate(
      Issue = "Grade 9 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 10
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_10 == 1 & opt_grade_10 == 1) %>% 
    mutate(
      Issue = "Grade 10 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 11
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_11 == 1 & opt_grade_11 == 1) %>% 
    mutate(
      Issue = "Grade 11 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
  # Grade 12
  grades_received_kits_and_operational_grades |>
    filter(Grades_Textbooks_12 == 1 & opt_grade_12 == 1) %>% 
    mutate(
      Issue = "Grade 12 is selected as the Grade which will benefit from Textbooks, but the in School_Operationlity sheet the Grade is reported as a non-operational Grade!",
      Question = "Grades_Textbooks",
      Old_value = Grades_Textbooks,
      Related_question = "C13A1(School_Operationality)",
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
    )
) %>% 
  mutate(tool = "Tool 2 - Light", sheet = "data", Old_value = as.character(Old_value))

# Logging issues in Tool 3 ------------------------------------------------
lc_tool3 <- plyr::rbind.fill(
  # Flagging for BLANK Meta columns
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  clean_data.tool3$data |>
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
  
  
  clean_data.tool3$data |>
    filter(is.na(Academic_Year)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Academic_Year",
      Old_value = as.character(Academic_Year),
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
  
  clean_data.tool3$data |>
    filter(is.na(Visit_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Visit_Type",
      Old_value = as.character(Visit_Type),
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
  # End
  # Flagging interview conducted before the first day of data collection
  clean_data.tool3$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps)),
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # Flagging duplicated site visit ID
  clean_data.tool3$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = "",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if the selected date in D2 is equal to survey date but no is selected in D3
  clean_data.tool3$Todays_Attendance_Detail |>
    left_join(
      clean_data.tool3$data |> select(KEY, starttime)
    , by = c("PARENT_KEY" = "KEY")) |>
    filter(format.Date(D2, "%Y-%m-%d") == format.Date(starttime, "%Y-%m-%d") & D3 == "No") |>  # FIXME: make sure to convert the D2 var to date in convert_numbers_to_date_module
    mutate(
      Issue = "The date in D2 is equal to survey date, but in D3 'No' is selected!",
      Question = "D2",
      Old_value = D2,
      Related_question = "D3",
      Related_value = D3,
      sheet = "Todays_Attendance_Detail"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if the selected date in D2 is not equal to survey date but yes is selected in D3
  clean_data.tool3$Todays_Attendance_Detail |>
    left_join(
      clean_data.tool3$data |> select(KEY, starttime)
      , by = c("PARENT_KEY" = "KEY")) |>
    filter(D1 == "Yes" & format.Date(D2, "%Y-%m-%d") != format.Date(starttime, "%Y-%m-%d") & D3 == "Yes") |> 
    mutate(
      Issue = "The date in D2 is not equal to survey date(starttimr), but in D3(confirmed D2 is equal to the day of interview) 'Yes' is selected!",
      Question = "D2",
      Old_value = as.character(D2),
      Related_question = "starttime",
      Related_value = starttime,
      sheet = "Todays_Attendance_Detail"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if the selected date in D2 is in future
  clean_data.tool3$Todays_Attendance_Detail |>
    left_join(
      clean_data.tool3$data |> select(KEY, starttime)
      , by = c("PARENT_KEY" = "KEY")) |>
    filter(format.Date(D2, "%Y-%m-%d") > format.Date(starttime, "%Y-%m-%d")) |>
    mutate(
      Issue = "The date in D2 is in the future!",
      Question = "D2",
      Old_value = as.character(D2),
      Related_question = "starttime",
      Related_value = starttime, 
      sheet = "Todays_Attendance_Detail"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  #Flagging if sum of enrolled male and female is not equal to total
  clean_data.tool3$Tool3_Grades_Repeat|>
    mutate(
      enrolled_m_f_total = rowSums(across(c("Tool3_N_Students_Enrolled_Grade_Male","Tool3_N_Students_Enrolled_Grade_Female")), na.rm = T)
    ) |>
    filter(Tool3_N_Students_Enrolled_Grade_Total != enrolled_m_f_total) |>
    mutate(
      Issue = "Sum of enrolled male and female is not equal to total .",
      Question = "Tool3_N_Students_Enrolled_Grade_Total",
      Old_value = Tool3_N_Students_Enrolled_Grade_Total,
      Related_question = "Tool3_N_Students_Enrolled_Grade_Male + Tool3_N_Students_Enrolled_Grade_Female",
      Related_value = paste0(Tool3_N_Students_Enrolled_Grade_Male, " + ", Tool3_N_Students_Enrolled_Grade_Female), 
      sheet = "Tool3_Grades_Repeat"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  #Flagging if sum of attended male and female is not equal to total
  clean_data.tool3$Tool3_Grades_Repeat|>
    mutate(
      attended_m_f_total = rowSums(across(c("Tool3_N_Students_Class_Male_Regular_Attendance","Tool3_N_Students_Class_Female_Regular_Attendance")), na.rm = T)
    ) |>
    filter(Tool3_N_Students_Class_Total_Regular_Attendance != attended_m_f_total) |>
    mutate(
      Issue = "Sum of attended male and female is not equal to total .",
      Question = "Tool3_N_Students_Class_Total_Regular_Attendance",
      Old_value = Tool3_N_Students_Class_Total_Regular_Attendance,
      Related_question = "Tool3_N_Students_Class_Male_Regular_Attendance + Tool3_N_Students_Class_Female_Regular_Attendance",
      Related_value = paste0(Tool3_N_Students_Class_Male_Regular_Attendance, " + ", Tool3_N_Students_Class_Female_Regular_Attendance), 
      sheet = "Tool3_Grades_Repeat"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  #Flagging if sum of permanent absent male and female is not equal to total
  clean_data.tool3$Tool3_Grades_Repeat|>
    mutate(
      absent_m_f_total = rowSums(across(c("Tool3_N_Students_Class_Male_Permanently_Absent","Tool3_N_Students_Class_Female_Permanently_Absent")), na.rm = T)
    ) |>
    filter(Tool3_N_Students_Class_Total_Permanently_Absent != absent_m_f_total) |>
    mutate(
      Issue = "Sum of permanent absent male and female is not equal to total .",
      Question = "Tool3_N_Students_Class_Total_Permanently_Absent",
      Old_value = Tool3_N_Students_Class_Total_Permanently_Absent,
      Related_question = "Tool3_N_Students_Class_Male_Permanently_Absent + Tool3_N_Students_Class_Female_Permanently_Absent",
      Related_value = paste0(Tool3_N_Students_Class_Male_Permanently_Absent, " + ", Tool3_N_Students_Class_Female_Permanently_Absent), 
      sheet = "Tool3_Grades_Repeat"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  clean_data.tool3$Tool3_Grades_Repeat %>% 
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
  
  clean_data.tool3$Tool3_Grades_Repeat %>% 
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
  
  clean_data.tool3$Tool3_Grades_Repeat %>% 
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
  
  clean_data.tool3$Tool3_Grades_Repeat %>% 
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
    ),
  
  
  clean_data.tool3$Tool3_Grades_Repeat |>
    mutate(EMIS_School_ID_CBE_KEY = as.character(EMIS_School_ID_CBE_KEY)) %>% 
    bind_rows(clean_data.tool0$Tool3_Grades_Repeat %>% 
                mutate(
                  EMIS_School_ID_CBE_KEY = as.character(EMIS_School_ID_CBE_KEY),
                  Tool3_Grades_Field_Label = as.character(Tool3_Grades_Field_Label),
                  KEY = as.character(KEY),
                  `SET-OF-Tool3_Grades_Repeat` = as.character(`SET-OF-Tool3_Grades_Repeat`)
                )
              ) |>
    select(-Tool3_Grades_Field_Label) |>
    left_join(kobo_tool.tool3$choices |>
                filter(list_name == "grades") |>
                rename(Tool3_Grades_Field_Label = label) |>
                mutate(value = as.integer(value)), by = c("Tool3_Grades_Field_Value" = "value")) |>
    mutate(
      key_for_dup = paste0(EMIS_School_ID_CBE_KEY, Tool3_Grades_Field_Label),
      duplicated_grades = case_when(
        duplicated(key_for_dup , fromLast = T) | duplicated(key_for_dup, fromLast = F) ~ "Duplicated",
        TRUE ~ "Okay"
      )
    ) |>
    filter(duplicated_grades == "Duplicated") |>
    mutate(
      Issue = "Same grade is reported more than once for same school (in both tools 3 and DE).",
      Question = "Tool3_Grades_Field_Label",
      Old_value = Tool3_Grades_Field_Label,
      Related_question = "EMIS_School_ID_CBE_KEY",
      Related_value = EMIS_School_ID_CBE_KEY, 
      sheet = "Tool3_Grades_Repeat"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ) |>
    arrange(EMIS_School_ID_CBE_KEY, Old_value),
  
  # NEW: ARTF comments
  # Flagging if headcounts do not match with Data Entry Tool ---- RUn it after class names are cleaned in tool 3
  # clean_data.tool3$Student_Headcount |>
  #   mutate(key_join = paste0(EMIS_School_ID_CBE_KEY, E1_Field_Label)) |>
  #   left_join(clean_data.tool0$Tool3_T2_Classes_VD |> mutate( key_join = paste0(EMIS_School_ID_CBE_KEY, Tool3_Class_Name_VD)) |>
  #               select(Tool3_Headcount_Conducted_Class, Tool3_Headcount_Male, Tool3_Headcount_Female, Tool3_Class_Name_VD, key_join),
  #             by = "key_join") |>
  # filter(is.na(Tool3_Headcount_Male) | is.na(Tool3_Headcount_Female)) |>
  #   mutate(
  #     Issue = "The school/class is missing in Data Entry VD sheet",
  #     Question = "E3A1",
  #     Old_value = E3A1,
  #     Related_question = "Tool3_Headcount_Male + Tool3_Headcount_Female (Data Entry)",
  #     Related_value = paste0(Tool3_Headcount_Male, " + ", Tool3_Headcount_Female),
  #     sheet = "Student_Headcount"
  #   ) |>
  #   select(
  #     any_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue,
  #     sheet
  #   ),
  
  clean_data.tool3$Student_Headcount |>
    mutate(key_join = paste0(EMIS_School_ID_CBE_KEY, E1_Field_Label)) |>
    left_join(clean_data.tool0$Tool3_T2_Classes_VD |> mutate( key_join = paste0(EMIS_School_ID_CBE_KEY, Tool3_Class_Name_VD)) |>
                select(Tool3_Headcount_Conducted_Class, Tool3_Headcount_Male, Tool3_Headcount_Female, key_join),
              by = "key_join") |> 
    filter(!is.na(as.numeric(Tool3_Headcount_Female)) & as.numeric(E3A2) != as.numeric(Tool3_Headcount_Female)) |>
    mutate(
      Issue = "The number of headcount for female students are different in tool3 and data entry tool",
      Question = "E3A2",
      Old_value = E3A2,
      Related_question = "Tool3_Headcount_Female (Data Entry)",
      Related_value = Tool3_Headcount_Female, 
      sheet = "Student_Headcount"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  clean_data.tool3$Student_Headcount |>
    mutate(key_join = paste0(EMIS_School_ID_CBE_KEY, E1_Field_Label)) |>
    left_join(clean_data.tool0$Tool3_T2_Classes_VD |> mutate( key_join = paste0(EMIS_School_ID_CBE_KEY, Tool3_Class_Name_VD)) |>
                select(Tool3_Headcount_Conducted_Class, Tool3_Headcount_Male, Tool3_Headcount_Female, key_join),
              by = "key_join") |> 
    filter(!is.na(as.numeric(Tool3_Headcount_Male)) & as.numeric(E3A1) != as.numeric(Tool3_Headcount_Male)) |>
    mutate(
      Issue = "The number of headcount for male students are different in tool3 and data entry tool",
      Question = "E3A1",
      Old_value = E3A1,
      Related_question = "Tool3_Headcount_Male (Data Entry)",
      Related_value = Tool3_Headcount_Male, 
      sheet = "Student_Headcount"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  clean_data.tool3$Student_Headcount %>% 
    mutate(
      total = rowSums(select(., E3_Regularly_Present, E3_Permanently_Absent), na.rm = T)
    ) %>% 
    filter(E3_Total_Students != total) %>% 
    mutate(
      Issue = "The total number of students differs from sum of Regularly present and Permanently absent students",
      Question = "E3_Total_Students",
      Old_value = E3_Total_Students,
      Related_question = "E3_Regularly_Present + E3_Permanently_Absent",
      Related_value = paste0(E3_Regularly_Present, " + ", E3_Permanently_Absent), 
      sheet = "Student_Headcount"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    )
) |>
  mutate(tool = "Tool 3 - Headcount", Old_value = as.character(Old_value))


# Logging issues in Tool 4 ------------------------------------------------
lc_tool4 <- plyr::rbind.fill(
  # Flagging for BLANK Meta columns
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  clean_data.tool4$data |>
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
  
  
  clean_data.tool4$data |>
    filter(is.na(Academic_Year)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Academic_Year",
      Old_value = as.character(Academic_Year),
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
  
  clean_data.tool4$data |>
    filter(is.na(Visit_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Visit_Type",
      Old_value = as.character(Visit_Type),
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
  # End
  # Flagging interview conducted before the first day of data collection
  clean_data.tool4$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
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
  
  # Flagging if the grades selected in D8 but reported nonoperational in C13A1 of tool 1
  clean_data.tool4$data |>
    select(any_of(meta_cols), starts_with("D8"), -D8, KEY) |>
    pivot_longer(cols = D8_1:D8_12, names_to = "grade") |>
    filter(value == 1) |>
    mutate(
      grade = str_extract(grade, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grade)
    ) |>
    select(-value) |>
    left_join(
      clean_data.tool2$School_Operationality |>
        filter(!is.na(Grade) & Grade != "") |>
        mutate(Grade_ID_calc = paste0(Site_Visit_ID,"-",Grade)) |> 
        filter(Grade_ID_calc != "" & !is.na(Grade_ID_calc) & !(duplicated(Grade_ID_calc, fromLast = T) | duplicated(Grade_ID_calc, fromLast = F))) |>
        select(C13A1, Grade_ID_calc),
      by = "Grade_ID_calc"
    ) |>
    filter(C13A1 == "No") |>
    mutate(
      Issue = "The selected grade in D8 is reported non-operational in question C13A1 of tool 2!",
      Question = "D8",
      Old_value = grade,
      Related_question = "C13A1 (Tool 2) AND Grade (Tool 2)",
      Related_value = paste0(C13A1," AND ",Grade_ID_calc)
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
  
  clean_data.tool4$data |>
    filter(F12_Subjects_Not_Being_Taught_1 == 1) |>
    mutate(
      Issue = "Please confirm that 'Islamic Studies' subject is not being taught!",
      Question = "F12_Subjects_Not_Being_Taught_1",
      Old_value = F12_Subjects_Not_Being_Taught_1,
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
  
  # Removed for CBE DC
  clean_data.tool4$data |>
    filter(G4_Minutes >= 120) |>
    mutate(
      Issue = "Please confirm the duration it takes to get to school!",
      Question = "G4_Minutes",
      Old_value = G4_Minutes,
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
  
  clean_data.tool4$data |>
    filter(F2_N >= 6) |>
    mutate(
      Issue = "Please confirm the number of additional subjects being taught at present!",
      Question = "F2_N",
      Old_value = F2_N,
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
    )
) |> 
  mutate(tool = "Tool 4 - Teacher", sheet = "data", Old_value = as.character(Old_value))

# Removed for CBE DC
lc_tool4.add_subj <- plyr::rbind.fill(
  clean_data.tool4$Additional_Subjects |>
    mutate(
      key_for_dup = paste0(EMIS_School_ID_CBE_KEY, F2_Subject_Name)
    ) |>
    filter(duplicated(key_for_dup, fromLast = T) | duplicated(key_for_dup, fromLast = F)) |>
    mutate(
      Issue = "The subject name is reported more than once for same school!",
      Question = "F2_Subject_Name",
      Old_value = F2_Subject_Name,
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
  mutate(tool = "Tool 4 - Teacher", sheet = "Additional_Subjects", Old_value = as.character(Old_value))


# Logging issues in Tool 5 ------------------------------------------------
lc_tool5 <- plyr::rbind.fill(
  # Flagging for BLANK Meta columns
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  clean_data.tool5$data |>
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
  
  
  clean_data.tool5$data |>
    filter(is.na(Academic_Year)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Academic_Year",
      Old_value = as.character(Academic_Year),
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
  
  clean_data.tool5$data |>
    filter(is.na(Visit_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Visit_Type",
      Old_value = as.character(Visit_Type),
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
  # End
  # Flagging interview conducted before the first day of data collection
  clean_data.tool5$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
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
  
  # Flagging duplicated site visit ID
  clean_data.tool5$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
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
  
  # Flagging if all type of Toilets (Male, Female, Unisex) is reported 0 but also reported Toilets are under construction
  clean_data.tool5$data |>
    filter(C5 == "The toilets are under construction" & (Coalesce(C6_Male) + Coalesce(C6_Female) + Coalesce(C6_Unisex)) <= 0) |> 
    mutate(
      Issue = "All type of Toilets (Male, Female, Unisex) is reported 0 but also reported Toilets are under construction",
      Question = "C5",
      Old_value = C5,
      Related_question = "C6_Male + C6_Female + C6_Unisex",
      Related_value = as.character(Coalesce(C6_Male) + Coalesce(C6_Female) + Coalesce(C6_Unisex))
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
  
  # Flagging if all type of Usable and non-usable Toilets (Male, Female, Unisex) is reported 0
  clean_data.tool5$data |>
    filter((C9_1 + C9_2 + C9_3) <= 0) |> 
    mutate(
      Issue = "All type of Usable and non-Usable Toilets (Male, Female, Unisex) is reported 0",
      Question = "C9_1 + C9_2 + C9_3",
      Old_value = as.character(C9_1 + C9_2 + C9_3),
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
  
  clean_data.tool5$data |>
    filter(C9_3 == 0) |> 
    mutate(
      Issue = "Please confirm the overall number of Unisex latrines.",
      Question = "C9_3",
      Old_value = as.character(C9_3),
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
    )
  
  
) |> 
  mutate(tool = "Tool 5 - WASH", sheet = "data", Old_value = as.character(Old_value))

# Logging issues in Tool 6 ------------------------------------------------
lc_tool6 <- plyr::rbind.fill(
  # Flagging for BLANK Meta columns
  clean_data.tool6$data |>
    filter(is.na(Sample_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Sample_Type",
      Old_value = as.character(Sample_Type),
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
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
  
  clean_data.tool6$data |>
    filter(is.na(Visit_Type)  & Sample_Type == "Public School") |>
    mutate(
      Issue = "Blank value!",
      Question = "Visit_Type",
      Old_value = as.character(Visit_Type),
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
  # End
  # Flagging interview conducted before the first day of data collection - Public School
  clean_data.tool6$data |>
    filter(Sample_Type == "Public School" & starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
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
  
  # Flagging interview conducted before the first day of data collection - CBE
  clean_data.tool6$data |>
    filter(Sample_Type == "CBE" & starttime < janitor::convert_to_date(data_collection_start_date_cbe)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_cbe",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_cbe))
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
  
  
  # Duplicated combination of Respondent Name and first Phone Number for a Site Visit ID
  clean_data.tool6$data |>
    mutate(
      parent_id = paste(Sample_Type, Site_Visit_ID, Respondent_Name, Respondent1_Phone_Number, sep = "-")
    ) |>
    filter(duplicated(parent_id, fromLast = T) | duplicated(parent_id, fromLast = F)) |>
    mutate(
      Issue = "The combination of Respondent Name and his/her first phone number is duplicated for the Site Visit ID and sample type",
      Question = "",
      Old_value = "",
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
  
  # Flagging if the household size reported 1 or less
  clean_data.tool6$data |>
    filter(B3 <= 1 | is.na(B3)) |>
    mutate(
      Issue = "The Household size is reported less than or equal to 1!",
      Question = "B3",
      Old_value = B3,
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
  
  # clean_data.tool6$data |>
  #   filter(B3 >= 40) |>
  #   mutate(
  #     Issue = "The Household size is reported a bit large - please confirm the value!",
  #     Question = "B3",
  #     Old_value = B3,
  #     Related_question = "",
  #     Related_value = ""
  #   ) |>
  #   select(
  #     any_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # Flagging if the HH members involved in income earning is reported more than HH members
  clean_data.tool6$data |>
    filter(B4 > B3) |>
    mutate(
      Issue = "The Household members involved in income earning is reported more than Household members!",
      Question = "B4",
      Old_value = B4,
      Related_question = "B3",
      Related_value = B3
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
  
  # Flagging if the HH members involved in income earning is reported 0 but also an occupation is selected
  clean_data.tool6$data |>
    filter(B4 <= 0 & B5 %in% c("Daily labourer (construction)","Driver","Farmer","Health care worker","Shop owner","Trader","Teacher", "Other")) |>
    mutate(
      Issue = "The Household members involved in income earning is reported 0 but also an occupation is selected!",
      Question = "B4",
      Old_value = B4,
      Related_question = "B5",
      Related_value = B5
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
  
  # Flagging if the HH members involved in income earning is reported more than 0 but also reported no occupation
  # clean_data.tool6$data |>
  #   filter(B4 > 0 & B5 %in% c("No occupation and live based on remittance","No occupation and live based on humanitarian assistance")) |>
  #   mutate(
  #     Issue = "The Household members involved in income earning is reported more than 0 but also reported no occupation for question B5!",
  #     Question = "B4",
  #     Old_value = B4,
  #     Related_question = "B5",
  #     Related_value = B5
  #   ) |>
  #   select(
  #     any_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # Flagging if the HH members involved in income earning is reported 0 but also reported a monthly income
  clean_data.tool6$data |>
    filter(B4 <= 0 & (B6 > 0 & B6 != 8888 & B6 != 9999)) |>
    mutate(
      Issue = "The Household members involved in income earning is reported 0 but also reported a monthly income!",
      Question = "B4",
      Old_value = B4,
      Related_question = "B6",
      Related_value = B6
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
  
  # Flagging if Reported Subject has been added but reported 0 for the number of subjects
  clean_data.tool6$data |>
    filter(D3_2 == 1 & D4_N <= 0) |>
    mutate(
      Issue = "Reported Subject has been added but also reported 0 for the number of subjects",
      Question = "D4_N",
      Old_value = D4_N,
      Related_question = "D3",
      Related_value = D3
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
  
  # Flagging if More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook
  clean_data.tool6$data |>
    filter(E3_3 == 1 & E5_2 == 1) |>
    mutate(
      Issue = "More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook",
      Question = "E3",
      Old_value = E3,
      Related_question = "E5",
      Related_value = E5
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
  mutate(tool = "Tool 6 - Parent", sheet = "data", Old_value = as.character(Old_value))


# Logging issues in Tool 7 ------------------------------------------------
lc_tool7 <- plyr::rbind.fill(
  # Flagging for BLANK Meta columns
  clean_data.tool7$data |>
    filter(is.na(Sample_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Sample_Type",
      Old_value = as.character(Sample_Type),
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
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
  
  clean_data.tool7$data |>
    filter(is.na(Visit_Type) & Sample_Type == "Public School") |>
    mutate(
      Issue = "Blank value!",
      Question = "Visit_Type",
      Old_value = as.character(Visit_Type),
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
  # End
  # Flagging interview conducted before the first day of data collection - Public School
  clean_data.tool7$data |>
    filter(Sample_Type == "Public School" & starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
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
  
  # Flagging interview conducted before the first day of data collection - CBE
  clean_data.tool7$data |>
    filter(Sample_Type == "CBE" & starttime < janitor::convert_to_date(data_collection_start_date_cbe)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_cbe",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_cbe))
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
  
  # Duplicated combination of Respondent Name and first Phone Number for a Site Visit ID
  clean_data.tool7$data |>
    mutate(
      shura_mem_id = paste(Sample_Type, Site_Visit_ID, B5, Respondent1_Phone_Number, sep = "-")
    ) |>
    filter(duplicated(shura_mem_id, fromLast = T) | duplicated(shura_mem_id, fromLast = F)) |>
    mutate(
      Issue = "The combination of Respondent Name and his/her first phone number is duplicated for the Site Visit ID and sample type",
      Question = "",
      Old_value = "",
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
  
  # Flagging if confirmed s/he is a Shura member but also reported the school/CBE never had a Shura
  clean_data.tool7$data |>
    filter(B8 == "Yes" &  C0 == "No, the school/CBE never had a shura") |>
    mutate(
      Issue = "It is confirmed that s/he is a Shura member but also reported the school/CBE never had a Shura",
      Question = "B8",
      Old_value = B8,
      Related_question = "C0",
      Related_value = C0
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
  
  # Flagging if Reported Subject has been added but reported 0 for the number of subjects
  clean_data.tool7$data |>
    filter(E2_2 == 1 & E4_N <= 0) |>
    mutate(
      Issue = "Reported Subject has been added but also reported 0 for the number of subjects",
      Question = "E4_N",
      Old_value = as.character(E4_N),
      Related_question = "E2",
      Related_value = E2
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
  
  # Flagging if More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook
  clean_data.tool7$data |>
    filter(F4_2 == 1 & F2_3 == 1) |>
    mutate(
      Issue = "More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook",
      Question = "F4",
      Old_value = as.character(F4),
      Related_question = "F2",
      Related_value = F2
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
  
  clean_data.tool7$data |>
    filter(E7 == "Using none of the same books") |>
    mutate(
      Issue = "Please confirm the value 'Using none of the same books'",
      Question = "E7",
      Old_value = as.character(E7),
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
  
  # New for R4
  clean_data.tool7$data %>%
    filter(Sample_Type == "Public School") %>%
    left_join(
      clean_data.tool1$data %>% select(EMIS_School_ID_CBE_KEY, J1.tool1 =  J1) %>% mutate(EMIS_School_ID_CBE_KEY = as.character(EMIS_School_ID_CBE_KEY)), by = "EMIS_School_ID_CBE_KEY"
    ) %>%
    filter(C1 != J1.tool1) %>%
    mutate(
      Issue = "The response to whether the school has an active shura or not is inconsistent across tool 7(C1) and tool 1(J1)",
      Question = "C1",
      Old_value = as.character(C1),
      Related_question = "J1(Tool1)",
      Related_value = J1.tool1
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
  
  clean_data.tool7$data %>%
    filter(Sample_Type == "CBE") %>% 
    left_join(
      clean_data.tool8$data %>% select(EMIS_School_ID_CBE_KEY, V1.tool8 =  V1) %>% mutate(EMIS_School_ID_CBE_KEY = as.character(EMIS_School_ID_CBE_KEY)), by = "EMIS_School_ID_CBE_KEY"
    ) %>% 
    filter((C1 == "Yes" & V1.tool8 %in% c("Yes, but no longer active","No")) | (C1 == "No" & V1.tool8 == "Yes")) %>% 
    mutate(
      Issue = "The response to whether the CBE has an active shura or not is inconsistent across tool 7(C1) and tool 8(V1)",
      Question = "C1",
      Old_value = as.character(C1),
      Related_question = "V1(Tool8)",
      Related_value = V1.tool8
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
  mutate(tool = "Tool 7 - Shura", sheet = "data", Old_value = as.character(Old_value))


lc_tool7.list_members <- plyr::rbind.fill(
  # Flagging if number the sum of Male and Female for the shura postion is reported 0 or less
  clean_data.tool7$C6_list_members |>
    filter(Coalesce(C6_Number_Male) + Coalesce(C6_Number_Female) <= 0) |>
    mutate(
      Issue = paste0("The sum of male and female members for the shura position ", Field_Label, " is reported 0 or less"),
      Question = "C6_Number_Male",
      Old_value = as.character(C6_Number_Male),
      Related_question = "C6_Number_Female",
      Related_value = as.character(C6_Number_Female)
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
  mutate(tool = "Tool 7 - Shura", sheet = "C6_list_members", Old_value = as.character(Old_value))


# Logging issues in Tool 8 ------------------------------------------------
lc_tool8 <- plyr::rbind.fill(
  # Flagging for BLANK Meta columns
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  clean_data.tool8$data |>
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
  
  
  clean_data.tool8$data |>
    filter(is.na(Academic_Year)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Academic_Year",
      Old_value = as.character(Academic_Year),
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
  
  clean_data.tool8$data |>
    filter(is.na(IP_Name)) |>
    mutate(
      Issue = "Blank value!",
      Question = "IP_Name",
      Old_value = as.character(IP_Name),
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
  
  clean_data.tool8$data |>
    filter(is.na(Type_of_CBE)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Type_of_CBE",
      Old_value = as.character(Type_of_CBE),
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
  
  clean_data.tool8$data |>
    filter(is.na(Entity_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Entity_Type",
      Old_value = as.character(Entity_Type),
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
  # End
  
  # Flagging interview conducted before the first day of data collection
  clean_data.tool8$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_cbe)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_cbe",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_cbe))
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
  
  # Flagging duplicated site visit ID
  clean_data.tool8$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
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
  
  # Flagging if Enumerator observed that CBE is closed temporarily but respondent reported permanent closure. 
  clean_data.tool8$data |>
    filter(B7 %in% c("No, it is closed temporarily", "No, it is closed for today") & C7 == "Permanent [closed since beginning of the academic year]") |>
    mutate(
      Issue = "Enumerator observed that CBE is closed temporarily but respondent reported permanent closure. ",
      Question = "B7",
      Old_value = B7,
      Related_question = "C7",
      Related_value = C7
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
  
  # Flagging if type of CBE does not match in questions A1 and D7 
  clean_data.tool8$data |>
    filter((D7 == "ALC (covering more than one grade in one academic year)" & A1 != "ALC (covering more than one grade in one academic year)") |
             (D7 == "CBC (covering one grade in one academic year)" & A1 != "CBC (covering one grade in one academic year)") |
             (D7 == "CBC and ALC" & A1 != "Both CBC and ALC")) |>
    mutate(
      Issue = "Type of CBE does not match in questions A1 and D7 ",
      Question = "D7",
      Old_value = D7,
      Related_question = "A1",
      Related_value = A1
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
  
  # Flagging if ALC level is inconsistent with Grades actively being taught in CBE
  clean_data.tool8$data |>
    filter((D9_1 == 1 & (D8_1 == 0 | D8_2 == 0)) | (D9_2 == 1 & (D8_3 == 0 | D8_4 == 0)) | (D9_3 == 1 & (D8_5 == 0 | D8_6 == 0)) ) |>
    mutate(
      Issue = "ALC level is inconsistent with Grades actively being taught in CBE",
      Question = "D9",
      Old_value = D9,
      Related_question = "D8",
      Related_value = D8
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
  
  # Flagging if The number of classes is reported 0 or less.
  clean_data.tool8$data |>
    filter(E2 <= 0) |>
    mutate(
      Issue = "The number of classes is reported 0 or less.",
      Question = "E2",
      Old_value = as.character(E2),
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
  
  # Flagging if The Number of Male teacher is reported less than 0.
  clean_data.tool8$data |>
    filter(E7 < 0) |>
    mutate(
      Issue = "The Number of Male teacher is reported less than 0.",
      Question = "E7",
      Old_value = E7,
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
  # Flagging if The Number of Female teacher is reported less than 0.
  clean_data.tool8$data |>
    filter(E8 < 0) |>
    mutate(
      Issue = "The number of Female teacher is reported less than 0.",
      Question = "E8",
      Old_value = as.character(E8),
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
  # Flagging if the number of number of absent teacher is equal to 0
  clean_data.tool8$data |>
    filter(E11 == "Yes" & (Coalesce(E12) + Coalesce(E13)) <= 0) |>
    mutate(
      Issue = "It is reported that there are other teacher at the CBE other than who are present but the sum male and female other teachers are reported 0.",
      Question = "E11",
      Old_value = E11,
      Related_question = "E12 - E13",
      Related_value = paste0(E12,"-",E13)
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
  # Flagging if there are other adult present during the observation but the number is reported 0
  clean_data.tool8$data |>
    filter(E16 == "Yes" & E17 <= 0) |>
    mutate(
      Issue = "It is reported that there are other adult present during the observation but the number is reported 0.",
      Question = "E16",
      Old_value = E16,
      Related_question = "E17",
      Related_value = E17
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
  
  clean_data.tool8$data|>
    filter(V16 %in% c("No", "I don’t know")) |>
    mutate(
      Issue = "Please confirm the value",
      Question = "V16",
      Old_value = as.character(V16),
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
  
  clean_data.tool8$data|>
    filter(V11 %in% c("No")) |>
    mutate(
      Issue = "Please confirm the value",
      Question = "V11",
      Old_value = as.character(V11),
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
  
  clean_data.tool8$data|>
    filter(V1 %in% c("No")) |>
    mutate(
      Issue = "Please confirm the value",
      Question = "V1",
      Old_value = as.character(V1),
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
  
  # New for R4
  clean_data.tool8$data %>% 
    filter(D12 == "No" & V4 %in% c("Hub school teacher", "Hub school principle")) %>% 
    mutate(
      Issue = "The CBE is not linked with any hub school but its officials are part of CBE shura",
      Question = "D12",
      Old_value = as.character(D12),
      Related_question = "V4",
      Related_value = V4
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
  
  # clean_data.tool8$data %>% 
  #   filter(W3_1 == 1 & W14 == "No") %>% 
  #   mutate(
  #     Issue = "Hotline Phone number is reported as one of complaint channels being used (W3), while for question W14 (Is there a GRM hotline/phone number visible on site) it is reported No",
  #     Question = "W3",
  #     Old_value = as.character(W3),
  #     Related_question = "W14",
  #     Related_value = W14
  #   ) |> 
  #   select(
  #     any_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # clean_data.tool8$data %>% 
  #   filter(W3_1 == 0 & W14 == "Yes") %>% 
  #   mutate(
  #     Issue = "Hotline Phone number isn't reported as one of complaint channels being used (W3), while for question W14 (Is there a GRM hotline/phone number visible on site) it is reported Yes",
  #     Question = "W3",
  #     Old_value = as.character(W3),
  #     Related_question = "W14",
  #     Related_value = W14
  #   ) |> 
  #   select(
  #     any_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # clean_data.tool8$data %>% 
  #   filter(W5_6 == 1 & W17 == "No") %>% 
  #   mutate(
  #     Issue = "It is reported that complaints are submitted through Email (W5), while for question W17 (Is there a GRM Email visible on site) it is reported No",
  #     Question = "W5",
  #     Old_value = as.character(W5),
  #     Related_question = "W17",
  #     Related_value = W17
  #   ) |> 
  #   select(
  #     any_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # clean_data.tool8$data %>% 
  #   filter(W5_6 == 0 & W17 == "Yes") %>% 
  #   mutate(
  #     Issue = "It isn't reported that complaints are submitted through Email (W5), while for question W17 (Is there a GRM Email visible on site) it is reported Yes",
  #     Question = "W5",
  #     Old_value = as.character(W5),
  #     Related_question = "W17",
  #     Related_value = W17
  #   ) |> 
  #   select(
  #     any_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # clean_data.tool8$data %>% 
  #   filter(W5_5 == 1 & W20 == "No") %>% 
  #   mutate(
  #     Issue = "It is reported that complaints are submitted through Complaint Box (W5), while for question W20 (Is there a complaint box (or any receptable for people to make comments on the class)) it is reported No",
  #     Question = "W5",
  #     Old_value = as.character(W5),
  #     Related_question = "W20",
  #     Related_value = W20
  #   ) |> 
  #   select(
  #     any_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # clean_data.tool8$data %>% 
  #   filter(W5_5 == 0 & W20 == "Yes") %>% 
  #   mutate(
  #     Issue = "It isn't reported that complaints are submitted through Complaint Box (W5), while for question W20 (Is there a complaint box (or any receptable for people to make comments on the class)) it is reported Yes",
  #     Question = "W5",
  #     Old_value = as.character(W5),
  #     Related_question = "W20",
  #     Related_value = W20
  #   ) |> 
  #   select(
  #     any_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   )
  
) |> 
  mutate(tool = "Tool 8 - Class", sheet = "data", Old_value = as.character(Old_value))

lc_tool8.classes <- plyr::rbind.fill(
  # Flagging if Selected Class Type does not match with Class Type in the main Sheet
  clean_data.tool8$Classes |>
    left_join(select(clean_data.tool8$data, D7.main_sheet = D7, KEY), by = c("PARENT_KEY" = "KEY")) |>
    filter(Class_Type == "ALC (covering more than one grade in one academic year)" & D7.main_sheet == "CBC (covering one grade in one academic year)" | 
           Class_Type == "CBC (covering one grade in one academic year)" & D7.main_sheet == "ALC (covering more than one grade in one academic year)") |>
    mutate(
      Issue = "The Class type for the class does not match with Type of CBE in question D7.",
      Question = "Class_Type",
      Old_value = Class_Type,
      Related_question = "D7.main_sheet",
      Related_value = D7.main_sheet
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
  mutate(tool = "Tool 8 - Class", sheet = "Classes", Old_value = as.character(Old_value))

lc_tool8.attendance_record <- plyr::rbind.fill(
  # Flagging if The date for the attendance sheet equal to the interview date is confirmed, but also there is a difference between those dates
  clean_data.tool8$Section_2_2_3_Attendance_Rec... |>
    left_join(
      clean_data.tool8$data |> select(KEY, starttime), by = c("PARENT_KEY" = "KEY")  
    ) |>
    filter(E21 == "Yes" & janitor::convert_to_date(E20) != janitor::convert_to_date(starttime)) |>
    mutate(
      Issue = "The date for the attendance sheet equal to the interview date is confirmed, but also there is a difference between those dates.",
      Question = "E20",
      Old_value = E20,
      Related_question = "starttime",
      Related_value = as.character(janitor::convert_to_date(starttime))
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
  mutate(tool = "Tool 8 - Class", sheet = "Section_2_2_3_Attendance_Rec...", Old_value = as.character(Old_value))

lc_tool8.headcount <- plyr::rbind.fill(
  #Flag if The sum of Male and Student conducted headcount is 0 or less
  clean_data.tool8$Section_2_2_4_Headcount |>
    mutate(
      total_m_f_headcount = rowSums(across(c("Headcount_Male_Students", "Headcount_Female_Students")), na.rm = T)
    ) |>
    filter(total_m_f_headcount <= 0) |>
    mutate(
      Issue = "The sum of male and female students conducted headcount is reported 0 or less.",
      Question = "Headcount_Male_Students",
      Old_value = Headcount_Male_Students,
      Related_question = "Headcount_Female_Students",
      Related_value = Headcount_Female_Students
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
  mutate(tool = "Tool 8 - Class", sheet = "Section_2_2_4_Headcount", Old_value = as.character(Old_value))


lc_tool8.v_list_member <- plyr::rbind.fill(
  # Flagging if the sum of both Male and Female members is reported 0
  clean_data.tool8$V_list_of_all_members |>
    mutate(total_m_f_member = rowSums(across(c("V_Male_Member","V_Female_Member")), na.rm = T)) |>
    filter(total_m_f_member <= 0) |>
    mutate(
      Issue = "The sum of both Male and Female members is reported 0.",
      Question = "V_Male_Member",
      Old_value = V_Male_Member,
      Related_question = "V_Female_Member",
      Related_value = V_Female_Member
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
  mutate(tool = "Tool 8 - Class", sheet = "V_list_of_all_members", Old_value = as.character(Old_value))



# Logging issues in Tool 9 ------------------------------------------------
lc_tool9 <- plyr::rbind.fill(
  # Flagging for BLANK Meta columns
  clean_data.tool9$data |>
    filter(is.na(SubmissionDate)) |>
    mutate(
      Issue = "Blank value!",
      Question = "SubmissionDate",
      Old_value = as.character(SubmissionDate),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  clean_data.tool9$data |>
    filter(is.na(starttime)) |>
    mutate(
      Issue = "Blank value!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  clean_data.tool9$data |>
    filter(is.na(endtime)) |>
    mutate(
      Issue = "Blank value!",
      Question = "endtime",
      Old_value = as.character(endtime),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  clean_data.tool9$data |>
    filter(is.na(Site_Visit_ID)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Site_Visit_ID",
      Old_value = as.character(Site_Visit_ID),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  clean_data.tool9$data |>
    filter(is.na(Province)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Province",
      Old_value = as.character(Province),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  clean_data.tool9$data |>
    filter(is.na(District)) |>
    mutate(
      Issue = "Blank value!",
      Question = "District",
      Old_value = as.character(District),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  clean_data.tool9$data |>
    filter(is.na(Region)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Region",
      Old_value = as.character(Region),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  clean_data.tool9$data |>
    filter(is.na(Area_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Area_Type",
      Old_value = as.character(Area_Type),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),

  clean_data.tool9$data |>
    filter(is.na(Academic_Year)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Academic_Year",
      Old_value = as.character(Academic_Year),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  clean_data.tool9$data |>
    filter(is.na(IP_Name)) |>
    mutate(
      Issue = "Blank value!",
      Question = "IP_Name",
      Old_value = as.character(IP_Name),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  clean_data.tool9$data |>
    filter(is.na(Entity_Type)) |>
    mutate(
      Issue = "Blank value!",
      Question = "Entity_Type",
      Old_value = as.character(Entity_Type),
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  # End
  # Flagging interview conducted before the first day of data collection
  clean_data.tool9$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_cbe)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_cbe",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_cbe)),
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  # Flagging duplicated site visit ID
  clean_data.tool9$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = "",
      tool = "Tool 9 - IP",
      sheet = "data"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ) |>
    arrange(Old_value),
  
  # Flagging if Sum of Female and Male of GRC is reported 0
  clean_data.tool9$data |>
    mutate(
      a12_m_f_number = rowSums(across(c("A12_Female_Numbers", "A12_Male_Numbers")), na.rm = T)
    ) |>
    filter(a12_m_f_number <= 0) |>
    mutate(
      Issue = "Sum of Female and Male of GRC is reported 0!",
      Question = "A12_Female_Numbers",
      Old_value = A12_Female_Numbers,
      Related_question = "A12_Male_Numbers",
      Related_value = A12_Male_Numbers,
      tool = "Tool 9 - IP",
      sheet = "Questions_Repeat"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  # Flagging if Sum of Female and Male of GRC for women is reported 0
  clean_data.tool9$data |>
    filter(A13 == "Yes") %>% 
    mutate(
      a12_m_f_member = rowSums(across(c("A14_Female_Numbers", "A14_Male_Numbers")), na.rm = T)
    ) |>
    filter(a12_m_f_member <= 0) |>
    mutate(
      Issue = "Sum of Female and Male of GRC for women is reported 0!",
      Question = "A14_Female_Numbers",
      Old_value = A14_Female_Numbers,
      Related_question = "A14_Male_Numbers",
      Related_value = A14_Male_Numbers,
      tool = "Tool 9 - IP",
      sheet = "Questions_Repeat"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    ),
  
  #NEW in R5
  #Flag if The total number of male and female students enrolled at this CBE is less than that CBE's headcount of male and female students
  clean_data.tool9$Questions_Repeat |>
    left_join(
      clean_data.tool8$Section_2_2_4_Headcount |>
        mutate(
          total_headcount_m_f = rowSums(across(c("Headcount_Male_Students", "Headcount_Female_Students")), na.rm  = T)
        ) |>
        group_by(CBE_EMIS_School_ID_CBE_KEY = EMIS_School_ID_CBE_KEY) |>
        summarise(
          total_headcount_student = sum(total_headcount_m_f, na.rm = T)
        ) |> ungroup() , by = c("CBE_EMIS_School_ID_CBE_KEY")) |>
    filter((E3_Male + E3_Female) < total_headcount_student) |>
    mutate(
      Issue = "The total number of male and female students enrolled at this CBE is less than that CBE's headcount of male and female students.",
      Question = "E3_Male + E3_Female",
      Old_value = as.character(E3_Male+E3_Female),
      Related_question = "total_headcount_student (Headcount_Male_Students + Headcount_Female_Students) Tool 8",
      Related_value = total_headcount_student,
      tool = "Tool 9 - IP",
      sheet = "Questions_Repeat"
    ) |> 
    select(
      any_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    )
) |> 
  mutate(Old_value = as.character(Old_value))

# Logic Check KDR ------------------------------------------------------------
# source("R/logical_checks_kdr.R")

# Combination of all tools logic checks --------------------------------------
Logic_check_result <- plyr::rbind.fill(
  lc_tool1,
  lc_tool2.headmaster_operationality_and_other,
  lc_tool2.shift_operationality_and_other,
  lc_tool2.shift,
  operational_grades_not_reported_in_shifts_log,
  lc_tool2.school_operationality,
  lc_grades_received_kits_and_operational_grades, # New in R5
  lc_tool2,
  lc_tool3,
  lc_tool4,
  lc_tool4.add_subj,
  lc_tool5,
  lc_tool6,
  lc_tool7,
  lc_tool7.list_members,
  lc_tool8,
  lc_tool8.classes,
  lc_tool8.attendance_record,
  lc_tool8.headcount,
  lc_tool8.v_list_member,
  lc_tool9
  # Logic_check_result_kdr # Removed for CBE DC
)

rm(list = ls(pattern = "lc_tool.*"))


# Tobe added for the next round - Tool 3 headcount sheet
# E3_Total_Students = 	E3_Regularly_Present +	E3_Permanently_Absent


source("R/data_entry_logic_checks.R")

# rm(Logic_check_result_kdr)
