library(atRfunctions)
library(dplyr)
library(readxl)
library(openxlsx)

# Read the tools ---------------------------------------------------------------
tool1 <- read_excel("./input/tools/Tool 1.EERA Public School - Headmaster Principle Interview - R5.xlsx") %>%  mutate(name = trimws(name))
tool2 <- read_excel("./input/tools/Tool 2.EERA Public School - Light Tool - R5.xlsx") %>%  mutate(name = trimws(name))
tool3 <- read_excel("./input/tools/Tool 3.EERA Public School - Student Document & Headcount - R5.xlsx") %>%  mutate(name = trimws(name))
tool4 <- read_excel("./input/tools/Tool 4.EERA Public School - Teacher Tool - R5.xlsx") %>%  mutate(name = trimws(name))
tool5 <- read_excel("./input/tools/Tool 5.EERA Public School - WASH Observation - R5.xlsx") %>%  mutate(name = trimws(name))
tool6 <- read_excel("./input/tools/Tool 6.EERA Public School_CBE - Parent Tool - R5.xlsx") %>%  mutate(name = trimws(name))
tool7 <- read_excel("./input/tools/Tool 7.EERA Public School_CBE - Shura Tool - R5.xlsx") %>%  mutate(name = trimws(name))
tool8 <- read_excel("./input/tools/Tool 8.EERA CBE - Class Level Tool - R5.xlsx") %>%  mutate(name = trimws(name))
tool9 <- read_excel("./input/tools/Tool 9.EERA CBE - IP Level Tool - R5.xlsx") %>%  mutate(name = trimws(name))
tool0 <- read_excel("./input/tools/Tool 0.EERA Public School_CBE - Data Entry Tool - R5.xlsx") %>% mutate(name = trimws(name))
tool1_kdr <- read_excel("./input/tools/Tool 11.EERA Public School - Headmaster Principle Interview KDR- R5.xlsx")

# Create the relevancy Files ---------------------------------------------------
relevancy_file0 <- create_relevancy_file(tool0, pull(tool0[which(endsWith(tool0$name, "_Translation") | endsWith(tool0$name, "_QA") | endsWith(tool0$name, "_caption") | endsWith(tool0$name, "_Caption") |
                                                                   endsWith(tool0$name, "_Caption")), "name"]))

relevancy_file1 <- create_relevancy_file(tool1, pull(tool1[which(endsWith(tool1$name, "_Translation") | endsWith(tool1$name, "_QA") | endsWith(tool1$name, "_caption") | endsWith(tool1$name, "_Caption") |
                                                                   endsWith(tool1$name, "_Caption")), "name"]))
                                                  

relevancy_file2 <- create_relevancy_file(tool2, pull(tool2[which(endsWith(tool2$name, "_Translation") | endsWith(tool2$name, "_QA") | endsWith(tool2$name, "_caption") | endsWith(tool2$name, "_Caption") |
                                                                   endsWith(tool2$name, "_Caption")), "name"]))


relevancy_file3 <- create_relevancy_file(tool3, pull(tool3[which(endsWith(tool3$name, "_Translation") | endsWith(tool3$name, "_QA") | endsWith(tool3$name, "_caption") | endsWith(tool3$name, "_Caption") |
                                                                   endsWith(tool3$name, "_Caption")), "name"]))


relevancy_file4 <- create_relevancy_file(tool4, pull(tool4[which(endsWith(tool4$name, "_Translation") | endsWith(tool4$name, "_QA") | endsWith(tool4$name, "_caption") | endsWith(tool4$name, "_Caption") |
                                                      endsWith(tool4$name, "_Caption")), "name"]))


relevancy_file5 <- create_relevancy_file(tool5, pull(tool5[which(endsWith(tool5$name, "_Translation") | endsWith(tool5$name, "_QA") | endsWith(tool5$name, "_caption") | endsWith(tool5$name, "_Caption") |
                                                                   endsWith(tool5$name, "_Caption")), "name"]))


relevancy_file6 <- create_relevancy_file(tool6, pull(tool6[which(endsWith(tool6$name, "_Translation") | endsWith(tool6$name, "_QA") | endsWith(tool6$name, "_caption") | endsWith(tool6$name, "_Caption") |
                                                                   endsWith(tool6$name, "_Caption")), "name"]))

relevancy_file7 <- create_relevancy_file(tool7, pull(tool7[which(endsWith(tool7$name, "_Translation") | endsWith(tool7$name, "_QA") | endsWith(tool7$name, "_caption") | endsWith(tool7$name, "_Caption") |
                                                                   endsWith(tool7$name, "_Caption")), "name"]))

relevancy_file8 <- create_relevancy_file(tool8, pull(tool8[which(endsWith(tool8$name, "_Translation") | endsWith(tool8$name, "_QA") | endsWith(tool8$name, "_caption") | endsWith(tool8$name, "_Caption") |
                                                                   endsWith(tool8$name, "_Caption")), "name"]))

relevancy_file9 <- create_relevancy_file(tool9, pull(tool9[which(endsWith(tool9$name, "_Translation") | endsWith(tool9$name, "_QA") | endsWith(tool9$name, "_caption") | endsWith(tool9$name, "_Caption") |
                                                                   endsWith(tool9$name, "_Caption")), "name"]))

relevancy_file1_kdr <- create_relevancy_file(tool1_kdr, pull(tool1_kdr[which(endsWith(tool1_kdr$name, "_Translation") | endsWith(tool1_kdr$name, "_QA") | endsWith(tool1_kdr$name, "_caption") | endsWith(tool1_kdr$name, "_Caption") |
                                                                       endsWith(tool1_kdr$name, "_Caption")), "name"]))

# Export outputs ---------------------------------------------------------------
write.xlsx(relevancy_file1, "./input/relevancy_files/relevancy_file_tool1.xlsx")
write.xlsx(relevancy_file1_kdr, "./input/relevancy_files/relevancy_file_tool1_kdr.xlsx")
write.xlsx(relevancy_file2, "./input/relevancy_files/relevancy_file_tool2.xlsx")
write.xlsx(relevancy_file3, "./input/relevancy_files/relevancy_file_tool3.xlsx")
write.xlsx(relevancy_file4, "./input/relevancy_files/relevancy_file_tool4.xlsx")
write.xlsx(relevancy_file5, "./input/relevancy_files/relevancy_file_tool5.xlsx")
write.xlsx(relevancy_file6, "./input/relevancy_files/relevancy_file_tool6.xlsx")
write.xlsx(relevancy_file7, "./input/relevancy_files/relevancy_file_tool7.xlsx")
write.xlsx(relevancy_file8, "./input/relevancy_files/relevancy_file_tool8.xlsx")
write.xlsx(relevancy_file9, "./input/relevancy_files/relevancy_file_tool9.xlsx")
write.xlsx(relevancy_file0, "./input/relevancy_files/relevancy_file_tool0.xlsx")
