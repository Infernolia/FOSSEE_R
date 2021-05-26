server = function(input, output){
  
  # server code
}
ui = bootstrapPage(
  div(class = "container-fluid",
      
      fluidRow(
        column(6, wellPanel(p("Column width 2"))),
        column(6, wellPanel(p("Column width 10")))),
      fluidRow(
        column(6, wellPanel(p("Column width 2"))),
        column(6, wellPanel(p("Column width 10")),
              
        )
      )
  )
)
shinyApp(ui = ui, server = server)