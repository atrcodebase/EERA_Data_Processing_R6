## Append calculated vars label
meta_cols2 <- c("Site_Visit_ID", "EMIS_School_ID_CBE_KEY", "School_CBE_Name", "IP_Name", "Region", "Province", "District", "Area_Type", "Type_Of_School_CBE_Based_On_The_Sample", "School_CBE_Gender_Based_On_The_Sample", "School_Type_SV", "School_Gender_SV")


# Tool 0
clean_data.tool0_for_client$Tool3_Grades_Repeat <- clean_data.tool0_for_client$Tool3_Grades_Repeat |>
  select(-Tool3_Grades_Field_Label) |>
  left_join(
    kobo_tool.tool0$choices |>
      filter(list_name == "grades") |>
      mutate(value = as.integer(value)) |>
      select(value, Tool3_Grades_Field_Label = "label"), by = c("Tool3_Grades_Field_Value" = "value")) |>
  select(any_of(meta_cols2), Tool3_Grades_Field_Label, everything()) |>
  select(-Tool3_Grades_Field_Value)



clean_data.tool0_for_client$Tool1_Timetable1_Repeat <- clean_data.tool0_for_client$Tool1_Timetable1_Repeat |>
  select(-Tool1_Timetable1_Field_Label) |>
  left_join(
    kobo_tool.tool0$choices |>
      filter(list_name == "grades") |>
      mutate(value = as.integer(value)) |>
      select(value, Tool1_Timetable1_Field_Label = "label"), by = c("Tool1_Timetable1_Field_Value" = "value")) |>
  select(any_of(meta_cols2), Tool1_Timetable1_Field_Label, everything()) |>
  select(-Tool1_Timetable1_Field_Value)


clean_data.tool0_for_client$Tool1_Timetable2_Repeat <- clean_data.tool0_for_client$Tool1_Timetable2_Repeat |>
  select(-Tool1_Timetable2_Field_Label) |>
  left_join(
    kobo_tool.tool0$choices |>
      filter(list_name == "grades") |>
      mutate(value = as.integer(value)) |>
      select(value, Tool1_Timetable2_Field_Label = "label"), by = c("Tool1_Timetable2_Field_Value" = "value")) |>
  select(any_of(meta_cols2), Tool1_Timetable2_Field_Label, everything()) |>
  select(-Tool1_Timetable2_Field_Value)


clean_data.tool0_for_client$Tool1_Timetable3_Repeat <- clean_data.tool0_for_client$Tool1_Timetable3_Repeat |>
  select(-Tool1_Timetable3_Field_Label) |>
  left_join(
    kobo_tool.tool0$choices |>
      filter(list_name == "grades") |>
      mutate(value = as.integer(value)) |>
      select(value, Tool1_Timetable3_Field_Label = "label"), by = c("Tool1_Timetable3_Field_Value" = "value")) |>
  select(any_of(meta_cols2), Tool1_Timetable3_Field_Label, everything()) |>
  select(-Tool1_Timetable3_Field_Value)

# Tool1 KDR
clean_data.tool1_kdr_for_client$Shifts_Detail <- clean_data.tool1_kdr_for_client$Shifts_Detail |>
  select(-Shift_name) |>
  left_join(
    kobo_tool.tool1_kdr$choices |>
      filter(list_name == "shifts") |>
      mutate(value = as.integer(value)) |>
      select(value, Shift_name = "label"), by = c("Shift_indx" = "value")) |>
  select(any_of(meta_cols2), Shift_name, everything()) |>
  select(-Shift_indx)

# Tool2
clean_data.tool2_for_client$Shifts_Detail <- clean_data.tool2_for_client$Shifts_Detail |>
  select(-Shift_name) |>
  left_join(
    kobo_tool.tool2$choices |>
      filter(list_name == "shifts") |>
      mutate(value = as.integer(value)) |>
      select(value, Shift_name = "label"), by = c("Shift_indx" = "value")) |>
  select(any_of(meta_cols2), Shift_name, everything()) |>
  select(-Shift_indx)



clean_data.tool2_for_client$Public_Stationary_Kit_Group <- clean_data.tool2_for_client$Public_Stationary_Kit_Group |>
  select(-H6_Field_Label) |>
  left_join(
    kobo_tool.tool2$choices |>
      filter(list_name == "H5") |>
      mutate(value = as.integer(value)) |>
      select(value, H6_Field_Label = "label"), by = c("H6_Field_Value" = "value")) |>
  select(any_of(meta_cols2), H6_Field_Label, everything()) |>
  select(-H6_Field_Value)

clean_data.tool2_for_client$Teachers_Pack_Group <- clean_data.tool2_for_client$Teachers_Pack_Group |>
  select(-i6_Field_Label) |>
  left_join(
    kobo_tool.tool2$choices |>
      filter(list_name == "i5") |>
      select(value, i6_Field_Label = "label") |>
      mutate(value = as.integer(value))
    , by = c("i6_Field_Value" = "value")) |>
  select(any_of(meta_cols2), i6_Field_Label, everything()) |>
  select(-i6_Field_Value)


