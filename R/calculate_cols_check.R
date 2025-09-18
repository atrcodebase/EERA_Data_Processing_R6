# create the necessary columns --------------------------------------------
# Tool 0
# clean_data.tool0$data <- clean_data.tool0$data |>
#   mutate(
#     tool2_total_compare.re_calc = case_when(
#       Tool2_N_Teachers_Staff_All_Attendance_Books == (Coalesce(Tool2_Total_Teachers_Staff_Male) + Coalesce(Tool2_Total_Teachers_Staff_Female) + Coalesce(Tool2_Total_Teachers_Staff_Gender_Not_Identifiable)) ~ 0,
#       TRUE ~ 1
#     ),
#     # tool3_headcount_conducted_total = case_when(
#     #   Tool3_Headcount_Conducted
#     # )
#     
#     # tool3_headcount_conducted_total : Left behind
#   )


clean_data.tool0$Tool3_T2_Classes_VD <- clean_data.tool0$Tool3_T2_Classes_VD |>
  mutate(
    tool3_t2_variance_calculate.re_calc = abs((Tool3_Total_Present_Students_Attendance_VD_Male + Tool3_Total_Present_Students_Attendance_VD_Female + Tool3_Total_Present_Students_Attendance_VD_Gender_Not_Identified) - Tool3_Headcount_Total),
    Tool3_Headcount_Conducted.re_calc = case_when(
      tool3_headcount_conducted == 1 & Tool3_Headcount_Conducted_Class == 1 ~ 1,
      TRUE ~ 0
    )
  )


# Tool 1 KDR
clean_data.tool1_kdr$data <- clean_data.tool1_kdr$data %>% 
  mutate(
    School_Type_Final.re_calc = case_when(
      A30 %in% c(1, "1") ~ Type_Of_School_Sample_Value,
      A30 %in% c(0, "0", 2, "2") ~ as.numeric(School_Type_SV),
      TRUE ~ 3
    ), 
    
    School_indx.re_calc = case_when(
      School_Type_Final == 3 ~ "1 2 3 4 5 6 7 8 9 10 11 12",
      School_Type_Final == 2 ~ "1 2 3 4 5 6 7 8 9",
      School_Type_Final == 1 ~ "1 2 3 4 5 6",
      TRUE ~ ""
    ),
    
    Type_Of_School_Sample_Value.re_cal = case_when(
      Type_Of_School_CBE_Based_On_The_Sample == "Primary" ~ 1,
      Type_Of_School_CBE_Based_On_The_Sample == "Secondary" ~ 2,
      Type_Of_School_CBE_Based_On_The_Sample == "Higher Secondary" ~ 3,
      TRUE ~ NA_real_
    )
  )



# Tool 2 
clean_data.tool2$data <- clean_data.tool2$data |>
  mutate(
    School_indx.re_calc = case_when(
      School_Type_SV == 3 ~ "1 2 3 4 5 6 7 8 9 10 11 12",
      School_Type_SV == 2 ~ "1 2 3 4 5 6 7 8 9",
      School_Type_SV == 1 ~ "1 2 3 4 5 6",
      TRUE ~ ""
    ),
    
    School_rep.re_calc = str_count(School_indx.re_calc, " ") + 1
  )


# Tool 8
clean_data.tool8$data <- clean_data.tool8$data |>
  mutate(
    Total_Teachers_Present.re_calc = Coalesce(E7) + Coalesce(E8),
    Total_Teachers_Absent.re_calc = Coalesce(E12) + Coalesce(E13)
  )

clean_data.tool8$Section_2_2_4_Headcount <- clean_data.tool8$Section_2_2_4_Headcount |>
  mutate(
    Headcount_Total_Students.re_calc = Coalesce(Headcount_Male_Students) + Coalesce(Headcount_Female_Students)
  )

clean_data.tool8$Classroom_Materials <- clean_data.tool8$Classroom_Materials |>
  mutate(
    O10_0_not_in_use.re_calc = case_when(
      O10_0 == 2 ~ 1,
      TRUE ~ 0
    )
  )

clean_data.tool8$Teacher_Kit <- clean_data.tool8$Teacher_Kit |>
  mutate(
    Q10_0_not_in_use.re_calc = case_when(
      Q10_0 == 2 ~ 1,
      TRUE ~ 0
    )
  )

clean_data.tool8$Student_Kit <- clean_data.tool8$Student_Kit |>
  mutate(
    S10_0_not_in_use.re_calc = case_when(
      S10_0 == 2 ~ 1,
      TRUE ~ 0
    )
  )

