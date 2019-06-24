# R for MSF: 5. Plots

install.packages("ggplot2")
library(ggplot2)


# Histogram -----------------------------------------------------------------
mtcars <- mtcars
# ggplot(), the structure of a plot
ggplot(mtcars, aes(x=mpg))

# histogram
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram()

# change the width of the bins
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(binwidth=5)

# add titles
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(binwidth=5) +
  ggtitle("Distribution of mpg") +
  ylab("frequency") +
  xlab("mile per Galon")

# customize colors
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(binwidth=5, color="blue", fill="yellow") +
  ggtitle("Distribution of mpg") +
  ylab("frequency") +
  xlab("mile per Galon")


# Density plot -----------------------------------------------------------------
ggplot(mtcars, aes(x=mpg)) +
  geom_density(color="red", fill="blue")


# Scatterplot -----------------------------------------------------------------
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point()

# which are the paremeters of geom_point?
?geom_point
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(alpha=0.6)

# what is alpha?
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(alpha=0.06)

# can we add statistical models?
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(alpha=0.6) +
  stat_smooth(method="lm", col="red", se=FALSE)

# why se=FALSE? what is it?
?stat_smooth
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(alpha=0.6) +
  stat_smooth(method="lm", col="red")

# add titles
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(alpha=0.6) +
  stat_smooth(method="lm", col="red") +
  ggtitle("Correlation of wt and mpg")

# add a 3rd dimension as a color
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) +
  geom_point(alpha=0.6) +
  stat_smooth(method="lm", col="red") +
  ggtitle("Correlation of wt and mpg")

# cyl is a continuous variable -> let's change it
ggplot(mtcars, aes(x=wt, y=mpg, color=as.character(cyl))) +
  geom_point(alpha=0.6) +
  stat_smooth(method="lm", col="red") +
  ggtitle("Correlation of wt and mpg")


# Barplot (one variable) -----------------------------------------------------------------
mpg
ggplot(mpg, aes(x=fl)) +
  geom_bar(color="red", fill="blue")


# Boxplot -----------------------------------------------------------------
ggplot(mtcars, aes(x=cyl, y=mpg)) +
  geom_boxplot()

# we get warning because cyl is set as numeric
ggplot(mtcars, aes(x=as.character(cyl), y=mpg)) +
  geom_boxplot() +
  xlab("number of cylinders") +
  ggtitle("boxplots for mpg")

# let's color it
ggplot(mtcars, aes(x=as.character(cyl), y=mpg, fill=as.character(cyl))) +
  geom_boxplot() +
  xlab("number of cylinders") +
  ggtitle("boxplots for mpg")



# Violin ------------------------------------------------------------------
ggplot(mtcars, aes(x=as.character(cyl), y=mpg, fill=as.character(cyl))) +
  geom_violin() +
  xlab("number of cylinders") +
  ggtitle("violin for mpg")


# Compare distributions ---------------------------------------------------
ggplot(mpg, aes(class, hwy, color=class)) +
  geom_jitter()


# Interactive plots ---------------------------------------------------
install.packages("plotly")
library(plotly)
d <- diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(d, x=~carat, y=~price, color=~carat, size=~carat, text=~paste("Clarity: ", clarity))
