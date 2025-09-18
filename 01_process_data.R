# Organization:   ATR
# Date:           June 2025
# Script:         EERA Data Processing (Round 5)
# Author:         ATR Data Management Department

# Load required packages -------------------------------------------------------
rm(list = ls())
if(!require(tidyverse)) install.packages("tidyverse")
if(!require(googlesheets4)) install.packages("googlesheets4")
if(!require(openxlsx)) install.packages("openxlsx")
if(!require(readxl)) install.packages("readxl")
if(!require(readxl)) install.packages("lubridate")
if(!require(readxl)) install.packages("janitor")
if(!require(remotes)) install.packages("remotes")
if(!require(atRfunctions)) remotes::install_github("atrcodebase/atRfunctions")
`%notin%` <- Negate(`%in%`)
Coalesce = function(var) ifelse(is.na(var), 0, var)

# Declaring Global Variables ---------------------------------------------------
data_collection_start_date_ps = as.Date("13.09.2025", format("%d.%m.%Y")) # Confirm with QAT
data_collection_start_date_cbe = as.Date("13.09.2025", format("%d.%m.%Y")) # Confirm with QAT
# data_collection_end_date = as.Date("16.05.2024",  format("%d.%m.%Y"))
qa_sheet_url_ps = "https://docs.google.com/spreadsheets/d/1MRc8MACq80fLE4rt6TS8z5FfeZNdf-E0nfGSD5H9bjM/edit?gid=473078450#gid=473078450"
# qa_remarks_url = "https://docs.google.com/spreadsheets/d/1aCjwYFRctOIbgfCLrf2cFXXYmCd_JhSaGmajl5srcz8/edit?gid=1487655797#gid=1487655797"


# Rename DFs and Tools ---------------------------------------------------------
source("./R/rename_dfs_tools.R")

output_data_path = "output/"
sample_files_path = "input/sample/"

raw_data_path = list.files("input/raw_data/", full.names = T) %>% .[!grepl("/\\~\\$", .)] |> as.list() %>% setNames(gsub(".*Tool (\\d+).*", "tool\\1", .))
kobo_tools_path = list.files("input/tools/", full.names = T) %>% .[!grepl("/\\~\\$", .)] |> as.list() %>% setNames(gsub(".*Tool (\\d+).*", "tool\\1", .))
relevancy_files_path = list.files("input/relevancy_files/", full.names = T) %>% .[!grepl("/\\~\\$", .)] |> as.list() %>% setNames(gsub(".*tool(\\d+).*", "tool\\1", .))
meta_cols <- c("Site_Visit_ID", "EMIS_School_ID_CBE_KEY", "School_CBE_Name", "IP_Name", "Region", "Province", "District", "Area_Type", "Type_Of_School_CBE_Based_On_The_Sample", "School_CBE_Gender_Based_On_The_Sample", "School_Type_SV", "School_Gender_SV")
meta_cols.qa_sheet <- c(Visit_ID = "Site_Visit_ID", "School Code", "Sample_Type", Survey_Date = "SubmissionDate", Region = "Region", "KEY")

r6_dcd <- as.POSIXct("2025-09-13", format = "%Y-%m-%d", tz = "UTC")

# Read inputs ------------------------------------------------------------------
# Data sets
raw_data.tool0 = read_xlsx_sheets(raw_data_path$tool0)
raw_data.tool1_kdr = read_xlsx_sheets(raw_data_path$tool11)
raw_data.tool1 = read_xlsx_sheets(raw_data_path$tool1)
raw_data.tool2 = read_xlsx_sheets(raw_data_path$tool2)
raw_data.tool3 = read_xlsx_sheets(raw_data_path$tool3)
raw_data.tool4 = read_xlsx_sheets(raw_data_path$tool4)
raw_data.tool5 = read_xlsx_sheets(raw_data_path$tool5)
raw_data.tool6 = read_xlsx_sheets(raw_data_path$tool6)
raw_data.tool7 = read_xlsx_sheets(raw_data_path$tool7)
raw_data.tool8 = read_xlsx_sheets(raw_data_path$tool8)
raw_data.tool9 = read_xlsx_sheets(raw_data_path$tool9)

source("./R/filter_data_to_month.R")

