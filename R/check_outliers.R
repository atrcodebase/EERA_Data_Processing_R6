if(!require(tidyverse)) install.packages("remotes")
if(!require(cleaninginspectoR)) remotes::install_github("ellieallien/cleaninginspectoR", dependencies = T)

# to_be_ignored_vars <- c("D7_Year", "G4_Minutes")
to_be_ignored_vars <- c("D2_Years", "D2_Months", "D7_Year", "D7_Month", "G4_Minutes")

# extracting the numeric indicators of each tool
tool0.numeric_vars <- kobo_tool.tool0$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool1.numeric_vars_kdr <- kobo_tool.tool1_kdr$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool1.numeric_vars <- kobo_tool.tool1$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool2.numeric_vars <- kobo_tool.tool2$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool3.numeric_vars <- kobo_tool.tool3$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool4.numeric_vars <- kobo_tool.tool4$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool5.numeric_vars <- kobo_tool.tool5$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool6.numeric_vars <- kobo_tool.tool6$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool7.numeric_vars <- kobo_tool.tool7$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool8.numeric_vars <- kobo_tool.tool8$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool9.numeric_vars <- kobo_tool.tool9$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)


# creating the indices to facilitate joining of meta cols and KEY ---------
# Tool 0
for(sheet in names(clean_data.tool0)){
  assign(paste0("meta_cols_tool0",".",sheet), clean_data.tool0[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}

# Tool 1 KDR
for(sheet in names(clean_data.tool1_kdr)){
  assign(paste0("meta_cols_tool1_kdr",".",sheet), clean_data.tool1_kdr[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}


# Tool 1
for(sheet in names(clean_data.tool1)){
  assign(paste0("meta_cols_tool1",".",sheet), clean_data.tool1[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}

# Tool 2
for(sheet in names(clean_data.tool2)){
  assign(paste0("meta_cols_tool2",".",sheet), clean_data.tool2[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}

# Tool 3
for(sheet in names(clean_data.tool3)){
  assign(paste0("meta_cols_tool3",".",sheet), clean_data.tool3[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}

# Tool 4
for(sheet in names(clean_data.tool4)){
  assign(paste0("meta_cols_tool4",".",sheet), clean_data.tool4[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}

# Tool 5
for(sheet in names(clean_data.tool5)){
  assign(paste0("meta_cols_tool5",".",sheet), clean_data.tool5[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}

# Tool 6
for(sheet in names(clean_data.tool6)){
  assign(paste0("meta_cols_tool6",".",sheet), clean_data.tool6[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}

# Tool 7
for(sheet in names(clean_data.tool7)){
  assign(paste0("meta_cols_tool7",".",sheet), clean_data.tool7[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}

# Tool 8
for(sheet in names(clean_data.tool8)){
  assign(paste0("meta_cols_tool8",".",sheet), clean_data.tool8[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}

# Tool 9
for(sheet in names(clean_data.tool9)){
  assign(paste0("meta_cols_tool9",".",sheet), clean_data.tool9[[sheet]] %>% mutate(index = as.numeric(row.names(.))) %>% select(index, any_of(unname(meta_cols)), KEY))
}

# logging the outliers ---------------------------------------------------- HERE
outlier_check_result <- data.frame()

# Tool 0
tool0_outliers <- data.frame()
for(sheet in names(clean_data.tool0)){
  if(any(tool0.numeric_vars %in% names(clean_data.tool0[[sheet]]))){
    tool0_outliers <- plyr::rbind.fill(
      tool0_outliers,
      find_outliers(clean_data.tool0[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool0.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool0_outliers <- tool0_outliers %>% 
  filter(variable %in% tool0.numeric_vars) %>% 
  mutate(tool = "Tool Data Entry") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name) |> filter(old_value != 6666)


outlier_check_result <- rbind(
  outlier_check_result,
  tool0_outliers
)

rm(tool0_outliers)


# Tool 1
tool1_outliers <- data.frame()
for(sheet in names(clean_data.tool1)){
  if(any(tool1.numeric_vars %in% names(clean_data.tool1[[sheet]]))){
    tool1_outliers <- plyr::rbind.fill(
      tool1_outliers,
      find_outliers(clean_data.tool1[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool1.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool1_outliers <- tool1_outliers %>% 
  filter(variable %in% tool1.numeric_vars) %>% 
  mutate(tool = "Tool 1 - Headmaster") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)


outlier_check_result <- rbind(
  outlier_check_result,
  tool1_outliers
)

rm(tool1_outliers)

# Tool 1 - KDR
tool1_kdr_outliers <- data.frame()
for(sheet in names(clean_data.tool1_kdr)){
  if(any(tool1.numeric_vars_kdr %in% names(clean_data.tool1_kdr[[sheet]]))){
    tool1_kdr_outliers <- plyr::rbind.fill(
      tool1_kdr_outliers,
      find_outliers(clean_data.tool1_kdr[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool1_kdr.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool1_kdr_outliers <- tool1_kdr_outliers %>% 
  filter(variable %in% tool1.numeric_vars_kdr) %>% 
  mutate(tool = "Tool 1 - Headmaster - KDR") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)


outlier_check_result <- rbind(
  outlier_check_result,
  tool1_kdr_outliers
)

rm(tool1_kdr_outliers)

# Tool 2
tool2_outliers <- data.frame()
clean_data.tool2_cloned <- clean_data.tool2
clean_data.tool2_cloned$data <- clean_data.tool2_cloned$data %>% 
  mutate(
    H4 = case_when(
      H4 == 8888 ~ NA_real_,
      TRUE ~ H4
    ),
    i4_Yes = case_when(
      i4_Yes == 8888 ~ NA_real_,
      TRUE ~ i4_Yes
    ),
    J4_Yes = case_when(
      J4_Yes == 8888 ~ NA_real_,
      TRUE ~ J4_Yes
    )
  )

clean_data.tool2_cloned$Teachers_Pack_Group <- clean_data.tool2_cloned$Teachers_Pack_Group %>% 
  mutate(
    i9_Yes = case_when(
      i9_Yes == 8888 ~ NA_real_,
      TRUE ~ i9_Yes
    )
  )

clean_data.tool2_cloned$Students_Pack_Group <- clean_data.tool2_cloned$Students_Pack_Group %>% 
  mutate(
    J9_Yes = case_when(
      J9_Yes == 8888 ~ NA_real_,
      TRUE ~ J9_Yes
    )
  )

for(sheet in names(clean_data.tool2_cloned)){
  if(any(tool2.numeric_vars %in% names(clean_data.tool2_cloned[[sheet]]))){
    tool2_outliers <- plyr::rbind.fill(
      tool2_outliers,
      find_outliers(clean_data.tool2_cloned[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool2.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool2_outliers <- tool2_outliers %>% 
  filter(variable %in% tool2.numeric_vars) %>% 
  mutate(tool = "Tool 2 - Light") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)


outlier_check_result <- plyr::rbind.fill(
  outlier_check_result,
  tool2_outliers
)

rm(tool2_outliers, clean_data.tool2_cloned)

# Tool 3
tool3_outliers <- data.frame()

for(sheet in names(clean_data.tool3)){
  if(any(tool3.numeric_vars %in% names(clean_data.tool3[[sheet]]))){
    tool3_outliers <- plyr::rbind.fill(
      tool3_outliers,
      find_outliers(clean_data.tool3[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool3.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool3_outliers <- tool3_outliers %>% 
  filter(variable %in% tool3.numeric_vars) %>% 
  mutate(tool = "Tool 3 - Headcount") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)


outlier_check_result <- plyr::rbind.fill(
  outlier_check_result,
  tool3_outliers
)

rm(tool3_outliers)


# Tool 4
tool4_outliers <- data.frame()

for(sheet in names(clean_data.tool4)){
  if(any(tool4.numeric_vars %in% names(clean_data.tool4[[sheet]]))){
    tool4_outliers <- plyr::rbind.fill(
      tool4_outliers,
      find_outliers(clean_data.tool4[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool4.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool4_outliers <- tool4_outliers %>% 
  filter(variable %in% tool4.numeric_vars) %>% 
  mutate(tool = "Tool 4 - Teacher") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)


outlier_check_result <- plyr::rbind.fill(
  outlier_check_result,
  tool4_outliers
)

rm(tool4_outliers)

# Tool 5
tool5_outliers <- data.frame()

for(sheet in names(clean_data.tool5)){
  if(any(tool5.numeric_vars %in% names(clean_data.tool5[[sheet]]))){
    tool5_outliers <- plyr::rbind.fill(
      tool5_outliers,
      find_outliers(clean_data.tool5[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool5.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool5_outliers <- tool5_outliers %>% 
  filter(variable %in% tool5.numeric_vars) %>% 
  mutate(tool = "Tool 5 - WASH") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)


outlier_check_result <- plyr::rbind.fill(
  outlier_check_result,
  tool5_outliers
)

rm(tool5_outliers)


# Tool 6
tool6_outliers <- data.frame()

for(sheet in names(clean_data.tool6)){
  if(any(tool6.numeric_vars %in% names(clean_data.tool6[[sheet]]))){
    tool6_outliers <- plyr::rbind.fill(
      tool6_outliers,
      find_outliers(clean_data.tool6[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool6.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool6_outliers <- tool6_outliers %>% 
  filter(variable %in% tool6.numeric_vars) %>% 
  mutate(tool = "Tool 6 - Parent") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)


outlier_check_result <- plyr::rbind.fill(
  outlier_check_result,
  tool6_outliers
)

rm(tool6_outliers)


# Tool 7
tool7_outliers <- data.frame()

for(sheet in names(clean_data.tool7)){
  if(any(tool7.numeric_vars %in% names(clean_data.tool7[[sheet]]))){
    tool7_outliers <- plyr::rbind.fill(
      tool7_outliers,
      find_outliers(clean_data.tool7[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool7.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool7_outliers <- tool7_outliers %>% 
  filter(variable %in% tool7.numeric_vars) %>% 
  mutate(tool = "Tool 7 - Shura") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)


outlier_check_result <- plyr::rbind.fill(
  outlier_check_result,
  tool7_outliers
)

rm(tool7_outliers)

# Tool 8
tool8_outliers <- data.frame()

for(sheet in names(clean_data.tool8)){
  if(any(tool8.numeric_vars %in% names(clean_data.tool8[[sheet]]))){
    tool8_outliers <- plyr::rbind.fill(
      tool8_outliers,
      find_outliers(clean_data.tool8[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool8.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool8_outliers <- tool8_outliers %>% 
  filter(variable %in% tool8.numeric_vars) %>% 
  mutate(tool = "Tool 8 - Class") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)


outlier_check_result <- plyr::rbind.fill(
  outlier_check_result,
  tool8_outliers
)

rm(tool8_outliers)


# Tool 9
tool9_outliers <- data.frame()

for(sheet in names(clean_data.tool9)){
  if(any(tool9.numeric_vars %in% names(clean_data.tool9[[sheet]]))){
    tool9_outliers <- plyr::rbind.fill(
      tool9_outliers,
      find_outliers(clean_data.tool9[[sheet]]) %>% 
        left_join(get(paste0("meta_cols_tool9.",sheet)), by = "index") %>% 
        mutate(Tab_name = sheet)
    )
  }
}

tool9_outliers <- tool9_outliers %>% 
  filter(variable %in% tool9.numeric_vars) %>% 
  mutate(tool = "Tool 9 - IP") %>% 
  select(KEY,any_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)


outlier_check_result <- plyr::rbind.fill(
  outlier_check_result,
  tool9_outliers
)

rm(tool9_outliers)

# removing extra elements from the environment
rm(list = c(
  objects(pattern = "\\.numeric_vars$"),
  objects(pattern = "^meta_cols_tool.*")
  ))
