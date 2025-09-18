source("R/functions/sum_rows.R")


# TOOL 1 ------------------------------------------------------------------

clean_data.tool1$School_Operationality <- clean_data.tool1$School_Operationality|>
  left_join(select(clean_data.tool1$data, School_CBE_Gender_Based_On_The_Sample, KEY), by = c("PARENT_KEY" = "KEY"))

clean_data.tool1$School_Operationality_Other_... <- clean_data.tool1$School_Operationality_Other_... |>
  left_join(select(clean_data.tool1$data, School_CBE_Gender_Based_On_The_Sample, KEY), by = c("PARENT_KEY" = "KEY"))


# TOOL 3 ------------------------------------------------------------------
clean_data.tool3$LastWeek_Attendance_Detail <- clean_data.tool3$LastWeek_Attendance_Detail |>
  mutate(
    D5 = as.Date(D5,origin = "1899-12-30") |> lubridate::as_date()
  )

clean_data.tool3$Todays_Attendance_Detail <- clean_data.tool3$Todays_Attendance_Detail |>
  mutate(
    D2 = as.Date(D2,origin = "1899-12-30") |> lubridate::as_date()
  )

# TOOL 8 ------------------------------------------------------------------

clean_data.tool8$Section_2_2_4_Headcount <- clean_data.tool8$Section_2_2_4_Headcount|>
  left_join(select(clean_data.tool8$data, School_CBE_Gender_Based_On_The_Sample, KEY), by = c("PARENT_KEY" = "KEY"))
