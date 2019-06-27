# R for MSF: 7.3 Shiny

# install.packages("shiny")
library(shiny) 
source("app_data.r")

# Define UI ----
ui <- fluidPage(
  titlePanel("Patient satisfaction"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Analyse the results from
               the executed survey."),
      
      radioButtons("round", 
                   label = "Choose the data to display",
                   choices = list("Round 1" = 1,
                                  "Round 2" = 2,
                                  "Compare" = -1),
                   selected = c(1)),
      
      selectInput("variable", 
                  label = "Choose a variable to display",
                  choices = vars_list,
                  selected = vars_list[1])
      ),
    
    mainPanel(
      # textOutput("selected_data"),
      # textOutput("selected_var")

      plotOutput("selected_var")
    ),
  )
) 

# Define server logic ----
server <- function(input, output) {
  # output$selected_data <- renderText({ 
  #   paste("You have selected this", input$data)
  # })
  # 
  # output$selected_var <- renderText({ 
  #   paste("You have selected this", input$var)
  # })
  

  output$selected_var <- renderPlot({
    round_selected <- input$round
    labels <- list(ylab("Frequency"),
                   xlab(input$var),
                   ggtitle(paste("Distribution of", input$var)),
                   labs(fill="Round")
    )
    theme <- theme(plot.title = element_text(size = 30),
                   axis.title.x = element_text(size = 15),
                   axis.title.y = element_text(size = 15),
                   axis.text = element_text(size = 12))
    
    if (round_selected != -1) {
      data <- pss_data %>% filter(Round == round_selected)
      variable_data <- data[, input$variable]
      if (class(variable_data) == "numeric") {
        ggplot(data, aes(variable_data)) +
          stat_count(fill="#00bfc4") +
          labels + theme
      } else {
        ggplot(data, aes(variable_data)) +
          geom_bar(fill="#00bfc4") +
          labels + theme
      }
    } else {
      data <- pss_data
      variable_data <- pss_data[, input$variable]
      if (class(variable_data) == "numeric") {
        ggplot(data, aes(variable_data, fill=as.character(Round))) +
          stat_count(position=position_dodge()) +
          labels + theme
      } else {
        ggplot(data, aes(variable_data, fill=as.character(Round))) +
          geom_bar(position=position_dodge()) +
          labels + theme
      }
    }
    
  })
} 

shinyApp(ui = ui, server = server)
