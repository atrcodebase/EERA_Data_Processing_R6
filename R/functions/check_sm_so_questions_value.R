check_so_sm_questions = function(df, uuid_col = "KEY", choice_seprator = " ", group_seprator = "_", kobotool.survey, kobotool.choices, external_choices = NULL){
  if(!require(tidyverse)) install.packages("tidyverse")
  if (!is.null(external_choices)) kobotool.choices = bind_rows(kobotool.choices, external_choices)
  if ((is.null(external_choices) |!is.data.frame(external_choices)) & any(grepl("select_(one|multiple)_(external|from_file)", kobotool.survey$type))) 
    stop("Please provide the external choices sheet or filter the qustion from Kobo Tool to ignore the check.")
  # stop if the column type, list_name, and name is not available in the survey sheet
  # stop if the column list_name and name is not available in the choices sheet
  
  # Initializing the required variables
  so_question_types = c("select_one", "select_one_external", "select_one_from_file")
  sm_question_types = c("select_multiple", "select_multiple_external", "select_multiple_from_file")
  
  kobotool.survey <- kobotool.survey %>%
    separate(type, into = c("question_type", "list_name"), sep = " ", remove = F, extra = "drop") %>% 
    select(question_type, list_name, question_name = name)
  
  kobotool_df = kobotool.survey %>% 
    left_join(
      kobotool.choices %>% select(list_name, choice_name = value),
      by="list_name", relationship = "many-to-many") %>% 
    mutate(choice_name = gsub("\\..*","", choice_name)) %>% 
    filter(!is.na(list_name)) %>% 
    mutate(question_choice = paste0(question_name, group_seprator, choice_name))
  
  # creating the list of 'select_one' questions and it's corresponding data frame
  so_questions <- kobotool.survey %>% filter(question_type %in% so_question_types) %>% pull(question_name) %>% unique()
  df_so <- df[so_questions[so_questions %in% names(df)]]
  
  # creating the list of 'select_one' questions and it's corresponding data frame
  sm_questions = kobotool_df %>% filter(question_type %in% sm_question_types) %>% pull(question_choice) %>% unique()
  df_sm <- df %>% type.convert(as.is = T) %>% select(any_of(sm_questions))
  
  ### The below code checks each 'select_multiple' question and verifies that the available choices are accurate and available in choices list.
  check_so_questions = function(values, q_name, uuids, kobotool_df){
    choices = kobotool_df$choice_name[kobotool_df$question_name == q_name]
    condition = !values %in% choices & !is.na(values)
    if (any(condition)){
      res = data.frame(uuid = uuids[condition],
                       invalid_opts = values[condition])
      res$question_name = q_name
      return(res)
    }
  }
  
  so_logs = data.frame(uuid = character(), invalid_opts = character(), question_name = character())
  
  if (ncol(df_so) > 0) {
    for (column in seq_along(df_so)) {
      so_logs <- rbind(
        so_logs,
        check_so_questions(
          values = df_so[[column]],
          q_name = names(df_so[column]),
          uuids = df$KEY,
          kobotool_df = kobotool_df
        )
      )
      
      cat("checking column", names(df_so[column]), "\n")
    }
    
    so_logs <- so_logs %>% filter(!is.na(invalid_opts) & invalid_opts != "") %>% mutate(question_type = "Select_one", issue = "The choice is not available in/not aligned with Kobo Tool")
  }
  

  ### Verifies if the binary values assigned to each 'select_multiple' question are in 0 and 1.
  check_sm_questions = function(values, q_name, uuids){
    condition = !values %in% c(1,0) & !is.na(values)
    if (any(condition)) {
      res = data.frame(uuid = uuids[condition],
                       invalid_opts = values[condition])
      res$question_name = q_name
      return(res)
    }
  }
  
  sm_logs = data.frame(uuid = character(), invalid_opts = character(), question_name = character())
  
  if (ncol(df_sm) > 0) {
    for (column in seq_along(df_sm)) {
      sm_logs <- rbind(
        sm_logs,
        check_sm_questions(
          values = df_sm[[column]],
          q_name = names(df_sm[column]),
          uuids = df$KEY
        )
      )
      
      cat("checking column", names(df_sm[column]), "\n")
    }
    sm_logs <- sm_logs %>% filter(!is.na(invalid_opts) & invalid_opts != "") %>% mutate(question_type = "Select_multiple", issue = "The choice is not available in/not aligned with Kobo Tool")
  }
  
  # checking the SM parent question
  # sm_questions = kobotool.survey %>% filter(question_type %in% sm_question_types)
  # df_sm <- df %>% type.convert(as.is = T) %>% select(any_of(sm_questions), all_of(uuid_col))
  # To be developed
  
  final_result_df = rbind(so_logs, sm_logs)
  
  return(final_result_df)
}