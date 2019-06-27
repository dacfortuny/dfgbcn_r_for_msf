library(readxl)
library(ggplot2)
library(dplyr)

# Read data
pss_data <- read_excel("data/PSS-Sample DataSet no password.xlsx")

# Data processing
pss_data <- as.data.frame(pss_data)
pss_data <- pss_data[colSums(!is.na(pss_data)) > 0]

vars_list <- sort(names(pss_data)[-c(1, 2)])  # sorted to ease search

vars_related_happiness <- c("would_you_recommend_the_hospital_to_your_family_or_community",
                            "how_happy_were_you_with_food_and_water",
                            "during_your_stay_in_the_hospital_how_would_you_rate_your_feeling_of_safety_or_security",
                            "how_happy_are_you_with_the_privacy_of_the_facilities",
                            "how_happy_are_you_with_the_cleanliness_of_the_facilities",
                            "how_happy_are_you_with_the_comfort_of_the_facilities",
                            "are_you_satisfied_with_the_availability_of_the_translation_services",
                            "How_happy_are_you_with_the_staff_working_in_the_facility",
                            "was_it_easy_to_identify_our_doctors_healthofficers_and_nurses",
                            "were_you_involved_in_the_discussions_when_key_decisions_had_to_be_made",
                            "did_you_understand_the_indications_the_doctors_prescribed_for_you_or_your_child_to_follow_at_home_if_you_had_any",
                            "Do_you_know_what_the_staff_did_to_treat_you_or_your_child",
                            "Before_going_to_another_service_were_you_informed_on_where_you_or_your_child_would_be_taken_to",
                            "where_you_or_your_care_taker_could_rest")

pss_data[vars_related_happiness] <- lapply(pss_data[vars_related_happiness], factor)
pss_data[vars_related_happiness] <- lapply(pss_data[vars_related_happiness], 
                                           function(x) {
                                             ordered(x, c("very_unhappy", "unhappy", "neutral", "happy", "very_happy"))
                                           }
)