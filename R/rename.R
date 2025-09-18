library(rvest)
library(xml2)
source("R/functions/header_changer.R")

# Apply function on each sheet
add_labels <- function(data_list, tool){
  for(sheet in names(data_list)){
    data_list[[sheet]] <- xml_header_to_labels(data=data_list[[sheet]], tool.survey=tool$survey,tool.choices=tool$choices, label_col="label")
  }
  return(data_list)
}

# Rename
clean_data.tool1.report_anonym <- add_labels(data_list=clean_data.tool1.report_anonym, tool=kobo_tool.tool1)
clean_data.tool2.report_anonym <- add_labels(data_list=clean_data.tool2.report_anonym, tool=kobo_tool.tool2)
clean_data.tool3.report_anonym <- add_labels(data_list=clean_data.tool3.report_anonym, tool=kobo_tool.tool3)
clean_data.tool4.report_anonym <- add_labels(data_list=clean_data.tool4.report_anonym, tool=kobo_tool.tool4)
clean_data.tool5.report_anonym <- add_labels(data_list=clean_data.tool5.report_anonym, tool=kobo_tool.tool5)
clean_data.tool6.report_anonym <- add_labels(data_list=clean_data.tool6.report_anonym, tool=kobo_tool.tool6)
clean_data.tool7.report_anonym <- add_labels(data_list=clean_data.tool7.report_anonym, tool=kobo_tool.tool7)
clean_data.tool8.report_anonym <- add_labels(data_list=clean_data.tool8.report_anonym, tool=kobo_tool.tool8)
clean_data.tool9.report_anonym <- add_labels(data_list=clean_data.tool9.report_anonym, tool=kobo_tool.tool9)