# Tools
kobo_tool.tool0 = read_xlsx_sheets(kobo_tools_path$tool0)
kobo_tool.tool1 = read_xlsx_sheets(kobo_tools_path$tool1)
kobo_tool.tool1_kdr = read_xlsx_sheets(kobo_tools_path$tool11)
kobo_tool.tool2 = read_xlsx_sheets(kobo_tools_path$tool2)
kobo_tool.tool3 = read_xlsx_sheets(kobo_tools_path$tool3)
kobo_tool.tool4 = read_xlsx_sheets(kobo_tools_path$tool4)
kobo_tool.tool5 = read_xlsx_sheets(kobo_tools_path$tool5)
kobo_tool.tool6 = read_xlsx_sheets(kobo_tools_path$tool6)
kobo_tool.tool7 = read_xlsx_sheets(kobo_tools_path$tool7)
kobo_tool.tool8 = read_xlsx_sheets(kobo_tools_path$tool8)
kobo_tool.tool9 = read_xlsx_sheets(kobo_tools_path$tool9)


# read the relevancy files
relevancy_file.tool0 = read_xlsx_sheets(relevancy_files_path$tool0)
relevancy_file.tool1 = read_xlsx_sheets(relevancy_files_path$tool1)
relevancy_file.tool1_kdr = read_xlsx_sheets(relevancy_files_path$tool11)
relevancy_file.tool2 = read_xlsx_sheets(relevancy_files_path$tool2)
relevancy_file.tool3 = read_xlsx_sheets(relevancy_files_path$tool3)
relevancy_file.tool4 = read_xlsx_sheets(relevancy_files_path$tool4)
relevancy_file.tool5 = read_xlsx_sheets(relevancy_files_path$tool5)
relevancy_file.tool6 = read_xlsx_sheets(relevancy_files_path$tool6)
relevancy_file.tool7 = read_xlsx_sheets(relevancy_files_path$tool7)
relevancy_file.tool8 = read_xlsx_sheets(relevancy_files_path$tool8)
relevancy_file.tool9 = read_xlsx_sheets(relevancy_files_path$tool9)


# Read QA log from Google sheet ------------------------------------------------
qa_sheet = read_sheet(qa_sheet_url_ps, sheet = "QA_Log")
# To select the user to authenticate
2

correction_log = read_sheet(qa_sheet_url_ps, sheet = "Correction _Log")
# correction_log <- correction_log %>% 
#   left_join(
#     qa_sheet %>% select(KEY_Unique, SubmissionDate), by = "KEY_Unique"
#   )
correction_log <- correction_log %>%
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

# Turn NULL values to NA for old and new value columns
correction_log <- correction_log %>% 
  mutate(
    New_Value = as.character(New_Value),
    New_Value = case_when(
      is.null(New_Value) | New_Value == "NULL" ~ NA_character_,
      TRUE ~ New_Value
    ),
    old_value = as.character(old_value),
    old_value = case_when(
      is.null(old_value) | old_value == "NULL" ~ NA_character_,
      TRUE ~ old_value
    )
  ) %>% 
  # Exclude if Unique_key, question, new value, and old value combo is NA
  filter(!((is.na(KEY)|KEY %in% c("", " ")) & is.na(Question) & is.na(New_Value) & is.na(old_value)))


# Align correction log's variables and tool names
correction_log <- correction_log %>% 
  mutate(across(everything(), as.character)) |> 
  rename(
    key = KEY,
    KEY = "KEY_Unique",
    # KEY = "Key",
    question = "Question",
    new_value = "New_Value",
    tool = "Tool"
  ) %>% 
  mutate(
    # Rename tool names
    tool = case_when(
      tool == "EERA_Tool_1_Headmaster_Principal_Interview_AF25_R1" ~ "Tool 1 - Headmaster Interview",
      tool == "EERA_Tool_1_Headmaster_Principal_Interview_KDR_AF25_R1" ~ "Tool 1 - Headmaster Interview",
      tool == "EERA_Tool_2_Light_School_Visit_AF25_R1" ~ "Tool 2 - Light Tool",
      tool == "EERA_Tool_3_Student_Document_Headcount_AF25_R1" ~ "Tool 3 - Student Document & Headcount",
      tool == "EERA_Tool_4_Teacher_AF25_R1" ~ "Tool 4 - Teacher Tool",
      tool == "EERA_Tool_5_WASH_Observation_AF25_R1" ~ "Tool 5 - WASH Tool",
      tool == "EERA_Tool_6_Parent_Interview_AF25_R1" ~ "Tool 6 - Parent Tool",
      tool == "EERA_Tool_7_Shura_AF25_R1" ~ "Tool 7 - Shura Tool",
      tool == "EERA_Tool_8_Teacher_Tool_AF25_R1" ~ "Tool 8 - CBE Teacher Tool",
      tool == "EERA_Tool_9_IP_Level_AF25_R1" ~ "Tool 9 - IP Level",
      tool == "EERA_Tool_10_Data_Entry_AF25_R1" ~ "Tool 10 - Data Entry"
    )
  )


