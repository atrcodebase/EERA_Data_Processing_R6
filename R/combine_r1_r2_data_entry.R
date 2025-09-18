# name = "Tool1_Timetable1_Class2_Wednesday"
replace_label <- function(name) {
  digit <- sub(".*_([0-9]+)$", "\\1", name)
  label <- subjects[digit]
  sub("_([0-9]+)$", paste0("_", label), name)
}


switch_position <- function(name) {
  parts <- strsplit(name, "_")[[1]]
  paste(rev(parts), collapse = "_")
}

switch_position_class2 <- function(name) {
  parts <- strsplit(name, "_")[[1]]
  paste(parts[1], parts[3], parts[2], sep = "_")
}

# Read Round 1 data
clean_data.tool0.r1 <- read_xlsx_sheets("./input/data_entry_r1/EERA_Public_School_CBE_Data_Entry_Tool_Clean_Data_Revised 2024-02-05.xlsx")

# Read Round 1 tool
kobo_tool.tool0.r1 <- read_xlsx_sheets("./input/data_entry_r1/EERA+Public+School_CBE+-+Data+Entry+Tool+(1).xlsx")

subjects <- kobo_tool.tool0.r1$choices |>
  filter(list_name == "subjects") |>
  mutate(value = as.integer(value)) |>
  select(value, label)

subjects <- setNames(as.character(subjects$label), subjects$value)

# Fixing the Subject column names -- Round1
dd <- clean_data.tool0.r1$Tool1_Timetable1_Repeat 

# i = 1
for(i in seq_along(names(dd))){
  print(i)
  cname = names(dd)[i]
  
  if((startsWith(cname, "Tool1_Timetable1_Class2_") & !grepl("_Other", cname)) | (startsWith(cname, "Tool1_Timetable1_Class1_") & !grepl("_Other", cname))) {
    names(dd)[i] <- replace_label(names(dd)[i])
    
    if(startsWith(cname, "Tool1_Timetable1_Class2_")){
      names(dd)[i] <- sub("Tool1_Timetable1_", "", names(dd)[i])
      names(dd)[i] <- switch_position_class2(names(dd)[i])
    }
    
    if(startsWith(cname, "Tool1_Timetable1_Class1_")){
      names(dd)[i] <- sub("Tool1_Timetable1_Class1_", "", names(dd)[i])
      names(dd)[i] <- switch_position(names(dd)[i])
    }
  }
}

clean_data.tool0.r1$Tool1_Timetable1_Repeat <- dd 

clean_data.tool0.r1$Tool1_Timetable1_Repeat <- clean_data.tool0.r1$Tool1_Timetable1_Repeat |>
  mutate(Round = "Round 1")

# Fixing the Subject column names -- Round2
subjects2 <- kobo_tool.tool0$choices |>
  filter(list_name == "subjects") |>
  mutate(value = as.integer(value)) |>
  select(value, label)

subjects2 <- setNames(as.character(subjects2$label), subjects2$value)

dd2 <- clean_data.tool0.report$Tool1_Timetable1_Repeat

for(i in seq_along(names(dd2))){
  print(i)
  cname = names(dd2)[i]
  
  if((startsWith(cname, "Tool1_Timetable1_Class2_") & !grepl("_Other", cname)) | (startsWith(cname, "Tool1_Timetable1_Class1_") & !grepl("_Other", cname))) {
    names(dd2)[i] <- replace_label(names(dd2)[i])
    
    if(startsWith(cname, "Tool1_Timetable1_Class2_")){
      names(dd2)[i] <- sub("Tool1_Timetable1_", "", names(dd2)[i])
      names(dd2)[i] <- switch_position_class2(names(dd2)[i])
    }
    
    if(startsWith(cname, "Tool1_Timetable1_Class1_")){
      names(dd2)[i] <- sub("Tool1_Timetable1_Class1_", "", names(dd2)[i])
      names(dd2)[i] <- switch_position(names(dd2)[i])
    }
  }
}

clean_data.tool0.report$Tool1_Timetable1_Repeat <- dd2 


clean_data.tool0.report$Tool1_Timetable1_Repeat <- clean_data.tool0.report$Tool1_Timetable1_Repeat |>
  mutate(Round = "Round 2")


# Combination
notinr2 <- names(dd[,!names(dd) %in% names(dd2)])
notinr1 <- names(dd2[,!names(dd2) %in% names(dd)])

clean_data.tool0.report$Tool1_Timetable1_Repeat <- clean_data.tool0.report$Tool1_Timetable1_Repeat |>
  left_join(clean_data.tool0.report$data |> select(KEY, all_of(notinr2)), by = c("PARENT_KEY" = "KEY")) |>
  select(-all_of(notinr1))


Tool1_Timetable1_Repeat_R1_R2 <- plyr::rbind.fill(
  clean_data.tool0.r1$Tool1_Timetable1_Repeat,
  clean_data.tool0.report$Tool1_Timetable1_Repeat
)


write.xlsx(Tool1_Timetable1_Repeat_R1_R2, "output/data_entry_combined/EERA_Data_Entry_Tool_R1_R2_Tool1_Timetable1_Repeat.xlsx")
