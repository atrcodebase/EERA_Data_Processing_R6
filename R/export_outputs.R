# Exporting unsterilized version of clean datasets -----------------------------
# Removing redundant repeat sheet from KDR data ---------------------
clean_data.tool1_kdr$School_Operationality <- NULL
clean_data.tool1_kdr$Shifts_Detail <- NULL
clean_data.tool1_kdr$Headmasters <- NULL

clean_data.tool1_kdr_for_client_ulabeled$School_Operationality <- NULL
clean_data.tool1_kdr_for_client_ulabeled$Shifts_Detail <- NULL
clean_data.tool1_kdr_for_client_ulabeled$Headmasters <- NULL

clean_data.tool1_kdr_for_client$School_Operationality <- NULL
clean_data.tool1_kdr_for_client$Shifts_Detail <- NULL
clean_data.tool1_kdr_for_client$Headmasters <- NULL

# file.edit("./R/add_qa_status.R")
write.xlsx(clean_data.tool0, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool0_EERA_R6_PS_CBE_DE_Tool_", Sys.Date(),".xlsx"))

write.xlsx(clean_data.tool1_kdr, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool1_KDR_EERA_R6_PS_cleaned_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool1, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool1_EERA_R6_PS_cleaned_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool2_EERA_R6_PS_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool3_EERA_R6_PS_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool4_EERA_R6_PS_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool5_EERA_R6_PS_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool6, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool6_EERA_R6_PS_CBE_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool7, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool7_EERA_R6_PS_CBE_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool8, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool8_EERA_R6_CBE_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool9, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool9_EERA_R6_CBE_", Sys.Date(),".xlsx"))

# Exporting unsterilized version of clean datasets -----------------------------
write.xlsx(clean_data.tool0_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool0_EERA_R6_PSCBE_DE_Unlabeled_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool1_kdr_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool1_K_EERA_R6_cleaned_Unlabeled_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool1_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool1_EERA_R6_PS_cleaned_Unlabeled_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool2_EERA_R6_PS_Unlabeled_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool3_EERA_R6_PS_Unlabeled_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool4_EERA_R6_PS_Unlabeled_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool5_EERA_R6_PS_Unlabeled_", Sys.Date(),".xlsx"))

# Public School
clean_data.tool6_PS_for_client_ulabeled <- clean_data.tool6_for_client_ulabeled
clean_data.tool6_PS_for_client_ulabeled$data <- clean_data.tool6_PS_for_client_ulabeled$data |>
filter(Sample_Type == "Public School")

clean_data.tool6_PS_for_client_ulabeled$Subjects_Added <- clean_data.tool6_PS_for_client_ulabeled$Subjects_Added |>
  filter(PARENT_KEY %in% clean_data.tool6_PS_for_client_ulabeled$data$KEY)

write.xlsx(clean_data.tool6_PS_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool6_EERA_R6_PS_Unlabeled_", Sys.Date(),".xlsx"))

# CBE
clean_data.tool6_CBE_for_client_ulabeled <- clean_data.tool6_for_client_ulabeled
clean_data.tool6_CBE_for_client_ulabeled$data <- clean_data.tool6_CBE_for_client_ulabeled$data |>
  filter(Sample_Type == "CBE")

clean_data.tool6_CBE_for_client_ulabeled$Subjects_Added <- clean_data.tool6_CBE_for_client_ulabeled$Subjects_Added |>
  filter(PARENT_KEY %in% clean_data.tool6_CBE_for_client_ulabeled$data$KEY)

write.xlsx(clean_data.tool6_CBE_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool6_EERA_R6_CBE_Unlabeled_", Sys.Date(),".xlsx"))

# Public School
clean_data.tool7_PS_for_client_ulabeled <- clean_data.tool7_for_client_ulabeled
clean_data.tool7_PS_for_client_ulabeled$data <- clean_data.tool7_PS_for_client_ulabeled$data |>
  filter(Sample_Type == "Public School")

clean_data.tool7_PS_for_client_ulabeled$C6_list_members <- clean_data.tool7_PS_for_client_ulabeled$C6_list_members |>
  filter(PARENT_KEY %in% clean_data.tool7_PS_for_client_ulabeled$data$KEY)

clean_data.tool7_PS_for_client_ulabeled$Subjects_Added <- clean_data.tool7_PS_for_client_ulabeled$Subjects_Added |>
  filter(PARENT_KEY %in% clean_data.tool7_PS_for_client_ulabeled$data$KEY)


write.xlsx(clean_data.tool7_PS_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool7_EERA_R6_PS_Unlabeled_", Sys.Date(),".xlsx"))

# CBE
clean_data.tool7_CBE_for_client_ulabeled <- clean_data.tool7_for_client_ulabeled
clean_data.tool7_CBE_for_client_ulabeled$data <- clean_data.tool7_CBE_for_client_ulabeled$data |>
  filter(Sample_Type == "CBE")

clean_data.tool7_CBE_for_client_ulabeled$C6_list_members <- clean_data.tool7_CBE_for_client_ulabeled$C6_list_members |>
  filter(PARENT_KEY %in% clean_data.tool7_CBE_for_client_ulabeled$data$KEY)

clean_data.tool7_CBE_for_client_ulabeled$Subjects_Added <- clean_data.tool7_CBE_for_client_ulabeled$Subjects_Added |>
  filter(PARENT_KEY %in% clean_data.tool7_CBE_for_client_ulabeled$data$KEY)

write.xlsx(clean_data.tool7_CBE_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool7_EERA_R6_CBE_Unlabeled_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool8_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool8_EERA_R6_CBE_Unlabeled_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool9_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool9_EERA_R6_CBE_Unlabeled_", Sys.Date(),".xlsx"))

# Exporting for client version of clean datasets -------------------------------
write.xlsx(clean_data.tool0_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool0_EERA_R6_PSCBE_DE_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool1_kdr_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool1_K_EERA_R6_PS_cleaned_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool1_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool1_EERA_R6_PS_cleaned_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool2_EERA_R6_PS_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool3_EERA_R6_PS_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool4_EERA_R6_PS_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool5_EERA_R6_PS_", Sys.Date(),".xlsx"))

# Public School
clean_data.tool6_PS_for_client <- clean_data.tool6_for_client
clean_data.tool6_PS_for_client$data <- clean_data.tool6_PS_for_client$data |>
  filter(Sample_Type == "Public School")

clean_data.tool6_PS_for_client$Subjects_Added <- clean_data.tool6_PS_for_client$Subjects_Added |>
  filter(PARENT_KEY %in% clean_data.tool6_PS_for_client$data$KEY)

write.xlsx(clean_data.tool6_PS_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool6_EERA_R6_PS_", Sys.Date(),".xlsx"))

# CBE
clean_data.tool6_CBE_for_client <- clean_data.tool6_for_client
clean_data.tool6_CBE_for_client$data <- clean_data.tool6_CBE_for_client$data |>
  filter(Sample_Type == "CBE")

clean_data.tool6_CBE_for_client$Subjects_Added <- clean_data.tool6_CBE_for_client$Subjects_Added |>
  filter(PARENT_KEY %in% clean_data.tool6_CBE_for_client$data$KEY)

write.xlsx(clean_data.tool6_CBE_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool6_EERA_R6_CBE_", Sys.Date(),".xlsx"))

# Public School
clean_data.tool7_PS_for_client <- clean_data.tool7_for_client
clean_data.tool7_PS_for_client$data <- clean_data.tool7_PS_for_client$data |>
  filter(Sample_Type == "Public School")

clean_data.tool7_PS_for_client$C6_list_members <- clean_data.tool7_PS_for_client$C6_list_members |>
  filter(PARENT_KEY %in% clean_data.tool7_PS_for_client$data$KEY)

clean_data.tool7_PS_for_client$Subjects_Added <- clean_data.tool7_PS_for_client$Subjects_Added |>
  filter(PARENT_KEY %in% clean_data.tool7_PS_for_client$data$KEY)

write.xlsx(clean_data.tool7_PS_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool7_EERA_R6_PS_", Sys.Date(),".xlsx"))

# CBE
clean_data.tool7_CBE_for_client <- clean_data.tool7_for_client
clean_data.tool7_CBE_for_client$data <- clean_data.tool7_CBE_for_client$data |>
  filter(Sample_Type == "CBE")

clean_data.tool7_CBE_for_client$C6_list_members <- clean_data.tool7_CBE_for_client$C6_list_members |>
  filter(PARENT_KEY %in% clean_data.tool7_CBE_for_client$data$KEY)

clean_data.tool7_CBE_for_client$Subjects_Added <- clean_data.tool7_CBE_for_client$Subjects_Added |>
  filter(PARENT_KEY %in% clean_data.tool7_CBE_for_client$data$KEY)


write.xlsx(clean_data.tool7_CBE_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool7_EERA_R6_CBE_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool8_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool8_EERA_R6_CBE_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool9_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool9_EERA_R6_CBE_", Sys.Date(),".xlsx"))


# source("./R/sample_dfs.R")

# Export other outputs ---------------------------------------------------------
# export issues in data sets
if (nrow(correction_log_discrep) > 0){
  
  write.xlsx(correction_log_discrep, paste0(output_data_path, "issues/correction_log_issues/correction_log_issues_", Sys.Date(),".xlsx"))
}

if(nrow(photo_status_log_discrep) > 0) {
  write.xlsx(photo_status_log_discrep, paste0(output_data_path, "issues/photo_status_log_issues/photo_status_log_issues_", Sys.Date(), ".xlsx"))
}

if (nrow(repeat_sheet_issues) > 0){
  write.xlsx(repeat_sheet_issues, paste0(output_data_path, "issues/repeat_sheet_issues/repeat_sheet_issues_", Sys.Date(),".xlsx"))
}

sm_question_issues_dfs = list(
  # "NA issues in select_multiple" = sm_na_issues,
  "parent_series_inconsistencies" = sm_check_result
)

if (nrow(sm_check_result) > 0){
  write.xlsx(sm_question_issues_dfs, paste0(output_data_path, "issues/sm_issues/sm_check_result_", Sys.Date(),".xlsx"))
}


if (nrow(wrong_choices_result) > 0){
  write.xlsx(wrong_choices_result, paste0(output_data_path, "issues/wrong_choices/wrong_choices_result_", Sys.Date(),".xlsx"))
}

if (nrow(missing_translations) > 0){
  write.xlsx(missing_translations, paste0(output_data_path, "issues/translation_missing/missing_translations_", Sys.Date(),".xlsx"))
}

if (nrow(Logic_check_result) > 0){
   write.xlsx(Logic_check_result, paste0(output_data_path, "issues/logic_checks/logic_checks_", Sys.Date(),".xlsx"))
}

if (nrow(logic_check_data_entry_final) > 0){
 write.xlsx(logic_check_data_entry_final, paste0(output_data_path, "issues/logic_checks/logic_checks_Data_Entry_", Sys.Date(),".xlsx"))
}

if (nrow(calculate_issues) > 0){
  write.xlsx(calculate_issues, paste0(output_data_path, "issues/calculate_issues/calculate_issues_", Sys.Date(),".xlsx"))
}

if (nrow(outlier_check_result) > 0){
  write.xlsx(outlier_check_result, paste0(output_data_path, "issues/outliers/outlier_check_result_", Sys.Date(),".xlsx"))
}

if (nrow(missing_qa_log) > 0){
  write.xlsx(missing_qa_log, paste0(output_data_path, "issues/missing_qa/Missing_qa_log_", Sys.Date(),".xlsx"))
}

if (nrow(relevancy_issues) > 0){
  write.xlsx(relevancy_issues, paste0(output_data_path, "issues/relevancy_checks/relevancy_issues_", Sys.Date(),".xlsx"))
}

