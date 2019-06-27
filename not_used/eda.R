# R for MSF: Exploratory Data Analysis

library(dlookr)
library(dplyr)
library(ggplot2)
library(ISLR)
library(psych)
library(readxl)


# READ FILE ---------------------------------------------------------------

DATA_FILE <- "data/PSS-Sample DataSet no password.xlsx"
pss_data <- read_excel(DATA_FILE)


# EXPLORE VARIABLES AND TYPES ---------------------------------------------

names(pss_data)

str(pss_data)

describe(pss_data)


# EXERCICE:
#
# 1. Have all the variables the correct type? If they do not, which should be the data type of each variable?


# EXPLORE Unit_of_the_hospital COLUMN (EXAMPLE) ---------------------------

pss_data$Unit_of_the_hospital

# Which type?

class(pss_data$Unit_of_the_hospital)

# Transform to factor

pss_data$Unit_of_the_hospital <- as.factor(pss_data$Unit_of_the_hospital)
class(pss_data$Unit_of_the_hospital)

pss_data$Unit_of_the_hospital

# Show distribution

plot(pss_data$Unit_of_the_hospital)

# Plot by group

unit_data <- pss_data %>% select(Unit_of_the_hospital, Round)
unit_data
ggplot(unit_data, aes(x = Unit_of_the_hospital)) + geom_bar() + facet_grid(~Round) + theme_bw()


# EXPLORE how_happy_were_you_with_food_and_water COLUMN (EXAMPLE) ---------

pss_data$how_happy_were_you_with_food_and_water

# Which type?

class(pss_data$how_happy_were_you_with_food_and_water)

# Transform to factor

pss_data$how_happy_were_you_with_food_and_water <- as.factor(pss_data$how_happy_were_you_with_food_and_water)
class(pss_data$how_happy_were_you_with_food_and_water)

pss_data$how_happy_were_you_with_food_and_water

# Assign missing values

pss_data$how_happy_were_you_with_food_and_water[is.na(pss_data$how_happy_were_you_with_food_and_water)] <- "neutral"
pss_data$how_happy_were_you_with_food_and_water

# Create new column: level_of_satisfaction_with_food_and_water

pss_data$level_of_satisfaction_with_food_and_water <- NA
names(pss_data)
pss_data$level_of_satisfaction_with_food_and_water[pss_data$how_happy_were_you_with_food_and_water == "very_unhappy"] <- 0
pss_data$level_of_satisfaction_with_food_and_water[pss_data$how_happy_were_you_with_food_and_water == "unhappy"] <- 1
pss_data$level_of_satisfaction_with_food_and_water[pss_data$how_happy_were_you_with_food_and_water == "neutral"] <- 2
pss_data$level_of_satisfaction_with_food_and_water[pss_data$how_happy_were_you_with_food_and_water == "happy"] <- 3
pss_data$level_of_satisfaction_with_food_and_water[pss_data$how_happy_were_you_with_food_and_water == "very_happy"] <- 4


# EXAMPLE WITH NUMERICAL VALUE --------------------------------------------

carseats <- ISLR::Carseats
carseats
describe(carseats)

plot_correlate(carseats)