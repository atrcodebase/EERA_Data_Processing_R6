tobe_added <- read_sheet(qa_sheet_url_ps, sheet = "To be added in the dataset") |>
  filter(Province != "Kandahar")

# Light tool
tob_added_light_opt <- tobe_added |>
  filter(Tool == "Light Tool" & Tab_Name == "School_Operationality") |>
  select(KEY =  KEY_Unique)


tob_added_light_shift <- tobe_added |>
  filter(Tool == "Light Tool" & Tab_Name == "Shifts_Detail") |>
  select(KEY =  KEY_Unique)


if(nrow(tob_added_light_opt) > 0){
  raw_data.tool2$School_Operationality <- raw_data.tool2$School_Operationality |>
    plyr::rbind.fill(
      tob_added_light_opt
    ) |>
    mutate(
      PARENT_KEY = case_when(
        is.na(PARENT_KEY) ~ str_sub(KEY, 1, 41),
        TRUE ~ PARENT_KEY
      ),
      `SET-OF-School_Operationality` = case_when(
        is.na(`SET-OF-School_Operationality`) ~ paste0(PARENT_KEY,"/Passcode_correct-Valid_User-Section_2_Access_to_Education_ECA_1-Section_2_2_1_Shifts_and_Grades_of_School-School_Operationality"),
        TRUE ~ `SET-OF-School_Operationality`
      )
    )
}

if(nrow(tob_added_light_shift) > 0){
  raw_data.tool2$Shifts_Detail <- raw_data.tool2$Shifts_Detail |>
    plyr::rbind.fill(
      tob_added_light_shift
    ) |>
    mutate(
      PARENT_KEY = case_when(
        is.na(PARENT_KEY) ~ str_sub(KEY, 1, 41),
        TRUE ~ PARENT_KEY
      ),
      `SET-OF-Shifts_Detail` = case_when(
        is.na(`SET-OF-Shifts_Detail`) ~ paste0(PARENT_KEY,"/Passcode_correct-Valid_User-Section_2_Access_to_Education_ECA_1-Section_2_2_1_Shifts_and_Grades_of_School-Shifts_Detail"),
        TRUE ~ `SET-OF-Shifts_Detail`
      )
    )
}

# Parent tool
tob_added_parent <- tobe_added |>
  filter(Tool == "Parent Tool") |>
  select(KEY =  KEY_Unique)
  


raw_data.tool6$Subjects_Added <- raw_data.tool6$Subjects_Added |>
  plyr::rbind.fill(
    tob_added_parent
  ) |>
  mutate(
    PARENT_KEY = case_when(
      is.na(PARENT_KEY) ~ str_sub(KEY, 1, 41),
      TRUE ~ PARENT_KEY
    ),
    `SET-OF-Subjects_Added` = case_when(
      is.na(`SET-OF-Subjects_Added`) ~ paste0(PARENT_KEY,"/Passcode_correct-Valid_User-Section_4_Curriculum_Changes_ECA_2-Subjects_Added"),
      TRUE ~ `SET-OF-Subjects_Added`
    )
  )

# Shura tool
tob_added_shura <- tobe_added |>
  filter(Tool == "Shura Tool") |>
  select(KEY =  KEY_Unique)


raw_data.tool7$Subjects_Added <- raw_data.tool7$Subjects_Added |>
  plyr::rbind.fill(
    tob_added_shura
  ) |>
  mutate(
    PARENT_KEY = case_when(
      is.na(PARENT_KEY) ~ str_sub(KEY, 1, 41),
      TRUE ~ PARENT_KEY
    ),
    `SET-OF-Subjects_Added` = case_when(
      is.na(`SET-OF-Subjects_Added`) ~ paste0(PARENT_KEY,"/Passcode_correct-Valid_User-Section_4_Curriculum_Changes_ECA_2-Section_4_1-Subjects_Added"),
      TRUE ~ `SET-OF-Subjects_Added`
    )
  )
