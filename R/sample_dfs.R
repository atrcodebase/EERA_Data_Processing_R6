clean_data.tool0_sample <- clean_data.tool0_for_client
clean_data.tool1_sample <- clean_data.tool1_for_client
clean_data.tool2_sample <- clean_data.tool2_for_client
clean_data.tool3_sample <- clean_data.tool3_for_client
clean_data.tool4_sample <- clean_data.tool4_for_client
clean_data.tool5_sample <- clean_data.tool5_for_client
clean_data.tool6_sample <- clean_data.tool6_for_client
clean_data.tool7_sample <- clean_data.tool7_for_client
clean_data.tool8_sample <- clean_data.tool8_for_client
clean_data.tool9_sample <- clean_data.tool9_for_client

set.seed(090524)
n_sample = 50

# Tool 0
clean_data.tool0_sample$data <- sample_n(clean_data.tool0_for_client$data, n_sample)
for(sheet in names(clean_data.tool0_sample)[c(2,3,4,9)]){
  clean_data.tool0_sample[[sheet]] <- clean_data.tool0_sample[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool0_sample$data$KEY)
}

for(sheet in names(clean_data.tool0_sample)[c(5,6,7,8)]){
  clean_data.tool0_sample[[sheet]] <- clean_data.tool0_sample[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool0_sample$Tool1_Timetable_Year$KEY)
}

# Tool 1
clean_data.tool1_sample$data <- sample_n(clean_data.tool1_for_client$data, n_sample)
for(sheet in names(clean_data.tool1_sample)[-1]){
  clean_data.tool1_sample[[sheet]] <- clean_data.tool1_sample[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)
}

# Tool 2 
clean_data.tool2_sample$data <- sample_n(clean_data.tool2_for_client$data, n_sample)
for(sheet in names(clean_data.tool2_sample)[-1]){
  clean_data.tool2_sample[[sheet]] <- clean_data.tool2_sample[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool2_sample$data$KEY)
}

# Tool 3
clean_data.tool3_sample$data <- sample_n(clean_data.tool3_for_client$data, n_sample)
for(sheet in names(clean_data.tool3_sample)[-1]){
  clean_data.tool3_sample[[sheet]] <- clean_data.tool3_sample[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool3_sample$data$KEY)
}

# Tool 4
clean_data.tool4_sample$data <- sample_n(clean_data.tool4_for_client$data, n_sample)
for(sheet in names(clean_data.tool4_sample)[-1]){
  clean_data.tool4_sample[[sheet]] <- clean_data.tool4_sample[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool4_sample$data$KEY)
}

# Tool 5
clean_data.tool5_sample$data <- sample_n(clean_data.tool5_for_client$data, n_sample)
for(sheet in names(clean_data.tool5_sample)[-1]){
  clean_data.tool5_sample[[sheet]] <- clean_data.tool5_sample[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool5_sample$data$KEY)
}

# Tool 6
clean_data.tool6_sample$data <- sample_n(clean_data.tool6_for_client$data, n_sample)
clean_data.tool6_sample$Subjects_Added <- clean_data.tool6_for_client$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool6_sample$data$KEY)


# Tool 7
clean_data.tool7_sample$data <- sample_n(clean_data.tool7_for_client$data, n_sample)
clean_data.tool7_sample$C6_list_members <- clean_data.tool7_for_client$C6_list_members %>% filter(PARENT_KEY %in% clean_data.tool7_sample$data$KEY)
clean_data.tool7_sample$Subjects_Added <- clean_data.tool7_for_client$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool7_sample$data$KEY)


# Tool 8
clean_data.tool8_sample$data <- sample_n(clean_data.tool8_for_client$data, n_sample)
for(sheet in names(clean_data.tool8_sample)[-1]){
  clean_data.tool8_sample[[sheet]] <- clean_data.tool8_sample[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
}

# Tool 9
clean_data.tool9_sample$data <- clean_data.tool9_for_client$data
clean_data.tool9_sample$Relevant_photos <- clean_data.tool9_for_client$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool9_sample$data$KEY)


# Exporting for client version of clean datasets -------------------------------
write.xlsx(clean_data.tool0_sample, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Sample/EERA_R3_Tool0_Public_School_&_CBE_Data_Entry_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool1_sample, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Sample/EERA_R3_Tool1_Public_School_Headmaster_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2_sample, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Sample/EERA_R3_Tool2_Public_School_Light_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3_sample, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Sample/EERA_R3_Tool3_Public_School_Headcount_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4_sample, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Sample/EERA_R3_Tool4_Public_School_Teacher_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5_sample, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Sample/EERA_R3_Tool5_Public_School_WASH_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool6_sample, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Sample/EERA_R3_Tool6_Public_School_&_CBE_Parent_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool7_sample, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Sample/EERA_R3_Tool7_Public_School_&_CBE_Shura_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool8_sample, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Sample/EERA_R3_Tool8_CBE_Class_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool9_sample, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Sample/EERA_R3_Tool9_CBE_IP_sample_", Sys.Date(),".xlsx"))

rm(list = c(ls(pattern = "_sample_")))




