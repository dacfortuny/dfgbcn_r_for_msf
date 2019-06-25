# R for MSF: 7.1 Shiny

install.packages("shiny")


# Examples ----------------------------------------------------------------
library(shiny)
runExample("01_hello")      # a histogram
runExample("02_text")       # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg")        # global variables
runExample("05_sliders")    # slider bars
runExample("06_tabsets")    # tabbed panels
runExample("07_widgets")    # help text and submit buttons
runExample("08_html")       # Shiny app built from HTML
runExample("09_upload")     # file upload wizard
runExample("10_download")   # file download wizard
runExample("11_timer")      # an automated timer

# Statistics visualizer: http://www.intro-stats.com/
# Ebola model: https://gallery.shinyapps.io/Ebola-Dynamic/
# Superzip: http://shiny.rstudio.com/gallery/superzip-example.html