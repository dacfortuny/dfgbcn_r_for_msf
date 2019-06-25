library(readxl)
library(ggplot2)

# Read data
pss_data <- read_excel("data/PSS-Sample DataSet no password.xlsx")

# Data processing
pss_data <- as.data.frame(pss_data)
pss_data <- pss_data[colSums(!is.na(pss_data)) > 0]

vars_list <- sort(names(pss_data)[-c(1, 2)])  # sorted to ease search

pss_data$How_happy_are_you_with_the_staff_working_in_the_facility <- 
  factor(pss_data$How_happy_are_you_with_the_staff_working_in_the_facility,
         levels = c("very_unhappy", "unhappy", "neutral", "happy", "very_happy"))