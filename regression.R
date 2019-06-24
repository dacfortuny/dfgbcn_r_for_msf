# EXPLORE DATA ------------------------------------------------------------

str(mtcars)

# CREATE LINEAR MODEL (LINEAR REGRESSION) ---------------------------------

# Define target and predictiors

relation <- mpg ~ cyl + disp + hp + drat + wt + qsec
class(relation)

# Create the model

fit <- lm(formula = relation, data = mtcars)
fit

# Perform predictions

predictions <- predict(fit, mtcars)

mtcars$prediction <- predictions

# Calculate error

mtcars$residual <- mtcars$mpg - mtcars$prediction
mtcars$residual_squated <- mtcars$residual ** 2
mean_error <- mean(mtcars$residual_squated)
rmse <- sqrt(mean_error)
rmse