# compare the calculated values before and after logs replaced ----------------
calculate_issues <- plyr::rbind.fill(
  # Tool 1 KDR
  clean_data.tool1_kdr$data |>
    filter(School_Type_Final != School_Type_Final.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_Type_Final",
      tool = "Headmaster - KDR",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = School_Type_Final,
           new_value = School_Type_Final.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1_kdr$data |>
    filter(School_indx != School_indx.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_indx",
      tool = "Headmaster - KDR",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = School_indx,
           new_value = School_indx.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1_kdr$data |>
    filter(Type_Of_School_Sample_Value != Type_Of_School_Sample_Value.re_cal) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Type_Of_School_Sample_Value",
      tool = "Headmaster - KDR",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Type_Of_School_Sample_Value,
           new_value = Type_Of_School_Sample_Value.re_cal, issue, tool, sheet, KEY),
  
  
  
  # Tool 0 
  # clean_data.tool0$data |>
  #   filter(tool2_total_compare != tool2_total_compare.re_calc) |>
  #   mutate(
  #     issue = "The changes in the dataset has affected this value, it should be recalculated.",
  #     question ="tool2_total_compare",
  #     tool = "Tool Data Entry",
  #     sheet = "data"
  #   ) |>
  #   select(any_of(meta_cols), question, old_value = tool2_total_compare,
  #          new_value = tool2_total_compare.re_calc, issue, tool, sheet, KEY),

  clean_data.tool0$Tool3_T2_Classes_VD |>
    filter(tool3_t2_variance_calculate != tool3_t2_variance_calculate.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="tool3_t2_variance_calculate",
      tool = "Tool Data Entry",
      sheet = "Tool3_T2_Classes_VD"
    ) |>
    select(any_of(meta_cols), question, old_value = tool3_t2_variance_calculate,
           new_value = tool3_t2_variance_calculate.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$Tool3_T2_Classes_VD |>
    filter(tool3_headcount_conducted != Tool3_Headcount_Conducted.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="tool3_headcount_conducted",
      tool = "Tool Data Entry",
      sheet = "Tool3_T2_Classes_VD"
    ) |>
    select(any_of(meta_cols), question, old_value = tool3_headcount_conducted,
           new_value = Tool3_Headcount_Conducted.re_calc, issue, tool, sheet, KEY),
  

  
  # Tool 2
  clean_data.tool2$data |> 
    filter(School_indx != School_indx.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_indx",
      tool = "Tool 2 - Light",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = School_indx,
           new_value = School_indx.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool2$data |> 
    filter(School_rep != School_rep.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_rep",
      tool = "Tool 2 - Light",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = School_rep,
           new_value = School_rep.re_calc, issue, tool, sheet, KEY),

  
  # Tool 8
  
  clean_data.tool8$data |> 
    filter(Total_Teachers_Present.re_calc != Total_Teachers_Present) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Total_Teachers_Present",
      tool = "Tool 8 - Class",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = Total_Teachers_Present,
           new_value = Total_Teachers_Present.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool8$data |> 
    filter(Total_Teachers_Absent.re_calc != Total_Teachers_Absent) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Total_Teachers_Absent",
      tool = "Tool 8 - Class",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = Total_Teachers_Absent,
           new_value = Total_Teachers_Absent.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool8$Section_2_2_4_Headcount |> 
    filter(Headcount_Total_Students.re_calc != Headcount_Total_Students) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Headcount_Total_Students",
      tool = "Tool 8 - Class",
      sheet = "Section_2_2_4_Headcount"
    ) |> 
    select(any_of(meta_cols), question, old_value = Headcount_Total_Students,
           new_value = Headcount_Total_Students.re_calc, issue, tool, sheet, KEY),
  
  
  clean_data.tool8$Classroom_Materials |> 
    filter(O10_0_not_in_use.re_calc != O10_0_not_in_use) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="O10_0_not_in_use",
      tool = "Tool 8 - Class",
      sheet = "Classroom_Materials"
    ) |> 
    select(any_of(meta_cols), question, old_value = O10_0_not_in_use,
           new_value = O10_0_not_in_use.re_calc, issue, tool, sheet, KEY),

  
  clean_data.tool8$Teacher_Kit |> 
    filter(Q10_0_not_in_use.re_calc != Q10_0_not_in_use) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Q10_0_not_in_use",
      tool = "Tool 8 - Class",
      sheet = "Teacher_Kit"
    ) |> 
    select(any_of(meta_cols), question, old_value = Q10_0_not_in_use,
           new_value = Q10_0_not_in_use.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool8$Student_Kit |> 
    filter(S10_0_not_in_use.re_calc != S10_0_not_in_use) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="S10_0_not_in_use",
      tool = "Tool 8 - Class",
      sheet = "Student_Kit"
    ) |> 
    select(any_of(meta_cols), question, old_value = S10_0_not_in_use,
           new_value = S10_0_not_in_use.re_calc, issue, tool, sheet, KEY)
)


# remove extra indicators that were created in above -------------------------------
clean_data.tool0$data <- clean_data.tool0$data |> select(-ends_with(".re_calc"))
clean_data.tool2$data <- clean_data.tool2$data |> select(-ends_with(".re_calc"))
clean_data.tool8$data <- clean_data.tool8$data |> select(-ends_with(".re_calc"))
