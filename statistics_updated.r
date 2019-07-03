# R for MSF: 2. Statistics hands-on

# Random number generator ---------------------------------------------------------------
x <- rep(c("A", "B"), each=5)
x
sample(x)


# Sampling distributions --------------------------------------------------
# Uniform distribution
x <- runif(100)  # overwriting the element x
hist(x)
x <- runif(10000)
hist(x)

# Normal distribution
x <- rnorm(100)
hist(x)
hist(x, freq = FALSE)  # change y axis to density instead of frequency
lines(density(x), col="red", lwd=4)


# Binomial distribution: discrete probability distribution of the number of successes 
# in a sequence of n independent experiments, each asking a yes–no question, and each 
# with its own boolean-valued outcome.
# In R we can toss a fair coin 10 times, by
rbinom(n=10, size=1, prob=0.5)
rbinom(10, 1, 0.5)

# and a biased coin (succes probability=0.8) 5 times by
rbinom(5, 1, 0.8)

# This experiment follows a Bernoulli distribution since there are only 2 options available: heads or tails
rbern  # try autocomplete
# look for bernoulli


###############
## Go to ppt ##
###############

# Descriptive statistics: categorical data --------------------------------------------------
# Read data
# install.packages("readxl")
library(readxl)
pss_data <- read_excel("data/PSS-Sample DataSet no password.xlsx")
View(pss_data)

# Statistics
freq_table <- table(pss_data$Unit_of_the_hospital)

prop.table(freq_table)


freq_table <- table(pss_data$Please_write_down_t_the_survey_minutes)
freq_table
barplot(freq_table)  # weird order in x axis

names(freq_table)
as.integer(names(freq_table))
order(as.integer(names(freq_table)))
freq_table <- freq_table[order(as.integer(names(freq_table)))]
freq_table
barplot(freq_table)
cumsum(freq_table)
barplot(cumsum(freq_table))


# Descriptive statistics: numerical data --------------------------------------------------
age <- pss_data$age_years
hist(age)
mean(age)

# Quantiles
quantile(age)
IQR(age)
?quantile
quantile(age, probs = seq(from=0, to=1, by=0.1))

# Standard deviation
sd(age)

###############
## Go to ppt ##
###############

# Statistical tests: checking normality --------------------------------------------------
age <- pss_data$age_years
hist(age)
?qqplot
qqnorm(age)

minutes <- pss_data$Please_write_down_t_the_survey_minutes
qqnorm(minutes)
minutes
minutes <- as.numeric(minutes)
qqnorm(minutes)
qqline(minutes, col = 2)
hist(minutes)

# Statistical tests: Mann-Whitney U test --------------------------------------------------
# Is there a difference in age in the following populations: 
# people who got stolen that those who don't?
# H0: Samples don't differ greatly.
# Ha: Samples differ greatly.
table(pss_data$did_something_get_stolen)
?wilcox.test
wilcox.test(age ~ pss_data$did_something_get_stolen) 
# p-value: 0.5278 > 0.05 => samples don't differ greatly

# EXERCISES ---------------------------------------------------------------

# 1. Do these populations differ significantly in age: 
# people in maternity_gynecology_ward and nicu_neonatology?
# Tip: exploratory analysis - Kolmogorov-Smirnov (ks.test)

age

pss_data$Unit_of_the_hospital

# install.packages("dplyr")
library(dplyr)
x <- pss_data %>% filter(Unit_of_the_hospital == "maternity_gynecology_ward") %>% select(age_years) 
y <- pss_data %>% filter(Unit_of_the_hospital == "nicu_neonatology") %>% select(age_years) 

ks.test(x, y)
class(x)
x <- as.numeric(unlist(x))
y <- as.numeric(unlist(y))
ks.test(x, y)


table(pss_data$Unit_of_the_hospital, pss_data$age_years)
table(pss_data$Unit_of_the_hospital, round(pss_data$age_years, -1))
?ks.test
x <- subset(pss_data, Unit_of_the_hospital == "maternity_gynecology_ward", select=age_years)
y <- subset(pss_data, Unit_of_the_hospital == "nicu_neonatology", select=age_years)
ks.test(x, y)
class(x)
mode(x)
unlist(x)
as.numeric(unlist(x))
x <- as.numeric(unlist(x))
y <- as.numeric(unlist(y))
ks.test(x, y)
# p-value: 0.06289 > 0.05 => not reject => x and y are drawn from the same distribution

