# tool 0
raw_data.tool0$data <- raw_data.tool0$data %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

for(sheet in names(raw_data.tool0)[c(2, 3, 4, 9)]){
  raw_data.tool0[[sheet]] <- raw_data.tool0[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool0$data$KEY)
}

for(sheet in names(raw_data.tool0)[c(5, 6, 7, 8)]){
  raw_data.tool0[[sheet]] <- raw_data.tool0[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool0$Tool1_Timetable_Year$KEY)
}


# tool 1
raw_data.tool1$data <- raw_data.tool1$data %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

for(sheet in names(raw_data.tool1)[-1]){
  raw_data.tool1[[sheet]] <- raw_data.tool1[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool1$data$KEY)
}

# tool 2
raw_data.tool2$data <- raw_data.tool2$data %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

for(sheet in names(raw_data.tool2)[-1]){
  raw_data.tool2[[sheet]] <- raw_data.tool2[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool2$data$KEY)
}

# tool 3
raw_data.tool3$data <- raw_data.tool3$data %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

for(sheet in names(raw_data.tool3)[-1]){
  raw_data.tool3[[sheet]] <- raw_data.tool3[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool3$data$KEY)
}

# tool 4
raw_data.tool4$data <- raw_data.tool4$data %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

for(sheet in names(raw_data.tool4)[-1]){
  raw_data.tool4[[sheet]] <- raw_data.tool4[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool4$data$KEY)
}


# tool 5
raw_data.tool5$data <- raw_data.tool5$data %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

for(sheet in names(raw_data.tool5)[-1]){
  raw_data.tool5[[sheet]] <- raw_data.tool5[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool5$data$KEY)
}

# tool 6
raw_data.tool6$data <- raw_data.tool6$data %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

for(sheet in names(raw_data.tool6)[-1]){
  raw_data.tool6[[sheet]] <- raw_data.tool6[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool6$data$KEY)
}

# tool 7
raw_data.tool7$data <- raw_data.tool7$data %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

for(sheet in names(raw_data.tool7)[-1]){
  raw_data.tool7[[sheet]] <- raw_data.tool7[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool7$data$KEY)
}

# tool 8
raw_data.tool8$data <- raw_data.tool8$data %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

for(sheet in names(raw_data.tool8)[-1]){
  raw_data.tool8[[sheet]] <- raw_data.tool8[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool8$data$KEY)
}

# tool 9
raw_data.tool9$data <- raw_data.tool9$data %>% 
  filter(as.POSIXct(SubmissionDate, format = "%Y-%m-%d", tz = "UTC") >= r6_dcd)

for(sheet in names(raw_data.tool9)[-1]){
  raw_data.tool9[[sheet]] <- raw_data.tool9[[sheet]] %>% 
    filter(PARENT_KEY %in% raw_data.tool9$data$KEY)
}
