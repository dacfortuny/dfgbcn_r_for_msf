# R for MSF: 2. Statistics hands-on

# Random number generator ---------------------------------------------------------------
x <- rep(c("A", "B"), each=5)
x
sample(x)


# Sampling distributions --------------------------------------------------
# Normal distribution
x <- rnorm(100)
hist(x)
hist(x, freq = FALSE)
lines(density(x), col="red", lwd=4)


# Uniform distribution
x <- runif(100)
hist(x)
x <- runif(10000)
hist(x)

# Binomial distribution: discrete probability distribution of the number of successes 
# in a sequence of n independent experiments, each asking a yes–no question, and each 
# with its own boolean-valued outcome.
# In R we can toss a fair coin 10 times, by
rbinom(10, 1, 0.5)
rbinom(10, 1, 0.5)

# and a biased coin (succes probability=0.8) 5 times by
rbinom(5, 1, 0.8)


# Read data ---------------------------------------------------------------
library(readxl)
pss_data <- read_excel("data/PSS-Sample DataSet no password.xlsx")
View(pss_data)


# Descriptive statistics: categorical data --------------------------------------------------
freq_table <- table(pss_data$Unit_of_the_hospital)

getmode <- function(x) {
  uniq_x <- unique(x)
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}
getmode(pss_data$Unit_of_the_hospital)

prop.table(freq_table)


freq_table <- table(pss_data$Please_write_down_t_the_survey_minutes)
barplot(freq_table)
freq_table
freq_table <- freq_table[order(as.integer(names(freq_table)))]
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
quantile(age, probs = seq(0, 1, 0.1))

# Standard deviation
sd(age)

# Statistical tests: checking normality --------------------------------------------------
hist(age)
?qqplot
qqnorm(age)
qqline(age, col = 2)

qqplot(age, rnorm(n=length(age), mean=mean(age), sd=sd(age)))

minutes <- pss_data$Please_write_down_t_the_survey_minutes
qqnorm(minutes)
minutes
minutes <- as.integer(minutes)
qqnorm(minutes); qqline(minutes, col = 2)
qqplot(minutes, rnorm(n=length(minutes), mean=mean(minutes), sd=sd(minutes)))
hist(minutes)

# Statistical tests: Mann-Whitney U test --------------------------------------------------
# H0: Samples don’t differ greatly.
# Ha: Sample differ greatly.
table(pss_data$did_something_get_stolen)
wilcox.test(age ~ pss_data$did_something_get_stolen) 
# p-value: 0.5278 -> samples don't differ greatly

