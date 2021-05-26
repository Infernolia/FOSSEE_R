library(shiny)

shinyApp(
  shinyUI(
    navbarPage("My Application",
               tabPanel("Component 1", uiOutput('page1')),
               tabPanel("Component 2"),
               tabPanel("Component 3")
    )
  ),
  shinyServer(function(input, output, session) {
    output$page1 <- renderUI({
      sidebarLayout(
        sidebarPanel(
         
                fluidRow(
                  column(6, wellPanel(p("Column width 2"))),
                  column(6, wellPanel(p("Column width 10")))),
                fluidRow(
                  column(6, wellPanel(p("Column width 2"))),
                  column(6, wellPanel(p("Column width 10")),
                         
                  )
                ),
          selectizeInput(
            'id', label = "Comments", choices =   NULL,multiple=FALSE,selected="X2015",
            options = list(create = TRUE,placeholder = 'Choose the comments')
          ),
        
        ),
        
        mainPanel(
          fluidRow(
            column(6, wellPanel(p("Code editor"))),
            column(6, wellPanel(p("Output"))),
         
                   
            
          ),
        )
      )
    })
    
    output$distPlot <- renderPlot({ plot(1) })
  })
)