clean_data.tool2_for_client$Students_Pack_Group <- clean_data.tool2_for_client$Students_Pack_Group |>
  select(-J6_Field_Label) |>
  left_join(
    kobo_tool.tool2$choices |>
      filter(list_name == "J5") |>
      mutate(value = as.integer(value)) |>
      select(value, J6_Field_Label = "label"), by = c("J6_Field_Value" = "value")) |>
  select(any_of(meta_cols2), J6_Field_Label, everything()) |>
  select(-J6_Field_Value)

# Tool 3
clean_data.tool3_for_client$Tool3_Grades_Repeat <- clean_data.tool3_for_client$Tool3_Grades_Repeat |>
  select(-Tool3_Grades_Field_Label) |>
  left_join(
    kobo_tool.tool3$choices |>
      filter(list_name == "grades") |>
      mutate(value = as.integer(value)) |>
      select(value, Tool3_Grades_Field_Label = "label"), by = c("Tool3_Grades_Field_Value" = "value")) |>
  select(any_of(meta_cols2), Tool3_Grades_Field_Label, everything()) |>
  select(-Tool3_Grades_Field_Value)

# Tool 4
clean_data.tool4_for_client$Subjects_taught_by_this_teacher <- clean_data.tool4_for_client$Subjects_taught_by_this_teacher |>
  select(-D9_Field_Label) |>
  left_join(
    kobo_tool.tool4$choices |>
      filter(list_name == "subjects") |>
      mutate(value = as.integer(value)) |>
      select(value, D9_Field_Label = "label"), by = c("D9_Field_Value" = "value")) |>
  select(any_of(meta_cols2), D9_Field_Label, everything()) |>
  select(-D9_Field_Value)


clean_data.tool4_for_client$Subjects_Not_Being_Taught <- clean_data.tool4_for_client$Subjects_Not_Being_Taught |>
  select(-F12_Field_Label) |>
  left_join(
    kobo_tool.tool4$choices |>
      filter(list_name == "F1") |>
      mutate(value = as.integer(value)) |>
      select(value, F12_Field_Label = "label"), by = c("F12_Field_Value" = "value")) |>
  select(any_of(meta_cols2), F12_Field_Label, everything()) |>
  select(-F12_Field_Value)


# Tool 7
clean_data.tool7_for_client$C6_list_members <- clean_data.tool7_for_client$C6_list_members |>
  select(-Field_Label, -Field_Lablel_Final) |>
  left_join(
    kobo_tool.tool7$choices |>
      filter(list_name == "C5") |>
      mutate(value = as.integer(value)) |>
      select(value, Field_Label = "label"), by = c("Field_Value" = "value")) |>
  left_join(
    clean_data.tool7_for_client$data |>
      select(KEY, C5_Other), by = c("PARENT_KEY" = "KEY")) |>
  mutate(
    Field_Lablel_Final = case_when(
      Field_Value == 7777 ~ C5_Other,
      TRUE ~ Field_Label
    )
  ) |>
  select(any_of(meta_cols2), Field_Value, Field_Lablel_Final, everything(), -C5_Other) |>
  select(-Field_Value, -Field_Label)


# Tool 8
clean_data.tool8_for_client$Classroom_Materials <- clean_data.tool8_for_client$Classroom_Materials |>
  select(- O_Field_Label) |>
  left_join(
    kobo_tool.tool8$choices |>
      filter(list_name == "N5") |>
      mutate(value = as.integer(value)) |>
      select(value, O_Field_Label = "label"), by = c("O_Field_Value" = "value")) |>
  select(any_of(meta_cols2), O_Field_Label, everything(), -O_Field_Value)

clean_data.tool8_for_client$Teacher_Kit <- clean_data.tool8_for_client$Teacher_Kit |>
  select(- O2_Field_Label) |>
  left_join(
    kobo_tool.tool8$choices |>
      filter(list_name == "P5") |>
      mutate(value = as.integer(value)) |>
      select(value, O2_Field_Label = "label"), by = c("O2_Field_Value" = "value")) |>
  select(any_of(meta_cols2), O2_Field_Label, everything(), -O2_Field_Value)

clean_data.tool8_for_client$Student_Kit <- clean_data.tool8_for_client$Student_Kit |>
  select(- S1_Field_Label) |>
  left_join(
    kobo_tool.tool8$choices |>
      filter(list_name == "R5") |>
      mutate(value = as.integer(value)) |>
      select(value, S1_Field_Label = "label"), by = c("S1_Field_Value" = "value")) |>
  select(any_of(meta_cols2), S1_Field_Label, everything(), -S1_Field_Value)


clean_data.tool8_for_client$V_list_of_all_members <- clean_data.tool8_for_client$V_list_of_all_members |>
  select(- V_Field_Label) |>
  left_join(
    kobo_tool.tool8$choices |>
      filter(list_name == "V4") |>
      mutate(value = as.integer(value)) |>
      select(value, V_Field_Label = "label"), by = c("V_Field_Value" = "value")) |>
  select(any_of(meta_cols2), V_Field_Label, everything(), -V_Field_Value)




