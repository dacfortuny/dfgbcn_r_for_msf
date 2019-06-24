# R for MSF: 1. Introduction to R


# BASIC OPERATIONS --------------------------------------------------------

1 + 1
2 - 1
2 * 3
4 / 2


# VARIABLES ---------------------------------------------------------------

number_one <- 1   # Assign value to varible with <- or =
number_two <- 2

number_one   # Display the value of the variable
number_two
print(number_one)

number_one + number_two   # Operations with variables

letter_a <- "A"   # Create text variables using "" or ''
letter_a
letter_a <- 'A'
letter_a
my_name <- "Didac"
my_name


# COMMENTS ----------------------------------------------------------------

number_one <- 3   # This is not true   # Comments are not executed
number_one


# BASIC DATA TYPES --------------------------------------------------------

numeric_variable <- 2   # Numeric variable
numeric_variable
class(numeric_variable)   # Returns the type of variable

character_variable <- "hello"   # Character variable
character_variable
class(character_variable)

logical_variable <- TRUE   # Logical variable (TRUE/FALSE)
logical_variable
class(logical_variable)


# VECTORS AND LISTS -------------------------------------------------------

c(1, 1, 2, 3, 5, 8)   # Create a new vector

vector_fibonacci <- c(1, 1, 2, 3, 5, 8)   # Assign vector to variable
vector_fibonacci

vector_pokemon <- c("pikachu", "bulbasaur", "charmander")   # Vector of character variales
vector_pokemon

vector_fibonacci * 10   # Operations with vectors (apply to each element of the vector)

vector_pokemon[1]   # Subset of the vector
vector_fibonacci[3:6]

vector_fibokemon <- c("pikachu", 2, TRUE)
vector_fibokemon


# EXERCICES ---------------------------------------------------------------

# 1. Which is the type of each of the members of the vector_fibokemon vector?


# LISTS -------------------------------------------------------------------

ages <- list(27, 35, 30, 37, 28)   # Create new list

ages <- list(27, 35, 30, "unknown")   # List with mixed types

names(ages) <- c("Paula", "Didac", "Ramon", "Ester")   # Named elements

ages[1]   # Subset of the list
ages["Paula"]
ages[c("Paula", "Didac")]

ages <- list(27, 35, 30, 37, 28)
names(ages) <- c("Paula", "Didac", "Ramon", "Ester", "Esmeralda")
ages_young <- (ages <= 30)   # Create a vector of logicals
ages[ages_young]   # Filters using logicals


# MISSING VALUES ----------------------------------------------------------

ages <- c(23, 35, 30, NA)
class(ages[4])


# COMPARISONS -------------------------------------------------------------

1 > 2               # Larger than
1 >= 2              # Larger or equal than
1 < 2               # Smaller than
1 <= 2              # Smaller or equal than
1 == 2              # Equal
1 != 2              # Not equal
(1 > 0) & (1 > 2)   # Condition 1 AND condition 2
(1 > 0) | (1 > 2)   # Condition 1 OR condition 3
1 %in% c(1, 2, 3)   # Value within a vector
!(1 == 2)           # Negates the resupt


# CONDITIONALS AND LOOPS --------------------------------------------------

letter <- "A"

# IF statements

if (letter == "A") {
    print("It's an A!")
}

letter <- "A"

if ((letter == "A") | (letter == "E") | (letter == "I") | (letter == "O") | (letter == "U")) {
    print("It's a vowel!")
}

if (letter %in% c("A", "E", "I", "O", "U")) {
    print("It's a vowel!")
}

# IF ELSE statements

letter <- "I"

if (letter %in% c("A", "E", "I", "O", "U")) {
    print("It's a vowel!")
} else {
    print("It's a consonant!")
}


# FOR LOOPS

letters <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J")

for (letter in letters) {
    print(letter)
    }
    if (letter %in% c("A", "E", "I", "O", "U")) {
        print("It's a vowel!")
    } else {
        print("It's a consonant!")
}


# FUNCTIONS ---------------------------------------------------------------

numbers <- c(1, 1, 2, 2)
sum(numbers)   # Function sum
mean(numbers)   # Function mean
max(numbers)   # Function max


# Useful functions

name <- "Didac"
surname <- "Fortuny"
paste(name, surname)   # Concatenate two strings

numbers <- c(1,1,2,3,4,3,4,8,7,6,9,8,7,9)
unique(numbers)   # Find unique values in a vector or list

