library(shiny)

ui <- fluidPage(
  fluidRow(
    column(2,
           "sidebar"
    ),
    column(10,
           "main"
    )
  )
)

# Server function
server <- function(input, output) {
  
}

# Run the application
shinyApp(ui = ui, server = server)