correction_log_ps <- correction_log |> filter(is.na(Sample_Type) | Sample_Type == "Public School")

correction_log_cbe <- correction_log %>% filter(Sample_Type == "CBE")

# Remove extra object
rm(correction_log)

deletion_log <- read_sheet(qa_sheet_url_ps, sheet = "To be removed from dataset")

# Prepare Data sets - Public School --------------------------------------------
qa_sheet <- qa_sheet |>
  rename(
    qa_status = QA_Status,
    tool = Tool, 
    KEY = KEY_Unique) |>
  mutate(
    qa_status = toupper(qa_status), 
    qa_status = case_when(
      is.na(qa_status) ~ "PENDING",
      TRUE ~ qa_status
    ),
    
    # Rename tool names
    tool = case_when(
      tool == "EERA_Tool_1_Headmaster_Principal_Interview_AF25_R1" ~ "Tool 1 - Headmaster Interview",
      tool == "EERA_Tool_1_Headmaster_Principal_Interview_KDR_AF25_R1" ~ "Tool 1 - Headmaster Interview",
      tool == "EERA_Tool_2_Light_School_Visit_AF25_R1" ~ "Tool 2 - Light Tool",
      tool == "EERA_Tool_3_Student_Document_Headcount_AF25_R1" ~ "Tool 3 - Student Document & Headcount",
      tool == "EERA_Tool_4_Teacher_AF25_R1" ~ "Tool 4 - Teacher Tool",
      tool == "EERA_Tool_5_WASH_Observation_AF25_R1" ~ "Tool 5 - WASH Tool",
      tool == "EERA_Tool_6_Parent_Interview_AF25_R1" ~ "Tool 6 - Parent Tool",
      tool == "EERA_Tool_7_Shura_AF25_R1" ~ "Tool 7 - Shura Tool",
      tool == "EERA_Tool_8_Teacher_Tool_AF25_R1" ~ "Tool 8 - CBE Teacher Tool",
      tool == "EERA_Tool_9_IP_Level_AF25_R1" ~ "Tool 9 - IP Level",
      tool == "EERA_Tool_10_Data_Entry_AF25_R1" ~ "Tool 10 - Data Entry"
    )
  )

qa_sheet_ps = qa_sheet |> filter(Sample_Type == "Public School")
qa_sheet_cbe = qa_sheet |> filter(Sample_Type == "CBE")

# With KDR
table(qa_sheet_ps$qa_status, qa_sheet_ps$tool, useNA = "always") %>% 
  addmargins(2)

# Without KDR
table(qa_sheet_ps |> filter(Province != "Kandahar") |> pull(qa_status), qa_sheet_ps |> filter(Province != "Kandahar") |> pull(tool), useNA = "always") %>%
  addmargins(2)

# Extract Approved Interviews
approved_keys_ps = qa_sheet_ps |> 
  filter(qa_status %in% c("APPROVED")) |> 
  pull(KEY) |> unique()

length(approved_keys_ps) == length(which(qa_sheet_ps$qa_status == "APPROVED"))

# Extract Pending interview to be included for weekly report
pending_key_ps = qa_sheet_ps |>
  filter(qa_status %in% c("PENDING")) |>
  pull(KEY) |> unique()

length(pending_key_ps) == length(which(qa_sheet_ps$qa_status %in% c("PENDING")))

# Extract deleted KEYs to be removed from data sets
deleted_keys_ps = deletion_log |> filter(Sample_Type == "Public School") |> pull(KEY_Unique)

# Prepare Data sets - CBE ------------------------------------------------------
table(qa_sheet_cbe$qa_status, qa_sheet_cbe$tool, useNA = "always") %>% 
  addmargins(2)

# Extract Approved Interviews
approved_keys_cbe = qa_sheet_cbe |> 
  filter(qa_status %in% c("APPROVED")) |> 
  pull(KEY) |> unique()

length(approved_keys_cbe) == length(which(qa_sheet_cbe$qa_status == "APPROVED"))


# Extract Pending interview to be included for weekly report
pending_key_cbe = qa_sheet_cbe |>
  filter(qa_status %in% c("PENDING")) |>
  pull(KEY) |> unique()

length(pending_key_cbe) == length(which(qa_sheet_cbe$qa_status %in% c("PENDING")))

# Extract deleted KEYs to be removed from data sets
deleted_keys_cbe = deletion_log |> filter(Sample_Type == "CBE") |> pull(KEY_Unique)

