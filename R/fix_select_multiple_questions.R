# Tool 0 ----------------------------------------------------------------------
for (sheet in names(clean_data.tool0)) {
  clean_data.tool0[[sheet]] <- update_series_cols(data = clean_data.tool0[[sheet]],
                                                  tool = kobo_tool.tool0$survey,
                                                  question_separator = "_")
}

# Tool 1 KDR -------------------------------------------------------------------
for(sheet in names(clean_data.tool1_kdr)){
  clean_data.tool1_kdr[[sheet]] <- update_series_cols(data = clean_data.tool1_kdr[[sheet]],
                                                  tool = kobo_tool.tool1_kdr$survey,
                                                  question_separator = "_")
}


# Tool 1 ----------------------------------------------------------------------
for(sheet in names(clean_data.tool1)){
  clean_data.tool1[[sheet]] <- update_series_cols(data = clean_data.tool1[[sheet]],
                                                  tool = kobo_tool.tool1$survey,
                                                  question_separator = "_")
}

# Tool 2 ----------------------------------------------------------------------
for(sheet in names(clean_data.tool2)){
  clean_data.tool2[[sheet]] <- update_series_cols(data = clean_data.tool2[[sheet]],
                                                  tool = kobo_tool.tool2$survey,
                                                  question_separator = "_")
}

# Tool 3 ----------------------------------------------------------------------
for(sheet in names(clean_data.tool3)){
  clean_data.tool3[[sheet]] <- update_series_cols(data = clean_data.tool3[[sheet]],
                                                  tool = kobo_tool.tool3$survey,
                                                  question_separator = "_")
}

# Tool 4 ---------------------------------------------------------------------- 
for(sheet in names(clean_data.tool4)){
  clean_data.tool4[[sheet]] <- update_series_cols(data = clean_data.tool4[[sheet]],
                                                  tool = kobo_tool.tool4$survey,
                                                  question_separator = "_")
}

# Tool 5 ----------------------------------------------------------------------
for(sheet in names(clean_data.tool5)){
  clean_data.tool5[[sheet]] <- update_series_cols(data = clean_data.tool5[[sheet]],
                                                  tool = kobo_tool.tool5$survey,
                                                  question_separator = "_")
}

# Tool 6 ----------------------------------------------------------------------
for(sheet in names(clean_data.tool6)){
  clean_data.tool6[[sheet]] <- update_series_cols(data = clean_data.tool6[[sheet]],
                                                  tool = kobo_tool.tool6$survey,
                                                  question_separator = "_")
}

# Tool 7 ----------------------------------------------------------------------
for(sheet in names(clean_data.tool7)){
  clean_data.tool7[[sheet]] <- update_series_cols(data = clean_data.tool7[[sheet]],
                                                  tool = kobo_tool.tool7$survey,
                                                  question_separator = "_")
}

# Tool 8 ----------------------------------------------------------------------
for(sheet in names(clean_data.tool8)){
  clean_data.tool8[[sheet]] <- update_series_cols(data = clean_data.tool8[[sheet]],
                                                  tool = kobo_tool.tool8$survey,
                                                  question_separator = "_")
}

# Tool 9 ----------------------------------------------------------------------
for(sheet in names(clean_data.tool9)){
  clean_data.tool9[[sheet]] <- update_series_cols(data = clean_data.tool9[[sheet]], 
                                              tool = kobo_tool.tool9$survey, 
                                              question_separator = "_")
}


# removing extra elements from the environment
rm(list = c(
  objects(pattern = ".sm_vars$")
))



