# R for MSF: 7.2 Shiny

# install.packages("shiny")
library(shiny) 

ui <- fluidPage(
  numericInput(inputId = "n",
               "Sample size", 
               value = 25),
  plotOutput(outputId = "hist")
  ) 

server <- function(input, output) { 
  output$hist <- renderPlot({     
    hist(rnorm(input$n))   
    }) 
  } 

shinyApp(ui = ui, server = server)