# Detailed Check log -----------------------------------------------------------
detailed_check_log <- read_sheet(qa_sheet_url_ps, sheet = "Detailed_Check")# detailed_check_log <- detailed_check_log %>% 
#   left_join(
#     qa_sheet %>% select(KEY, SubmissionDate), by = c("KEY_Unique" = "KEY")
#   )
detailed_check_log <- detailed_check_log %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)


detailed_check_log <- detailed_check_log %>% 
  mutate(
    # Rename tool names
    Tool = case_when(
      Tool == "EERA_Tool_1_Headmaster_Principal_Interview_AF25_R1" ~ "Tool 1 - Headmaster Interview",
      Tool == "EERA_Tool_1_Headmaster_Principal_Interview_KDR_AF25_R1" ~ "Tool 1 - Headmaster Interview",
      Tool == "EERA_Tool_2_Light_School_Visit_AF25_R1" ~ "Tool 2 - Light Tool",
      Tool == "EERA_Tool_3_Student_Document_Headcount_AF25_R1" ~ "Tool 3 - Student Document & Headcount",
      Tool == "EERA_Tool_4_Teacher_AF25_R1" ~ "Tool 4 - Teacher Tool",
      Tool == "EERA_Tool_5_WASH_Observation_AF25_R1" ~ "Tool 5 - WASH Tool",
      Tool == "EERA_Tool_6_Parent_Interview_AF25_R1" ~ "Tool 6 - Parent Tool",
      Tool == "EERA_Tool_7_Shura_AF25_R1" ~ "Tool 7 - Shura Tool",
      Tool == "EERA_Tool_8_Teacher_Tool_AF25_R1" ~ "Tool 8 - CBE Teacher Tool",
      Tool == "EERA_Tool_9_IP_Level_AF25_R1" ~ "Tool 9 - IP Level",
      Tool == "EERA_Tool_10_Data_Entry_AF25_R1" ~ "Tool 10 - Data Entry"
    )
  )

photo_status_ps <- detailed_check_log %>% 
  filter(Check_Type %in% c("image", "text") & !is.na(Check_Status) & Sample_Type == "Public School") %>% # `QA Status` == "Approved"
  filter(!(Check_Status == "Verified" & Check_Type == "text"))

photo_status_cbe <- detailed_check_log %>% 
  filter(Check_Type %in% c("image", "text") & !is.na(Check_Status) & Sample_Type == "CBE") %>%  # `QA Status` == "Approved"
  filter(!(Check_Status == "Verified" & Check_Type == "text"))

# convert numeric dates to date and time formats -------------------------------
source("R/convert_numbers_to_date_time.R")


# Apply Photo status log -------------------------------------------------------
if(nrow(photo_status_ps) > 0 | nrow(photo_status_cbe) > 0){ source("R/update_photo_status.R") }


# Apply correction log ---------------------------------------------------------
if(nrow(correction_log_ps) > 0 | nrow(correction_log_cbe) > 0) { source("R/apply_correction_log.R") }


# Remove the rejected and pilot interviews -------------------------------------
source("R/remove_rejected_interviews.R")


# Merge meta data from main sheet to repeating groups --------------------------
source("R/main_sheet_to_repeat_sheets.R")


# Update select multiple binary variables --------------------------------------
source("R/fix_select_multiple_questions.R") 


# Check repeat sheet count -----------------------------------------------------
source("R/check_repeat_sheet_counts.R")


# missing translations (for QA)-------------------------------------------------
source("R/create_translation_log.R")


# missing qa (for QA)-----------------------------------------------------------
source("R/missing_qa.R")


# Check select multiple variables ----------------------------------------------
source("R/check_select_multiple_questions.R")


# re-calculate the calculated variables and compare any changes not applied - kDR left
source("R/calculate_cols_check.R")


# Outlier Check ----------------------------------------------------------- PENDING - RUN FOR FINAL TURN
source("R/check_outliers.R")


# Relevancy Check --------------------------------------------------------------
source("R/check_relevancies.R")


# Check the responses with the tool --------------------------------------------
source("R/compare_df_values_with_tool.R")


# attach value labels  ---------------------------------------------------------
source("R/attach_labels.R")


detach("package:cleaninginspectoR", unload=TRUE)
detach("package:dplyr", unload=TRUE)
library(dplyr)

# Logical inconsistencies ------------------------------------------------- Done
source("R/logical_checks.R")


# remove extra columns  --------------------------------------------------------
source("R/remove_extra_columns.R")


# attach labels to calculates cols ---------------------------------------------
source("R/attach_calculate_label.R")


# change 7777, 8888, 9999 to Labels  -------------------------------------------
source("R/recode_to_na.R")


# export data sets and issues --------------------------------------------- DONE
source("R/export_outputs.R")