length(numbers)   # Length of a vector or a list

ages <- c(23, 35, 30, NA)
is.na(ages)   # Find missing values
!is.na(ages)
valid_ages <- !is.na(ages)
ages[valid_ages]
ages[!is.na(ages)]

sum(ages)
sum(ages, na.rm = TRUE)   # na.rm ignores missing values

as.character(2)   # Change data type
as.numeric("2")
as.logical(1)

# Help

?unique()

# Custom functions

calculate_double <- function(number){
    result <- number * 2
    return(result)
}

calculate_double(5)

its_me <- function(name){
    if (name == "Didac") {
        me <- TRUE
    } else {
        me <- FALSE
    }
    return(me)
}

its_me("Ramon")


# EXERCICES 1 -------------------------------------------------------------

# 2. Create a function that, given a 2-element vector, returns 1 character with the name and surname
#    concatenated with a blank space in between (example: Given c("Didac", "Fortuny") returns "Didac Fortuny")

# 3. Create a function that returns whether a letter is a vowel (TRUE) or not (FALSE)


# LIBRARIES ---------------------------------------------------------------

install.packages("readxl")   # Download and install (only the first time)

library(readxl)   # Load functions within the library

pss_data <- read_excel("data/PSS-Sample DataSet no password.xlsx")


# DATA FRAMES -------------------------------------------------------------

install.packages("dplyr")   # Only the first time

library(dplyr)

## SHOW DATA FRAME

pss_data
View(pss_data)

## NUMBER OF ROWS

nrow(pss_data)

## COLUMNS

names(pss_data)

## SELECT A COLUMN

pss_data$Unit_of_the_hospital
pss_data[["Unit_of_the_hospital"]]

pss_data[, "Unit_of_the_hospital"]
pss_data %>% select(Unit_of_the_hospital)   # Use %>% to concatenate functions

## OPERATIONS WITH COLUMN DATA

toxicity <- pss_data$toxicity   # Column to a variable
max(toxicity)
min(toxicity)
mean(toxicity, na.rm = TRUE)

## CREATE NEW COLUMN

pss_data$Toxicity <- sample(100, size = nrow(pss_data), replace = TRUE)

pss_data$ToxicityPerOne <- pss_data$Toxicity / 100

## FACTOR COLUMNS

pss_data$Unit_of_the_hospital
class(pss_data$Unit_of_the_hospital)

pss_data$Unit_of_the_hospital <- as.factor(pss_data$Unit_of_the_hospital)
class(pss_data$Unit_of_the_hospital)
pss_data$Unit_of_the_hospital

## MANIPULATING DATA FRAME

# Filter

pss_data[pss_data$Round == 1, ]

pss_data %>% filter(Round == 1)

first_round <- pss_data %>% filter(Round == 1)

# Select

first_round[, "Unit_of_the_hospital"]

first_round %>% select(Unit_of_the_hospital)

# Arrange

first_round %>% arrange(where_you_or_your_care_taker_could_rest)
first_round_arranged <- first_round %>% arrange(where_you_or_your_care_taker_could_rest)

# Summarise

first_round %>% summarise(max_toxicity = max(toxicity), min_toxicity = min(toxicity))

# Mutate (new column)

first_round <- first_round %>% mutate(toxicity1000 = toxicity * 1000)

# Grouping

first_round %>% group_by(Unit_of_the_hospital) %>% summarise(max_toxicity = max(toxicity), min_toxicity = min(toxicity))


# EXERCICES ---------------------------------------------------------------

# 4. Using the pre-loaded mtcars dataser find the following:
#    a) List of all variables (columns).
#    b) Different possible number of cylinders.
#    c) Number of cars with carb = 4.
#    d) Mean mpg of the cars with 3 gears.
#    e) Mean mpg of the cars for each number of gears.
#    f) Create a new column with number of cylinders + number of gears.
#    g) Create a new dataframe with only the disp and hp columns and sort its rows by hp.

# READ AND SAVE FILES -----------------------------------------------------

## Excel

library(readxl)
pss_data <- read_excel("data/PSS-Sample DataSet no password.xlsx")

library(writexl)
write_xlsx(first_round, "first_round.xlsx", col_names = TRUE, format_headers = TRUE)

## CSV

pss_data <- read.csv("data/PSS-Sample DataSet.csv", sep = ";")
pss_data

write.csv(first_round, "first_round.csv")
write.table(first_round, "first_round.csv", sep = ";")