# Fixing the URLs 

#Tool1
for(sheet in names(clean_data.tool1)){
  clean_data.tool1[[sheet]] <-  concat_url(data = clean_data.tool1[[sheet]],
                                           tool = "./input/tools/Tool 1.EERA Public School - Headmaster Principle Interview - R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}


#Tool1 - KDR
for(sheet in names(clean_data.tool1_kdr)){
  clean_data.tool1_kdr[[sheet]] <-  concat_url(data = clean_data.tool1_kdr[[sheet]],
                                           tool = "./input/tools/Tool 11.EERA Public School - Headmaster Principle Interview KDR- R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}


#Tool2
for(sheet in names(clean_data.tool2)){
  clean_data.tool2[[sheet]] <-  concat_url(data = clean_data.tool2[[sheet]],
                                           tool = "./input/tools/Tool 2.EERA Public School - Light Tool - R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}


#Tool3
for(sheet in names(clean_data.tool3)){
  clean_data.tool3[[sheet]] <-  concat_url(data = clean_data.tool3[[sheet]],
                                           tool = "./input/tools/Tool 3.EERA Public School - Student Document & Headcount - R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}


#Tool4
for(sheet in names(clean_data.tool4)){
  clean_data.tool4[[sheet]] <-  concat_url(data = clean_data.tool4[[sheet]],
                                           tool = "./input/tools/Tool 4.EERA Public School - Teacher Tool - R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}


#Tool5
for(sheet in names(clean_data.tool5)){
  clean_data.tool5[[sheet]] <-  concat_url(data = clean_data.tool5[[sheet]],
                                           tool = "./input/tools/Tool 5.EERA Public School - WASH Observation - R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}


#Tool6
for(sheet in names(clean_data.tool6)){
  clean_data.tool6[[sheet]] <-  concat_url(data = clean_data.tool6[[sheet]],
                                           tool = "./input/tools/Tool 6.EERA Public School_CBE - Parent Tool - R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}


#Tool7
for(sheet in names(clean_data.tool7)){
  clean_data.tool7[[sheet]] <-  concat_url(data = clean_data.tool7[[sheet]],
                                           tool = "./input/tools/Tool 7.EERA Public School_CBE - Shura Tool - R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}


#Tool8
for(sheet in names(clean_data.tool8)){
  clean_data.tool8[[sheet]] <-  concat_url(data = clean_data.tool8[[sheet]],
                                           tool = "./input/tools/Tool 8.EERA CBE - Class Level Tool - R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}


#Tool9
for(sheet in names(clean_data.tool0)){
  clean_data.tool0[[sheet]] <-  concat_url(data = clean_data.tool0[[sheet]],
                                           tool = "./input/tools/Tool 0.EERA Public School_CBE - Data Entry Tool - R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}

#Tool10
for(sheet in names(clean_data.tool9)){
  clean_data.tool9[[sheet]] <-  concat_url(data = clean_data.tool9[[sheet]],
                                           tool = "./input/tools/Tool 9.EERA CBE - IP Level Tool - R5.xlsx",
                                           server_name = "https://artftpm.surveycto.com")
}


# Checks Audio, Image and translation columns
log_questions <- function(data, columns, columns_different="", key_col="KEY", suffix, sheet,
                          download_links="https://artftpm.surveycto.com/view/submission-attachment/"){
  # QA Image status to ignore
  image_qa_status <- c("Checked & Verified", "Checked - Irrelevant Photo", "Checked - Blur/Not Visible Photo", 
                       "Checked - Photo Not Visible at the Health Facility", "Checked - Irrelevant Photo Document not exist",
                       "Checked - Irrelevant Photo FR Uploaded Wrong Photo", "Checked - Irrelevant Photo Item not exist",
                       "Checked - Doesn't have Geopoint", "Checked - Photo missed due to form Version",
                       # New
                       "Verified", "Error/Irrelevant"
  )
  # 
  common_file_types <- c(".csv", ".m4a", ".amr", ".wav", ".aac", ".mp3", ".jpg", ".ogg")
  # Translation texts to flag
  audio_issues <- c("No clear voice", "Not clear voice", "No audio", "Not audible", "Unclear audio",
                    "No clear audio", "No clear words", "NO VOICE", "inaudible", "Unclear language", 
                    "UNKNOWN LANGUAGE", "Unclear response", "NO ANSWER")  
  question_log <- data.frame()
  for(col in columns){
    
    # Add Translation/QA to question name 
    if(col %in% names(columns_different)){
      # If Translation/QA column name is different, get it from columns_different
      calculated_col <- columns_different[[col]]
    } else {
      calculated_col <- paste0(col, "_", suffix)
    }
    
    # Log if question is missing
    if(calculated_col %notin% names(data)){
      message(calculated_col, " not found in the dataset!")
    }
    
    ### Flag 
    flagged_data <- list(
      "Incorrect download link"=which(!is.na(data[[col]]) & (!grepl(download_links, data[[col]]) | 
                                                               !grepl("?uuid=uuid%3A", data[[col]]) | 
                                                               !grepl(paste0(common_file_types, collapse = "|"), data[[col]])) & 
                                        data[[col]] %notin% "No_audio_received_from_the_field/Translation_is_from_a_callback"
      ),
      "Download link is missing"=which(data[[calculated_col]] %notin% c(NA, "", "NA") & is.na(data[[col]]))
    )
    # Question specific checks
    if(suffix == "QA"){
      flagged_data[["Image QA status is incorrect or not added"]] <- which(!is.na(data[[col]]) & data[[calculated_col]] %notin% image_qa_status)
    } else {
      flagged_data[["Audio Translation is missing"]] <- which(!is.na(data[[col]]) & data[[calculated_col]] %in% c(image_qa_status, "-", NA, "", "NA", ".", "--", "---", ".."))
      flagged_data[["Unclear voice/audio"]] <- which(!is.na(data[[col]]) & grepl(paste0(audio_issues, collapse = "|"), data[[calculated_col]], ignore.case = TRUE))
      flagged_data[["MANUAL_REVIEW"]] <- which(!is.na(data[[col]]) & 
                                                 str_length(data[[calculated_col]]) < 20 & 
                                                 data[[calculated_col]] %notin% c(image_qa_status, "-", NA, "", "NA", ".", "--", "---", "..") &
                                                 !grepl(paste0(audio_issues, collapse = "|"), data[[calculated_col]], ignore.case = TRUE))
    }
    
    # Covert to data.frame
    flagged_data <- plyr::ldply(flagged_data, data.frame) 
    names(flagged_data) = c("issue", "rows") # Rename
    flagged_data <- flagged_data %>% 
      group_by(rows) %>% 
      mutate(issue = paste0(issue, collapse = " & ")) %>% ungroup() # Combine issues
    
    # Log
    if(nrow(flagged_data) != 0){
      log <- data.frame(KEY=data[[key_col]][flagged_data$rows],
                        question=calculated_col,
                        value=data[[calculated_col]][flagged_data$rows],
                        download_link=data[[col]][flagged_data$rows],
                        question_type=suffix,
                        sheet=sheet,
                        issue=flagged_data$issue)
      question_log <- rbind(question_log, log)
    }
  }
  return(question_log)
}



## Logging untranslated audio, not QA'ed images and broken links ----------------
# Audio
missing_qa_log <- data.frame()

tool1_kdr.audio_cols <- kobo_tool.tool1_kdr$survey[kobo_tool.tool1_kdr$survey$type == "audio","name"] %>% pull(name)
tool1.audio_cols <- kobo_tool.tool1$survey[kobo_tool.tool1$survey$type == "audio","name"] %>% pull(name)
tool2.audio_cols <- kobo_tool.tool2$survey[kobo_tool.tool2$survey$type == "audio","name"] %>% pull(name)
tool3.audio_cols <- kobo_tool.tool3$survey[kobo_tool.tool3$survey$type == "audio","name"] %>% pull(name)
tool4.audio_cols <- kobo_tool.tool4$survey[kobo_tool.tool4$survey$type == "audio","name"] %>% pull(name)
tool5.audio_cols <- kobo_tool.tool5$survey[kobo_tool.tool5$survey$type == "audio","name"] %>% pull(name)
tool6.audio_cols <- kobo_tool.tool6$survey[kobo_tool.tool6$survey$type == "audio","name"] %>% pull(name)
tool7.audio_cols <- kobo_tool.tool7$survey[kobo_tool.tool7$survey$type == "audio","name"] %>% pull(name)
tool8.audio_cols <- kobo_tool.tool8$survey[kobo_tool.tool8$survey$type == "audio","name"] %>% pull(name)
tool9.audio_cols <- kobo_tool.tool9$survey[kobo_tool.tool9$survey$type == "audio","name"] %>% pull(name)


for (sheet in names(clean_data.tool1_kdr)){
  if(any(tool1_kdr.audio_cols %in% names(clean_data.tool1_kdr[[sheet]]))){
    missing_qa_log <- rbind(
      missing_qa_log,
      log_questions(data= clean_data.tool1_kdr[[sheet]], columns = tool1_kdr.audio_cols[tool1_kdr.audio_cols %in% names(clean_data.tool1_kdr[[sheet]])], suffix="Translation", sheet=sheet)
    )
  }
}


missing_qa_log <- rbind(
  missing_qa_log,
  log_questions(data = clean_data.tool1$data, columns = tool1.audio_cols, suffix = "Translation", sheet = "data") %>% mutate(tool = "Tool 1"),
  log_questions(data = clean_data.tool2$data, columns = tool2.audio_cols, suffix = "Translation", sheet = "data") %>% mutate(tool = "Tool 2"),
  log_questions(data = clean_data.tool3$data, columns = tool3.audio_cols, suffix = "Translation", sheet = "data") %>% mutate(tool = "Tool 3"),
  log_questions(data = clean_data.tool4$data, columns = tool4.audio_cols, suffix = "Translation", sheet = "data") %>% mutate(tool = "Tool 4"),
  log_questions(data = clean_data.tool5$data, columns = tool5.audio_cols, suffix = "Translation", sheet = "data") %>% mutate(tool = "Tool 5"),
  log_questions(data = clean_data.tool6$data, columns = tool6.audio_cols, suffix = "Translation", sheet = "data") %>% mutate(tool = "Tool 6"),
  log_questions(data = clean_data.tool7$data, columns = tool7.audio_cols, suffix = "Translation", sheet = "data") %>% mutate(tool = "Tool 7"),
  log_questions(data = clean_data.tool8$data, columns = tool8.audio_cols, suffix = "Translation", sheet = "data") %>% mutate(tool = "Tool 8"),
  # log_questions(data = clean_data.tool9$Questions_Repeat, columns = "A15_Audio", suffix = "Translation", sheet = "Questions_Repeat"),
  log_questions(data = clean_data.tool9$data, columns = "Surveyor_Comments", suffix = "Translation", sheet = "data") %>% mutate(tool = "Tool 9")
)


# Images
tool1_kdr.image_cols <- kobo_tool.tool1_kdr$survey[kobo_tool.tool1_kdr$survey$type == "image","name"] %>% pull(name)
tool1.image_cols <- kobo_tool.tool1$survey[kobo_tool.tool1$survey$type == "image","name"] %>% pull(name) 
tool2.image_cols <- kobo_tool.tool2$survey[kobo_tool.tool2$survey$type == "image","name"] %>% pull(name)
tool3.image_cols <- kobo_tool.tool3$survey[kobo_tool.tool3$survey$type == "image","name"] %>% pull(name)
tool4.image_cols <- kobo_tool.tool4$survey[kobo_tool.tool4$survey$type == "image","name"] %>% pull(name)
tool5.image_cols <- kobo_tool.tool5$survey[kobo_tool.tool5$survey$type == "image" & kobo_tool.tool5$survey$name != "C11" ,"name"] %>% pull(name)
tool6.image_cols <- kobo_tool.tool6$survey[kobo_tool.tool6$survey$type == "image","name"] %>% pull(name)
tool7.image_cols <- kobo_tool.tool7$survey[kobo_tool.tool7$survey$type == "image","name"] %>% pull(name)
tool8.image_cols <- kobo_tool.tool8$survey[kobo_tool.tool8$survey$type == "image","name"] %>% pull(name)
tool9.image_cols <- kobo_tool.tool9$survey[kobo_tool.tool9$survey$type == "image","name"] %>% pull(name)


missing_qa_log_img <- data.frame()

# Tool1 KDR
for(sheet in names(clean_data.tool1_kdr)){
  if(any(tool1_kdr.image_cols %in% names(clean_data.tool1_kdr[[sheet]]))){
    missing_qa_log_img <- rbind(
      missing_qa_log_img,
      log_questions(data= clean_data.tool1_kdr[[sheet]], columns = tool1_kdr.image_cols[tool1_kdr.image_cols %in% names(clean_data.tool1_kdr[[sheet]])], suffix="QA", sheet=sheet) %>% 
        mutate(tool = "Tool 1 - KDR")
    )
  }
}

# Tool1
for(sheet in names(clean_data.tool1)){
  if(any(tool1.image_cols %in% names(clean_data.tool1[[sheet]]))){
    missing_qa_log_img <- rbind(
      missing_qa_log_img,
      log_questions(data= clean_data.tool1[[sheet]], columns = tool1.image_cols[tool1.image_cols %in% names(clean_data.tool1[[sheet]])], suffix="QA", sheet=sheet) %>% 
        mutate(tool = "Tool 1")
    )
  }
}

# Tool2
for(sheet in names(clean_data.tool2)){
  if(any(tool2.image_cols %in% names(clean_data.tool2[[sheet]]))){
    missing_qa_log_img <- rbind(
      missing_qa_log_img,
      log_questions(data= clean_data.tool2[[sheet]], columns = tool2.image_cols[tool2.image_cols %in% names(clean_data.tool2[[sheet]])], suffix="QA", sheet=sheet) %>% 
        mutate(tool = "Tool 2")
    )
  }
}

# Tool3
for(sheet in names(clean_data.tool3)){
  if(any(tool3.image_cols %in% names(clean_data.tool3[[sheet]]))){
    missing_qa_log_img <- rbind(
      missing_qa_log_img,
      log_questions(data= clean_data.tool3[[sheet]], columns = tool3.image_cols[tool3.image_cols %in% names(clean_data.tool3[[sheet]])], suffix="QA", sheet=sheet) %>% 
        mutate(tool = "Tool 3")
    )
  }
}

# Tool4
for(sheet in names(clean_data.tool4)){
  if(any(tool4.image_cols %in% names(clean_data.tool4[[sheet]]))){
    missing_qa_log_img <- rbind(
      missing_qa_log_img,
      log_questions(data= clean_data.tool4[[sheet]], columns = tool4.image_cols[tool4.image_cols %in% names(clean_data.tool4[[sheet]])], suffix="QA", sheet=sheet) %>% 
        mutate(tool = "Tool 4")
    )
  }
}


# Tool5
for(sheet in names(clean_data.tool5)){
  if(any(tool5.image_cols %in% names(clean_data.tool5[[sheet]]))){
    missing_qa_log_img <- rbind(
      missing_qa_log_img,
      log_questions(data= clean_data.tool5[[sheet]], columns = tool5.image_cols[tool5.image_cols %in% names(clean_data.tool5[[sheet]])], suffix="QA", sheet=sheet) %>% 
        mutate(tool = "Tool 5")
    )
  }
}

missing_qa_log_img <- rbind(
  missing_qa_log_img,
  log_questions(data= clean_data.tool5$data, columns = "C11_1", suffix="QA", sheet=sheet) %>% 
    mutate(tool = "Tool 5")
)


# Tool6
for(sheet in names(clean_data.tool6)){
  if(any(tool6.image_cols %in% names(clean_data.tool6[[sheet]]))){
    missing_qa_log_img <- rbind(
      missing_qa_log_img,
      log_questions(data= clean_data.tool6[[sheet]], columns = tool6.image_cols[tool6.image_cols %in% names(clean_data.tool6[[sheet]])], suffix="QA", sheet=sheet) %>% 
        mutate(tool = "Tool 6")
    )
  }
}

# Tool7
for(sheet in names(clean_data.tool7)){
  if(any(tool7.image_cols %in% names(clean_data.tool7[[sheet]]))){
    missing_qa_log_img <- rbind(
      missing_qa_log_img,
      log_questions(data= clean_data.tool7[[sheet]], columns = tool7.image_cols[tool7.image_cols %in% names(clean_data.tool7[[sheet]])], suffix="QA", sheet=sheet) %>% 
        mutate(tool = "Tool 7")
    )
  }
}


# Tool8
for(sheet in names(clean_data.tool8)){
  if(any(tool8.image_cols %in% names(clean_data.tool8[[sheet]]))){
    missing_qa_log_img <- rbind(
      missing_qa_log_img,
      log_questions(data= clean_data.tool8[[sheet]], columns = tool8.image_cols[tool8.image_cols %in% names(clean_data.tool8[[sheet]])], suffix="QA", sheet=sheet) %>% 
        mutate(tool = "Tool 8")
    )
  }
}

# Tool9
for(sheet in names(clean_data.tool9)){
  if(any(tool9.image_cols %in% names(clean_data.tool9[[sheet]]))){
    missing_qa_log_img <- rbind(
      missing_qa_log_img,
      log_questions(data= clean_data.tool9[[sheet]], columns = tool9.image_cols[tool9.image_cols %in% names(clean_data.tool9[[sheet]])], suffix="QA", sheet=sheet) %>% 
        mutate(tool = "Tool 9")
    )
  }
}


missing_qa_log <- rbind(
  missing_qa_log, 
  missing_qa_log_img
) %>% 
  filter(!question %in% c("Please_Add_Any_Relevant_Photo_QA", "Surveyor_Comments_Translation"))


rm(missing_qa_log_img)

