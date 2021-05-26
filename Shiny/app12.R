


library(shiny)
library(shinydashboard)
library(shinydashboard)
library( shinyWidgets )

ui <- dashboardPage(
  dashboardHeader(title = "FOSSEE R Team"),
  dashboardSidebar(sidebarMenu(
    menuItem("Textbook Companion", tabName = "Textbook Companion", icon = icon("bar-chart")),
    fileInput("file", "Zip File", buttonLabel = "Upload..."),
    selectInput("country", label = h5("Select Comment Type"),
                choices = list("Page Number","The answer may slightly vary due to rounding off values.", "The answer provided in the textbook is wrong.","The answer may vary due to difference in representation.", "The answer may vary due to the change in units."), selected = "DE"),
    numericRangeInput("daterange", label=h5("Examples range:"),
                      value = c(100, 400)
    ),
    textInput("queries", label = h5("Search Queries"),
              width = "100%", 
              value = 'nhl,nba,nfl'
    ),
    
    actionButton("downloadData", label = "Fix Given TBC Example", class = NULL),
    tags$style(type="text/css", "#downloadData {padding: 10px; margin: 20px;}")
  ,
    downloadButton("downloadData", label = "Download Markdown", class = NULL),
    tags$style(type="text/css", "#downloadData {padding: 10px; margin: 20px;}")
  )
  ),
  dashboardBody(
    fluidRow
    (
      box("Code Viewer"),
      box("Final Code Output")

    ),
    
    fluidRow
    (
      column(6,div(style = "height:700px;background-color: yellow;", "library(shiny)\n runApp(list(\n  ui = fluidPage(\n  fluidRow(\n      column(6,div(style = \"height:200px;background-color: yellow;", "Topleft\")),n      column(6,div(style = \"height:100px;background-color: blue;", "Topright\"))),\n    fluidRow(\n      column(6,div(style = \"height:100px;background-color: green;", "Bottomleft\")),\n      column(6,div(style = \"height:150px;background-color: red;", "Bottomright\")))\n  ),\n  server = function(input, output) {\n  }\n))")),
      column(6,div(style = "height:700px;background-color: lightgreen;", "library(shiny)\n runApp(list(\n  ui = fluidPage(\n  fluidRow(\n      column(6,div(style = \"height:200px;background-color: yellow;", "Topleft\")),n      column(6,div(style = \"height:100px;background-color: blue;", "Topright\"))),\n    fluidRow(\n      column(6,div(style = \"height:100px;background-color: green;", "Bottomleft\")),\n      column(6,div(style = \"height:150px;background-color: red;", "Bottomright\")))\n  ),\n  server = function(input, output) {\n  }\n))"))),
    ),
    )

  



server <- function(input, output) {}


shinyApp(ui, server)
