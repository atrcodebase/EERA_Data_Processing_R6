### attach value labels
# source("R/functions/labeler_function.R")

# Cloning df
clean_data.tool0_ulabeled <- clean_data.tool0
clean_data.tool1_kdr_ulabeled <- clean_data.tool1_kdr
clean_data.tool1_ulabeled <- clean_data.tool1
clean_data.tool2_ulabeled <- clean_data.tool2
clean_data.tool3_ulabeled <- clean_data.tool3
clean_data.tool4_ulabeled <- clean_data.tool4
clean_data.tool5_ulabeled <- clean_data.tool5
clean_data.tool6_ulabeled <- clean_data.tool6
clean_data.tool7_ulabeled <- clean_data.tool7
clean_data.tool8_ulabeled <- clean_data.tool8
clean_data.tool9_ulabeled <- clean_data.tool9

tool0_path = "./input/tools/Tool 0.EERA Public School_CBE - Data Entry Tool - R5.xlsx"
tool1_kdr_path = "./input/tools/Tool 11.EERA Public School - Headmaster Principle Interview KDR- R5.xlsx"
tool1_path = "./input/tools/Tool 1.EERA Public School - Headmaster Principle Interview - R5.xlsx"
tool2_path = "./input/tools/Tool 2.EERA Public School - Light Tool - R5.xlsx"
tool3_path = "./input/tools/Tool 3.EERA Public School - Student Document & Headcount - R5.xlsx"
tool4_path = "./input/tools/Tool 4.EERA Public School - Teacher Tool - R5.xlsx"
tool5_path = "./input/tools/Tool 5.EERA Public School - WASH Observation - R5.xlsx"
tool6_path = "./input/tools/Tool 6.EERA Public School_CBE - Parent Tool - R5.xlsx"
tool7_path = "./input/tools/Tool 7.EERA Public School_CBE - Shura Tool - R5.xlsx"
tool8_path = "./input/tools/Tool 8.EERA CBE - Class Level Tool - R5.xlsx"
tool9_path = "./input/tools/Tool 9.EERA CBE - IP Level Tool - R5.xlsx"

# Tool 0 ------------------------------------------------------------------
for(sheet in names(clean_data.tool0)){
  clean_data.tool0[[sheet]] <- labeler(
    data = clean_data.tool0[[sheet]],
    tool = tool0_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# Tool 1 KDR --------------------------------------------------------------
for(sheet in names(clean_data.tool1_kdr)){
  clean_data.tool1_kdr[[sheet]] <- labeler(
    data = clean_data.tool1_kdr[[sheet]],
    tool = tool1_kdr_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# Tool 1 ------------------------------------------------------------------
for(sheet in names(clean_data.tool1)){
  clean_data.tool1[[sheet]] <- labeler(
    data = clean_data.tool1[[sheet]],
    tool = tool1_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# Tool 2 ------------------------------------------------------------------
for(sheet in names(clean_data.tool2)){
  clean_data.tool2[[sheet]] <- labeler(
    data = clean_data.tool2[[sheet]],
    tool = tool2_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# Tool 3 ------------------------------------------------------------------
for(sheet in names(clean_data.tool3)){
  clean_data.tool3[[sheet]] <- labeler(
    data = clean_data.tool3[[sheet]],
    tool = tool3_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# Tool 4 ------------------------------------------------------------------
for(sheet in names(clean_data.tool4)){
  clean_data.tool4[[sheet]] <- labeler(
    data = clean_data.tool4[[sheet]],
    tool = tool4_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# Tool 5 ------------------------------------------------------------------
for(sheet in names(clean_data.tool5)){
  clean_data.tool5[[sheet]] <- labeler(
    data = clean_data.tool5[[sheet]],
    tool = tool5_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# Tool 6 ------------------------------------------------------------------
for(sheet in names(clean_data.tool6)){
  clean_data.tool6[[sheet]] <- labeler(
    data = clean_data.tool6[[sheet]],
    tool = tool6_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# Tool 7 ------------------------------------------------------------------
for(sheet in names(clean_data.tool7)){
  clean_data.tool7[[sheet]] <- labeler(
    data = clean_data.tool7[[sheet]],
    tool = tool7_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# Tool 8 ------------------------------------------------------------------
for(sheet in names(clean_data.tool8)){
  clean_data.tool8[[sheet]] <- labeler(
    data = clean_data.tool8[[sheet]],
    tool = tool8_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# Tool 9 ------------------------------------------------------------------
for(sheet in names(clean_data.tool9)){
  clean_data.tool9[[sheet]] <- labeler(
    data = clean_data.tool9[[sheet]],
    tool = tool9_path,
    survey_label = "label",
    choice_lable = "label"
  )
}

# remove extra objects from environment  
rm(tool0_path,
   tool1_path,
   tool1_kdr_path,
   tool2_path,
   tool3_path,
   tool4_path,
   tool5_path,
   tool6_path,
   tool7_path,
   tool8_path,
   tool9_path)
