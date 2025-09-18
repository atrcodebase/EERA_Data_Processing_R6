# Add labels for Select multiple series columns
prepare_tool <- function(tool.survey, tool.choices, label_col, col_separator="_", group_seprator = "/") {
  # Filter SM questions
  sm_question <- tool.survey[grepl("select_multiple ",tool.survey$type),c("type","name",label_col)]
  sm_tool <- data.frame()
  
  i=1
  for (i in 1:nrow(sm_question)) {
    sm.type <- sm_question$type[i]
    choice_name <- gsub("select_multiple ","", sm.type)
    sm.name <- sm_question$name[i]
    sm.main_label <- sm_question[[label_col]][i]
    choices.name <- tool.choices$value[tool.choices$list_name%in%choice_name] %>% as.numeric() %>% round()
    choices.label <- tool.choices$label[tool.choices$list_name%in%choice_name]
    # Merge the response labels for all questions
    sm_tool <- bind_rows(sm_tool, 
                         data.frame(type=sm.type, 
                                    name = paste(sm.name,choices.name,sep = col_separator), 
                                    label = paste(sm.main_label,choices.label, sep = group_seprator)))
  }
  # Merge with the tool
  tool.survey <- bind_rows(tool.survey, sm_tool)
  
  # Name as label if label is missing
  tool.survey <- tool.survey %>% 
    mutate(label = case_when(
      is.na(label) ~ name, 
      TRUE ~ label)) 

  return(tool.survey)
}

remove_html_tags <- function(tool, column="label"){
  for (i in 1:length(tool[[column]])) {
    value = tool[[column]][i]
    tool[[column]][i] <- ifelse(grepl("<", value), html_text(read_html(value)), value)
  }
  
  return(tool)
}

# Adds labels
xml_header_to_labels <- function(data, tool.survey, tool.choices,label_col){

  # Remove HTML tags
  tool.survey <- remove_html_tags(tool.survey)
  # Add labels for Select multiple serices columsn
  tool.survey <- prepare_tool(tool.survey,tool.choices,label_col)
  
  # changing xml to labels
  for (i in 1:length(names(data))) {
    data.column_name <- names(data)[i]
    if (data.column_name %in% tool.survey$name) {
      label <- tool.survey[[label_col]][tool.survey$name%in%data.column_name]
      names(data)[i] <- label
    }
  }
  return(data)
}
