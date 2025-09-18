# removing deleted and pilot interviews -----------------------------------
# Tool 0 - Data Entry
clean_data.tool0$data <- clean_data.tool0$data %>% filter(KEY %in% c(approved_keys_ps, approved_keys_cbe) & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))

for (sheet in names(clean_data.tool0)[c(2,3,4,9)]) {
  clean_data.tool0[[sheet]] <- clean_data.tool0[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool0$data$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
}

for (sheet in names(clean_data.tool0)[c(5,6,7,8)]) {
  clean_data.tool0[[sheet]] <- clean_data.tool0[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool0$Tool1_Timetable_Year$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
}

# Tool 1 - Headmaster - KDR
clean_data.tool1_kdr$data <- clean_data.tool1_kdr$data %>% filter(KEY %in% c(approved_keys_ps) & !KEY %in% deleted_keys_ps)
for(sheet in names(clean_data.tool1_kdr)[-1]){
  clean_data.tool1_kdr[[sheet]] <- clean_data.tool1_kdr[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool1_kdr$data$KEY & !KEY %in% deleted_keys_ps)
}


# Tool 1 - Headmaster
clean_data.tool1$data <- clean_data.tool1$data %>% filter(KEY %in% c(approved_keys_ps) & !KEY %in% deleted_keys_ps)
for(sheet in names(clean_data.tool1)[-1]){
  clean_data.tool1[[sheet]] <- clean_data.tool1[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
}

# Tool 2 - Light
clean_data.tool2$data <- clean_data.tool2$data %>% filter(KEY %in% c(approved_keys_ps) & !KEY %in% deleted_keys_ps)
for(sheet in names(clean_data.tool2)[-1]){
  clean_data.tool2[[sheet]] <- clean_data.tool2[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
}

# Tool 3 - Headcount
clean_data.tool3$data <- clean_data.tool3$data %>% filter(KEY %in% c(approved_keys_ps) & !KEY %in% deleted_keys_ps)
for(sheet in names(clean_data.tool3)[-1]){
  clean_data.tool3[[sheet]] <- clean_data.tool3[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
}

# Tool 4 - Teacher
clean_data.tool4$data <- clean_data.tool4$data %>% filter(KEY %in% c(approved_keys_ps) & !KEY %in% deleted_keys_ps)
for(sheet in names(clean_data.tool4)[-1]){
  clean_data.tool4[[sheet]] <- clean_data.tool4[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)
}

# Tool 5 - WASH
clean_data.tool5$data <- clean_data.tool5$data %>% filter(KEY %in% c(approved_keys_ps) & !KEY %in% deleted_keys_ps)
for(sheet in names(clean_data.tool5)[-1]){
  clean_data.tool5[[sheet]] <- clean_data.tool5[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)
}

# Tool 6 - Parent
clean_data.tool6$data <- clean_data.tool6$data %>% filter((KEY %in% c(approved_keys_ps) | KEY %in% c(approved_keys_cbe)) & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))
for(sheet in names(clean_data.tool6)[-1]){
  clean_data.tool6[[sheet]] <- clean_data.tool6[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool6$data$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
}

# Tool 7 - SHURA
clean_data.tool7$data <- clean_data.tool7$data %>% filter((KEY %in% c(approved_keys_ps) | KEY %in% c(approved_keys_cbe)) & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))
for(sheet in names(clean_data.tool7)[-1]){
  clean_data.tool7[[sheet]] <- clean_data.tool7[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool7$data$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
}


# Tool 8 - Class
clean_data.tool8$data <- clean_data.tool8$data %>% filter(KEY %in% c(approved_keys_cbe) & !KEY %in% deleted_keys_cbe)
for(sheet in names(clean_data.tool8)[-1]){
  clean_data.tool8[[sheet]] <- clean_data.tool8[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
}


# Tool 9 - IP
clean_data.tool9$data <- clean_data.tool9$data %>% filter(KEY %in% c(approved_keys_cbe) & !KEY %in% deleted_keys_cbe)
for(sheet in names(clean_data.tool9)[-1]){
  clean_data.tool9[[sheet]] <- clean_data.tool9[[sheet]] %>% filter(PARENT_KEY %in% clean_data.tool9$data$KEY & !KEY %in% deleted_keys_cbe)
}

