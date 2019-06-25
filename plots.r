# R for MSF: 5. Plots

# install.packages("ggplot2")
library(ggplot2)


# Histogram -----------------------------------------------------------------
mtcars <- mtcars
# ggplot(), the structure of a plot
# aes(), set aesthetics
ggplot(mtcars, aes(x=mpg))

# histogram
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram()

# change the width of the bins
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(binwidth=3)

# add titles
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(binwidth=5) +
  ggtitle("Distribution of mpg") +
  ylab("frequency") +
  xlab("mile per Galon")

# customize colors
# check color palette: http://sape.inf.usi.ch/quick-reference/ggplot2/colour
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(binwidth=5, color="darkturquoise", fill="cadetblue4") +
  ggtitle("Distribution of mpg") +
  ylab("frequency") +
  xlab("mile per Galon")

# compare distributions #1
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(binwidth=5, aes(fill=as.character(cyl))) +
  ggtitle("Distribution of mpg") +
  ylab("frequency") +
  xlab("mile per Galon")

# compare distributions #2
ggplot(mtcars, aes(x=mpg, fill=as.character(cyl))) +
  geom_histogram(binwidth=5, position=position_dodge()) +
  ggtitle("Distribution of mpg") +
  ylab("frequency") +
  xlab("mile per Galon")

# compare distributions #3
ggplot(mtcars, aes(x=mpg, fill=as.character(cyl))) + 
  geom_histogram(binwidth=5, alpha=0.5, aes(y=..density..), position='identity') +
  ggtitle("Distribution of mpg") +
  ylab("frequency") +
  xlab("mile per Galon")

# compare distributions #4
x <- table(round(mtcars$mpg/5)*5, mtcars$cyl)
df_mtcars <- data.frame(mpg = rep(rownames(x), length(unique(mtcars$cyl))),
                        cyl = rep(unique(mtcars$cyl), each=nrow(x)),
                        value = unlist(sapply(1:3, function(i) {list(as.numeric(x[, i]))})))
ggplot(df_mtcars, aes(x=mpg, y=value, fill=as.character(cyl))) + 
  geom_bar(position=position_dodge(), stat="identity") +
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

# and change legend title
ggplot(mtcars, aes(x=as.character(cyl), y=mpg, fill=as.character(cyl))) +
  geom_boxplot() +
  xlab("number of cylinders") +
  ggtitle("boxplots for mpg") +
  labs(fill="Cylinders") +
  theme(legend.position="top")


# Violin ------------------------------------------------------------------
ggplot(mtcars, aes(x=as.character(cyl), y=mpg, fill=as.character(cyl))) +
  geom_violin() +
  xlab("number of cylinders") +
  ggtitle("violin for mpg") +
  labs(fill="Cylinders") +
  theme(legend.position="top")


# Compare distributions ---------------------------------------------------
ggplot(mpg, aes(class, hwy, color=class)) +
  geom_jitter()


# Interactive plots ---------------------------------------------------
install.packages("plotly")
library(plotly)
d <- diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(d, x=~carat, y=~price, color=~carat, size=~carat, text=~paste("Clarity: ", clarity))
